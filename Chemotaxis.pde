//moths to a flame?
Dot [] dots;
int backgrVar;
int attraction, dotsHidden; //player-adjustible variables

void setup(){
  size(400,400);
  background(80);
  dots = new Dot[100]; // make dot amount shown able to be changed by player
  for (int i = 0; i<dots.length; i++){
    dots[i] = new Dot();
  }
  attraction = 1; //changed by z and x
  dotsHidden = 89; //changed by q and ‘ ‘(space)
}

void draw() {
  if (backgrVar>0){
    fill(80,70);
  backgrVar -=1;
  } else{
    fill(80,40);
  }
  rect(0,0,400,400);
  if (mousePressed){
    fill(255,140,0,80);
    drawFire();
    //ellipse(mouseX, mouseY, 50,75); //sculpt fire using curveVertex tool
  }
  for (int i = 0; i<dots.length-dotsHidden; i++){ //loop thru all dots shown
    if (mousePressed){
      if (mouseX > dots[i].myX){
        dots[i].myX += attraction;
      }
      if (mouseX < dots[i].myX){
        dots[i].myX -= attraction;
      }
      if (mouseY > dots[i].myY){
        dots[i].myY += attraction;
      }
      if (mouseY < dots[i].myY){
        dots[i].myY -= attraction;
      }
    }
    fill(255);
    dots[i].move();
    dots[i].reRoll(); //random part
    dots[i].show();
  }
}

void mousePressed(){
  //System.out.println(dist(dots[0].myX, dots[0].myY, mouseX, mouseY));
}

void mouseReleased(){
  //fill(80,90);
  //rect(0,0,400,400);
  backgrVar = 8;
}

void keyPressed(){
  if (key == 'q'){
    if (dotsHidden < 99){
      if (dotsHidden > 80){
        dotsHidden += 1;
      } else{
        dotsHidden += 10;
      }
    }
  }
  
  if (key == ' '){
    if (dotsHidden > 12){
      if (dotsHidden > 80){
        dotsHidden -= 1;
      } else{
        dotsHidden -= 10;
      }
    }
  }
  
  if (key == 'z'){
    if (attraction < 100){
    attraction += 1;
    }
  }
  
  if (key == 'x'){
    if (attraction > 1){
    attraction -= 1;
    }
  }
}





class Dot
{
  int myX, myY, xDir, yDir, speed;
  double ran;
  Dot(){
    myX = (int)(Math.random()*401);
    myY = (int)(Math.random()*401);
    xDir = (int)(Math.random()*3)-1;
    yDir = (int)(Math.random()*3)-1;
    ran = Math.random()*2 +1;
    speed = 5;
  }
  
  void move(){
    if (xDir == 0){
      if (yDir == 0){
        yDir += 1;
      }
      myY += yDir * speed;
    } else if (yDir == 0){
      myX += xDir * speed;
    } else{
      myX += xDir * speed/ran;
      myY += yDir * speed/ran;
    }
    //if (direction == 1){
    //  myX -= speed;
    //} else if (direction == 2){
    //  myX -= speed/2;
    //  myY -= speed/2;
    //} else if (direction == 3){
    //  myY -= speed;
    //} else if (direction == 4){
    //  myX += speed/2;
    //  myY -= speed/2;
    //} else if (direction == 5){
    //  myX += speed;
    //} else if (direction == 6){
    //  myX += speed/2;
    //  myY += speed/2;
    //} else if (direction == 7){
    //  myY += speed;
    //} else {
    //  myX -= speed/2;
    //  myY += speed/2;
    //} 
    this.detectCollision();
  }
  
  void detectCollision(){
    if (myX > width || myX < 0){
      if (xDir == 1){
        if (myX > 200){myX = width;}
        xDir = -1;
      } else{
        if (myX < 200){myX = 0;}
        xDir = 1;
      }
    }
    if (myY > height || myY < 0 ){
      if (yDir == 1){
        if (myY > 200){myY = height;}
        yDir = -1;
      } else{
        if (myY < 200){myY = 0;}
        yDir = 1;
      }
    }
  }
  
  void reRoll(){
    ran = Math.random()*2 +1;
    if (ran > 2.7){
      xDir = (int)(Math.random()*3)-1;
      yDir = (int)(Math.random()*3)-1;
    }
  }
  
  void show(){
     myX += (int) (Math.random() * 7) -3;
    myY += (int) (Math.random() * 7) -3;
    ellipse(myX, myY, 10,10);
  }
  

}

void drawFire(){
  arc(mouseX,mouseY+7,50,42.5,0,PI); //540,90
  beginShape();//-56.25
  vertex(mouseX-25,mouseY+7);
  vertex(mouseX-20,mouseY-21.75);
  vertex(mouseX-12.5,mouseY-5.5);
  vertex(mouseX,mouseY-49.25);
  vertex(mouseX+12.5,mouseY-5.5);
  vertex(mouseX+20,mouseY-21.75);
  vertex(mouseX+25,mouseY+7);
  endShape();
}








