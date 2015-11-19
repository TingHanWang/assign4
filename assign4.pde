PImage startImg1,startImg2;
PImage shipImg1,shipImg2;
PImage backgroundImg1,backgroundImg2;
PImage blood;
int flame=5;
PImage [] images = new PImage [flame];
int currentFlame;
PImage thing;
PImage lost1,lost2;
final int GAME_START=1,GAME_WIN=2,GAME_LOST=3,GAME_RUN=4;
boolean upPressed = false;
boolean downPressed = false;
boolean leftPressed = false;
boolean rightPressed = false;
float speed = 5;
int gameState;
int fighterX = 580;
int fighterY = 240;
int rectX;
int rectY = 20;
int thingX = 200;
int thingY = 300;
int rnd;
int bgX;
int bgQ=bgX-640;
float enemyX;
float enemyY;
final int COUNT=5;
float spacingX;
float spacingY;
float enemyQ=0, enemyW=240;
final int COUNT2=5;
float spacingQ;
float spacingW;
//flame
final int empty = 0;
final int enemy = 1;
int num=5;
int[][] enemyFlame1 = new int[num][num];
void setup (){
  size(640,480);
  gameState = GAME_START;
  startImg1 = loadImage("img/start1.png");
  startImg2 = loadImage("img/start2.png");
  shipImg1 = loadImage("img/fighter.png");
  shipImg2 = loadImage("img/enemy.png");
  backgroundImg1 = loadImage("img/bg1.png");
  backgroundImg2 = loadImage("img/bg2.png");
  for(int i=0;i<flame;i++){
  images[i]= loadImage("img/flame"+(i+1)+".png");
  }
  blood = loadImage("img/hp.png");
  thing = loadImage("img/treasure.png");
  lost1 = loadImage("img/end1.png");
  lost2 = loadImage("img/end2.png");
  currentFlame=0;
  frameRate(24);
 
  gameState = GAME_START;
  bgX=0;
  bgQ=bgX-640;
   enemyX=0;
  enemyY=240;
  bgX=0;
  bgQ=bgX-640;
  fighterX=580;
  fighterY=240;
  rectX = 200;
  fighterX = 580;
  fighterY = 240;
  rectY = 20;
  thingX = 200;
  thingY = 300;
 
  }
void draw(){
  bgX+=1;
  bgQ+=1;
  enemyX+=speed;
  enemyQ+=speed;
  switch(gameState){
    case GAME_START:
    image(startImg1,0,0);
    if(mouseX >= 200 && mouseX <= 400 && mouseY >= 380 && mouseY <= 430){
      if(mousePressed){
        gameState = GAME_RUN;
      }
      else{
       image(startImg2,0,0);
      }
    }
  
      break;
    case GAME_RUN:
    //background

    if(bgX==0){
      bgQ =-640;
    }
    if(bgQ==0){
      bgX = -640;
    }
image(backgroundImg1,bgX,0);
image(backgroundImg2,bgQ,0);
     //fighter
     if(upPressed){
       fighterY -=speed;
     }
     if(downPressed){
       fighterY += speed;
     }
     if(leftPressed){
       fighterX -= speed;
     }
     if(rightPressed){
       fighterX += speed;
     }
     //no over
     if(fighterY > 480){
       fighterY = 0;
     }
     if(fighterY < 0){
       fighterY = 480;
     }
     if(fighterX >640){
       fighterX = 0;
     }
     if(fighterX < 0){
       fighterX = 640;
     }
     image(shipImg1,fighterX,fighterY);
//enemy
float last=enemyX - 165; //save last X position and go back
 for (int i=0;i<COUNT;i++){
    for(i=0;i<5;i++)
      {
        image(shipImg2,enemyX-i*60,enemyY);     
      }
      
  } 
if(enemyX>=640){    //enemyX will grow and bigger than 640, like 650 660..., so we cannot write enemyX==640
   enemyW=random((450));
   for (int i=0;i<COUNT;i++){
 image(shipImg2,enemyQ-i*60,enemyW+i*40);   
   }
}
if(fighterX >= enemyX && fighterX <= enemyX+50 && fighterY >= enemyY && fighterY <= enemyY+50){
     int i = (currentFlame++)%flame;
     image(images [i],enemyX,enemyY);
     enemyX=900;
     rectX-=50;
} 
if((fighterX+50) >= enemyX && (fighterX+50) <= enemyX+50 && (fighterY+50) >= enemyY && (fighterY+50) <= enemyY+50){
     int i = (currentFlame++)%flame;
     image(images [i],enemyX,enemyY);
     enemyX=900;
     rectX-=50;
 }
     if(fighterX >= thingX && fighterX <= thingX+30 && fighterY >= thingY && fighterY <= thingY+30 ){
       rectX += 50;
       if((fighterX+50) >= thingX && (fighterX+50) <= thingX+30 && (fighterY+50) >= thingY && (fighterY+50) <= thingY+30){
         rectX += 50;
       }
       if(rectX>=200){
       rectX = 200;
       }
       thingX = rnd = (int)random(600)+1;
       thingY = rnd = (int)random(430)+1;
     }
     
     if(rectX==0){
       gameState = GAME_LOST;
     }
      fill(255,0,0);
     rect(5,0,rectX,rectY);
     image(blood,0,0);
     image(thing,thingX,thingY);
     break;
     case GAME_LOST:
     image(lost1,0,0);
     if(mouseX >= 200 && mouseX <= 400 && mouseY >= 300 && mouseY <= 350){
      if(mousePressed){
        gameState = GAME_START;
      }else{
        image(lost2,0,0);
      }
     break;
     }
   }
}
 void keyPressed(){
   if(key == CODED){
     switch(keyCode){
       case UP:
       upPressed = true;
       break;
       case DOWN:
       downPressed = true;
       break;
       case LEFT:
       leftPressed = true;
       break;
       case RIGHT:
       rightPressed = true;
       break;
       
       
     }
   }
}
void keyReleased(){
   switch(keyCode){
       case UP:
       upPressed = false;
       break;
       case DOWN:
       downPressed = false;
       break;
       case LEFT:
       leftPressed = false;
       break;
       case RIGHT:
       rightPressed = false;
       break;
   }
}
