class Button{  
   Button(){ 
   }
   
   void display(int a, int b){
   fill(255);
   noStroke();
   ellipse(a, b, buttonSize, buttonSize);
   }
}

class CButton extends Button{
     CButton(){
     }
     void display(int a, int b){
        ellipse(a, b, buttonSize/2, buttonSize/2);
     }

}
