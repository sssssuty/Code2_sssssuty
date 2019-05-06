var weather, temP, humiditY, winD, viS, r, g, b, a, rgba, siz, len, tex;
var api = "http://api.openweathermap.org/data/2.5/weather?q=";
var apiKey = "&APPID=d9e40004dfa7e1f572ca81f1d08a5109";
var units = "&unit=metric";
var counter = -1;

function setup(){
    createCanvas(1200,580);

    var button = select("#submit");
    button.mousePressed(weatherAsk);

    input = select("#city");
    fill(0);

    siz = 10;

    
}

function weatherAsk(){
    if (input.value() === ""){
        console.log("hhh");
    }else{
        counter = counter + 1;
        len = input.value().length;

        background(255);
        fill(0);
        textSize(1360/len);
        textAlign(CENTER);
        tex = input.value();
        text(tex, width/2, height/2+30);

        var url = api + input.value() + apiKey + units;
        loadJSON(url, gotData);
        input.value("");
    }

    var appendColor = document.createElement("div");
    appendColor.setAttribute("class", "option");
    appendColor.setAttribute("onclick", "colorFunction()");
    appendColor.setAttribute("id","colorOption" + counter);
    document.getElementById('colorOptions').appendChild(appendColor);

    var appendStroke = document.createElement("div");
    appendStroke.setAttribute("class", "option1");
    appendStroke.setAttribute("onclick", "strokeFunction()");
    appendStroke.setAttribute("id","strokeOption" + counter);
    document.getElementById('strokeOptions').appendChild(appendStroke);

}

function gotData(data){
    weather = data;
    // console.log(weather);
}

function draw(){
    if (weather){
        temP = weather.main.temp;
        humiditY = weather.main.humidity;
        winD = weather.wind.speed;
        viS = weather.visibility;
        if (temP > 300){
            temP = 300;
        }
        if(temP < 284){
            temP = 284;
        }
        if (humiditY > 90){
            humiditY = 90;
        }
        if(humiditY < 20){
            humiditY = 20;
        }
        if (winD > 3.5){
            winD = 3.5;
        }
        if(winD < 1){
            winD = 1;
        }
        // print(temP);
        r = map(temP, 284, 300, 0, 255);
        g = map(humiditY, 20,90,0,255);
        b = map(winD, 1,3.5,0,255);
        a = map(viS, 0, 30000,0,255);
        rgba = "("+ r + "," + g + "," + b +")";
        // + "," + a
        var selectColor = select("#colorOption" + counter);
        selectColor.style("background-color", "rgb" + rgba);
        document.getElementById("strokeOption" + counter).style.width = "3vw";
        document.getElementById("strokeOption" + counter).style.height = len/3 + "vw";
        document.getElementById("strokeOption" + counter).style.color = "red";
        weather = false;
    }
    if (mouseIsPressed){
            fill(r,g,b);
            noStroke();
            ellipse(mouseX, mouseY, siz, siz);
    }
    if (frameCount % 200 === 0){
        checkPixel();
    }
}

function colorFunction(){
    var colorString = event.target.style.backgroundColor;
    var colorString1 = colorString.replace(")","");
    var colorString2 = colorString1.replace("rgb(","");
    var lines = colorString2.split(",");
    r = lines[0];
    g = lines[1];
    b = lines[2];
}

function strokeFunction(){
    // console.log(event.target.style.height);
    var height = event.target.style.height;
    siz = height.replace("vw","")*8;
}

function saveFunction(){
    save('myCanvas.jpg');
}

function eraseFunction(){
    r = 255;
    b = 255;
    g = 255;
}

function checkPixel(){
    // noLoop();
    loadPixels();
    // print(pixels);
    for (var i =0; i < pixels.length; i ++){
        if (pixels[i] === 0){
            // print(num);
        }else{
            var num = pixels.length;
            num --;
            // print(num);
        }
    }

    if (num < 10){
        print(num);
    }          
}

function fontFunction(){
        background(255);
        fill(0);
        textSize(1360/len);
        textAlign(CENTER);
        textFont('Helvetica');
        text(tex, width/2, height/2+30);
}

function fontFunction1(){
        background(255);
        fill(0);
        textSize(1360/len);
        textAlign(CENTER);
        textFont('Times');
        text(tex, width/2, height/2+30);
}
function fontFunction2(){
        background(255);
        mabryMedium = loadFont('mabry-medium.ttf');
        fill(0);
        textSize(1360/len);
        textAlign(CENTER);
        textFont(mabryMedium);
        text(tex, width/2, height/2+30);
}

function fontFunction3(){
        background(255);
        ninja = loadFont('NinjaStrike.otf');
        fill(0);
        textSize(1360/len);
        textAlign(CENTER);
        textFont(ninja);
        text(tex, width/2, height/2+30);
}