/*
 *  demonstrates
 *    genning textures with topojson and d3
 *    using d3 for transitions and interpolation,
 *    and three.js for rendering the globe
 *
 *  adapted from Mike Bostock's World Tour, http://bl.ocks.org/mbostock/4183330
 *  and Steve Hall's Interactive WebGL Globes with THREE.js and D3,
 *    http://www.delimited.io/blog/2015/5/16/interactive-webgl-globes-with-threejs-and-d3
 *
 *  all cruft and smells are mine.
 */
(function() {

  var genKey = function (arr) {
    var key = '';
    arr.forEach(function (str) {
      key += str.toLowerCase().replace(/[^a-z0-9]/g, '');
    });
    return key;
  };

  var peeps = {
    data : [],
    keys : {},
    init :  function (people) {
      var self = this;
      this.data = people;
      this.data.forEach(function(peep, px){
        var key = genKey([ peep.firstname, peep.lastname, px + '' ])
        peep.id = key;
        self.keys[key] = { idx : px };
      });
    },
    find : function(key) {
      return this.data[this.keys[key].idx];
    }
  };

  var list = {
    el: {},
    selectBox : {},
    listBox : {},
    init : function (opts) {
      var self     = this;
      var template = opts.template;
      var select   = document.createElement('select');
      var ul       = document.createElement('ul');

      this.el = d3.select(opts.selector);

      peeps.data.forEach(function (peep) {
        select.appendChild(list.crtOption(peep));
        ul.appendChild(list.crtLi(peep, opts.template));
      });
      var showAll = { firstname : 'Show', lastname : 'All', id : 'all'}
      select.appendChild(this.crtOption(showAll));
      this.selectBox = d3.select(opts.selector + ' .select-box');
      this.selectBox.node().appendChild(select);

      this.listBox = d3.select(opts.selector + ' .list-box');
      this.listBox.node().appendChild(ul);

      this.el.selectAll('li img').on('click', function () {
        var id = this.parentElement.parentElement.id;
        var peep = peeps.find(id);
        world.rotateTo([ peep ], 0, 1);
      });

      this.el.select('select').on('change', function () {
        if ( this.value == 'all' ) {
          world.rotateTo(peeps.data, 0, peeps.data.length);
        } else {
          world.rotateTo([peeps.find(this.value)], 0, 1);
        }
      });
    },

    crtOption : function (opt) {
      var option = document.createElement('option');
      option.value = opt.id;
      option.textContent = opt.firstname + ' ' + opt.lastname;
      return option;
    },

    crtLi : function (peep, template) {
      var li = document.createElement('li');
      li.id = peep.id;

      var peepBox = document.querySelector(template).cloneNode(true);

      var peepName = peepBox.querySelector('.peep-name');
      peepName.textContent = peep.firstname + ' ' + peep.lastname;

      var peepImg = peepBox.querySelector('img');
      peepImg.src = peep.img;
      peepImg.alt = 'image of ' + peep.firstname + ' ' + peep.lastname;

      var peepLink = peepBox.querySelector('a');
      peepLink.href = 'https://twitter.com/' + peep.twitter

      var peepHandle = peepBox.querySelector('.twitter');
      peepHandle.textContent = '@' + peep.twitter;

      li.appendChild(peepBox);
      return li;
    },

    transScroll : function (id) {
      var offsetTop = document.querySelector('#' + id).offsetTop;
      var scrollTween = function (t) {
        return function() {
          var terpRound = d3.interpolateRound(this.scrollTop, offsetTop);
          return function(t) {
            this.scrollTop = terpRound(t);
          };
        };
      };

      this.selectBox.select('select').node().value = id;

      this.listBox.transition()
                  .duration(1250)
                  .tween('scrollTween', scrollTween(0));
    }
  };

  var twoPI = Math.PI * 2;
  var halfPI = Math.PI / 2;;

  var world = {
        el : {},
        init : function (opts) {
          d3.select('.loading').transition()
                               .duration(500)
                               .style('opacity', 0)
                               .remove();
          this.el = d3.select(opts.selector);
          this.slug = this.el.select(".slug");

          this.gratiColor = d3.rgb(this.sunColor).darker().toString();
          this.landColor = d3.rgb(this.countryColor).darker(0.5).toString();
          this.borderColor = d3.rgb(this.landColor).darker().toString();

          var countries = topojson.feature(opts.data, opts.data.objects.countries).features;

          this.geoCache.init(countries, opts.names);

          this.initD3(opts);
        },

        geoCache : {
          keys : {},
          init :  function (countries, names) {
            var self = this;
            this.countries = countries.filter(function(d) {
              return names.some(function(n) {
                if (d.id == n.name) {
                  d.name = d.id;
                  return d.id = n.id;
                }
              });
            }).sort(function(a, b) {
              return a.name.localeCompare(b.name);
            });
            this.countries.forEach(function(country, cx){
              self.keys[country.id] = { name: country.name, idx : cx };
            });
          },

          find : function(id) {
            var id = id + '';
            return this.keys[id];
          }
        },

        sunColor     : '#fbfccc',
        countryColor : '#1d721d',
        waterColor   : '#0419a0',
        gratiColor   : '',
        landColor    : '',
        borderColor  : '',
        initD3 : function(opts) {
          // creates the textures for three.js globe
          var land = topojson.feature(opts.data, opts.data.objects.countries);
          var borders = topojson.mesh(
            opts.data, opts.data.objects.countries, function(a, b) { return a !== b; }
          );
          var mapTexture = this.genTexture({ land: land, borders : borders });
          var self = this;

          // var start = Date.now();
          peeps.data.forEach(function(peep, px) {
            var marker = self.genGeoMarker( [.7, .4], peep.location.lon, peep.location.lat );
            var idx = self.geoCache.find(peep.location.id).idx;
            var country = self.geoCache.countries[idx];
            peep.texture = self.genTexture({ country: country, marker: marker });
          });
          // console.log('Peep textures genned in ' + (Date.now() - start) + 'ms')

          this.initThree({ selector: opts.selector, mapTexture : mapTexture });
        },

        glEl : {},
        scene : new THREE.Scene(),
        globe : new THREE.Object3D(),
        initThree : function(opts) {
          var segments = 155; // number of vertices. Higher = better mouse accuracy, slower loading

          // Set up cache for country textures
          this.glEl = this.el.select('.three-box');
          var glRect = this.glEl.node().getBoundingClientRect();
          var canvas = this.glEl.append('canvas')
                                .attr('width', glRect.width)
                                .attr('height', glRect.height);

          canvas.node().getContext('webgl');

          this.renderer = new THREE.WebGLRenderer({ canvas: canvas.node(), antialias: true });
          this.renderer.setSize(glRect.width, glRect.height);
          this.renderer.setClearColor( 0x000000 );
          this.glEl.node().appendChild(this.renderer.domElement);

          this.camera = new THREE.PerspectiveCamera(70, glRect.width / glRect.height, 1, 5000);
          this.camera.position.z = 1000;

          var ambientLight = new THREE.AmbientLight(this.sunColor);
          this.scene.add(ambientLight);

          var light = new THREE.DirectionalLight( this.sunColor, .85 );
          light.position.set(this.camera.position.x, this.camera.position.y + glRect.height/2, this.camera.position.z);
          this.scene.add( light );

          // base globe with 'water'
          var waterMaterial = new THREE.MeshPhongMaterial({ color: this.waterColor, transparent: true });
          var sphere = new THREE.SphereGeometry(200, segments, segments);
          var baseGlobe = new THREE.Mesh(sphere, waterMaterial);
          baseGlobe.rotation.y = Math.PI + halfPI; // centers inital render at lat 0, lon 0

          // base map with land, borders, graticule
          var mapMaterial = new THREE.MeshPhongMaterial({ map: opts.mapTexture, transparent: true });
          var baseMap = new THREE.Mesh(new THREE.SphereGeometry(200, segments, segments), mapMaterial);
          baseMap.name = 'land';
          baseMap.rotation.y = Math.PI + halfPI;

          // add the two meshes to the container object
          this.globe.scale.set(2.8, 2.8, 2.8);
          this.globe.add(baseGlobe);
          this.globe.add(baseMap);
          this.scene.add(this.globe);
          this.renderer.render(this.scene, this.camera);

          var self = this;
          window.addEventListener('resize', function(evt) {
            requestAnimationFrame(function () {
              var glRect = self.glEl.node().getBoundingClientRect();
              self.camera.aspect = glRect.width / glRect.height;
              self.camera.updateProjectionMatrix();
              self.renderer.setSize(glRect.width, glRect.height);
              self.renderer.render(self.scene, self.camera);
            });
          });
        },

        rotateTo : function (spinTo, sx, sLen) {
          var self = this;
          var globe = this.globe;
          var peep = spinTo[sx];

          var from = {
            x: globe.rotation.x,
            y: globe.rotation.y
          };

          var to = {
            x: this.latToX3(peep.location.lat),
            y: this.lonToY3(peep.location.lon)
          }

          var peepMesh = this.genMesh(peep);
          globe.add(peepMesh);

          var hasta = globe.getObjectByName(this.currentId);
          list.transScroll(peep.id);
          this.setSlug(peep);
          if (hasta) {
            globe.remove(hasta)
            requestAnimationFrame(function() { self.renderer.render(self.scene, self.camera); });
          }
          this.currentId = peep.id;

          requestAnimationFrame(function() { self.renderer.render(self.scene, self.camera); });

          d3.transition()
              .delay(500)
              .duration(1250)
              .each('start', function() {
                self.terpObj = d3.interpolateObject(from, to);
              })
              .tween('rotate', function() {
                  return function (t) {
                    globe.rotation.x = self.terpObj(t).x;
                    globe.rotation.y = self.terpObj(t).y;
                    requestAnimationFrame(function() { self.renderer.render(self.scene, self.camera); });
                  };
              })
            .transition()
              .each('end', function () {
                sx += 1;
                if (sx < sLen) {
                  self.rotateTo(spinTo, sx, sLen);
                } else {
                  return;
                }
              });
        },

        setSlug : function (peep) {
          var self = this;

          this.slug.transition()
                   .duration(500)
                   .style("opacity", 0)
                   .each('end', function () {
                      self.slug.select(".slug-img")
                               .style("background-image", "url(" + peep.img + ")");

                      self.slug.select(".name")
                          .text(peep.firstname + " " + peep.lastname + " - ");

                      self.slug.select("a")
                               .attr("href", "https://twitter.com/" + peep.twitter)

                      self.slug.select(".twitter")
                               .text("@" + peep.twitter);

                      self.slug.select('.city')
                               .text(peep.location.city + ", ");

                      self.slug.select('.loc').text( function () {
                        return peep.location.state ? peep.location.state + ", " + peep.location.country : peep.location.country;
                      });
                   })
                   .transition()
                   .duration(1250)
                   .style("opacity", 1);
        },

        genGeoMarker : function (angles, lon, lat) {
          var marker = [];
          angles.forEach(function (angle) {
            marker.push( d3.geo.circle().origin([lon, lat]).angle(angle)() );
          });
          return marker;
        },

        genTexture : function(opts) {
          var projection = d3.geo.equirectangular().translate([1024, 512]).scale(325);
          var graticule;
          var canvas = d3.select('body').append('canvas')
                                        .style('display', 'none')
                                        .attr('width', '2048px')
                                        .attr('height', '1024px');

          var ctx = canvas.node().getContext('2d');

          var path = d3.geo.path()
                           .projection(projection)
                           .context(ctx);

          if (opts.land) {
            graticule = d3.geo.graticule();
            ctx.fillStyle = this.landColor, ctx.beginPath(), path(opts.land), ctx.fill();
            ctx.strokeStyle = this.borderColor, ctx.lineWidth = .5, ctx.beginPath(), path(opts.borders), ctx.stroke();
            ctx.strokeStyle = this.gratiColor, ctx.lineWidth = .25, ctx.beginPath(), path(graticule()), ctx.stroke();
          }
          if (opts.country) {
            ctx.fillStyle = this.countryColor, ctx.beginPath(), path(opts.country), ctx.fill();
          }
          if (opts.marker) {
            ctx.fillStyle = '#fff', ctx.beginPath(), path(opts.marker[0]), ctx.fill();
            ctx.strokeStyle = '#000', ctx.lineWidth = 1.5, ctx.beginPath(), path(opts.marker[0]), ctx.stroke();
            ctx.fillStyle = '#e500ff', ctx.beginPath(), path(opts.marker[1]), ctx.fill();
          }
          // DEBUGGING, disable when done.
          // testImg(canvas.node().toDataURL());

          var texture = new THREE.Texture(canvas.node());
          texture.needsUpdate = true;

          canvas.remove();

          return texture;
        },

        genMesh : function (peep) {
          var material, mesh, rotation;
          var segments = 155;
          material = new THREE.MeshPhongMaterial({ map: peep.texture, transparent: true });
          mesh = new THREE.Mesh(new THREE.SphereGeometry(200, segments, segments), material);
          mesh.name = peep.id;
          rotation = this.globe.getObjectByName('land').rotation;
          mesh.rotation.x = rotation.x;
          mesh.rotation.y = rotation.y;
          return mesh;
        },


        /*
          x3ToLat & y3ToLon adapted from Peter Lux,
          http://www.plux.co.uk/converting-radians-in-degrees-latitude-and-longitude/
          convert three.js rotation.x & rotation.y (radians) to lat/lon

          globe.rotation.x + blah === northward
          globe.rotation.y - blah === southward
          globe.rotation.y + blah === westward
          globe.rotation.y - blah === eastward
        */
        x3ToLat : function(rad) {
          // convert radians into latitude
          // 90 to -90
          // first, get everything into the range -2pi to 2pi
          rad = rad % (Math.PI*2);

          // convert negatives to equivalent positive angle
          if (rad < 0) {
            rad = twoPI + rad;
          }

          // restrict to 0 - 180
          var rad180 = rad % (Math.PI);

          // anything above 90 is subtracted from 180
          if (rad180 > Math.PI/2) {
            rad180 = Math.PI - rad180;
          }
          // if greater than 180, make negative
          if (rad > Math.PI) {
            rad = -rad180;
          } else {
            rad = rad180;
          }

          return (rad/Math.PI*180);
        },

        latToX3 : function(lat) {
          return (lat / 90) * halfPI;
        },

        y3ToLon : function(rad) {
          // convert radians into longitude
          // 180 to -180
          // first, get everything into the range -2pi to 2pi
          rad = rad % twoPI;
          if (rad < 0) {
            rad = twoPI + rad;
          }
          // convert negatives to equivalent positive angle
          var rad360 = rad % twoPI;

          // anything above 90 is subtracted from 360
          if (rad360 > Math.PI) {
            rad360 = twoPI - rad360;
          }

          // if greater than 180, make negative
          if (rad > Math.PI) {
            rad = -rad360;
          } else {
              rad = rad360;
          }
          return rad / Math.PI * 180;
        },

        lonToY3 : function(lon) {
          return -(lon / 180) * Math.PI;
        }
  };

  function testImg(dataURI) {
    var img = document.createElement('img');
    img.src = dataURI;
    img.width = 2048;
    img.height = 1024;
    document.body.appendChild(img);
  }

  var loaded = function (error, people, geojson, names) {
    var listOpts = {
          selector : '.peeps-box',
          template : '#templates .peep-box'
        };
    var worldOpts = {
          selector : '.globe-box',
          data     : geojson,
          names    : names
        };
    peeps.init(people);
    world.init(worldOpts);
    list.init(listOpts);
  };

  window.addEventListener('DOMContentLoaded', function () {
    queue()
      .defer(d3.json, 'peeps.json')
      .defer(d3.json, 'world.json')
      .defer(d3.tsv, 'world-country-names.tsv')
      .await(loaded);
  });

}());