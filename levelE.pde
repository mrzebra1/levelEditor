//



void setup() {
  size(985, 670);
  frameRate(30);
  myFont = createFont("verdana", 12);


  textSize(20);
  textAlign(CENTER);
  lLevel = loadStrings("cheese.txt");//load everything
  theLevel = new String[lLevel.length];
  numLevs = lLevel.length/numLines;
  loadLevel(1);
}

int lev = 1;
int numLevs;

int snakeX = -99, snakeY = - 99, snakeV;


String[] lLevel;




int gridX, gridY;
int sx, sy, ex, ey;
int lw = 7, lh = 9;//boxes per screen

int g = 20;

int mSize = 600;





void draw() {
  background(255);

  int loc0 = 0;
  int loc1 = 0;

  //grid orange
  fill(#BB4020);
  noStroke();
  rect(0, 0, mSize, mSize);


  gridX = mouseX/g;
  gridY = mouseY/g;
  drawMap();





  folderStuff(610, 25);
  shiftMenu(650, 500);
  addMenu(650, 400);
  mapInfo(700, 500);




  loc0 = 520;
  loc1 = 370;

  //set par
  text("par: " + 2*par + "s", loc0, loc1);
  ellipse(loc0+100, loc1-7.5, 10, 10);
  ellipse(loc0+120, loc1-7.5, 10, 10);

  if (mouseP && dist(mouseX, mouseY, loc0+100, loc1-7.5) < 5) {
    mouseP = false;
    par--;
    if (par < 0)
      par = 99;
  } else if (mouseP && dist(mouseX, mouseY, loc0+ 120, loc1-7.5) < 5) {
    mouseP = false;
    par++;
    if (par > 99)
      par = 0;
  }

  loc1 += 30;
  //set id
  text("id: " + id, loc0, loc1);
  ellipse(loc0+100, loc1-7.5, 10, 10);
  ellipse(loc0+120, loc1-7.5, 10, 10);

  if (mouseP && dist(mouseX, mouseY, loc0+100, loc1-7.5) < 5) {
    mouseP = false;
    id--;
    if (id < 0)
      id = 99;
  } else if (mouseP && dist(mouseX, mouseY, loc0+ 120, loc1-7.5) < 5) {
    mouseP = false;
    id++;
    if (id > 99)
      id = 0;
  }


  loc1 += 30;

  textSize(8);
 // text(levWords, loc0, loc1);


  textSize(12);
  loc1 = 620;





  //levels in circles
  textAlign(CENTER);
  for (int i = 0; i < theLevel.length/numLines; i++) {

    loc0 = 20 + 25*((i%20));
    loc1 = 620+ 25*((int)(i/20));
    k = 0;
    fill(200);
    if (i == lev - 1)
      fill(#FF0000);
    ellipse(loc0, loc1, 10, 10);
    fill(0);
    text(i, loc0, loc1+ 7.5);

    if (drag >=0) {
      fill(150, 50);
      ellipse(loc0 +  12.5, loc1, 10, 10);
    }
    if (mouseP && dist(mouseX, mouseY, loc0, loc1) < 5) {
      drag = i;
      heldLevel = i;
      mouseP = false;
    }

    if (drag == -2 && dist(mouseX, mouseY, loc0 +  12.5, loc1) < 5) {
      println("HL:  " + heldLevel);

      //copy the contents in the held level
      tempS[0]= lLevel[heldLevel*5];
      tempS[1]= lLevel[1+heldLevel*5];
      tempS[2]= lLevel[2+heldLevel*5];
      tempS[3]= lLevel[3+heldLevel*5];
      tempS[4]= lLevel[4+heldLevel*5];



      if (heldLevel > i+1) {
        println("drag from right");
        //make a new, blank level to the right of where you dropped the level
        newLevel(i+1);

        //println(tempS[0]);
        //println(theLevel[(i+1)*5]);

        theLevel[(i+1)*5] =  tempS[0];
        theLevel[(i+1)*5 + 1] =  tempS[1];
        theLevel[(i+1)*5 + 2] =  tempS[2];
        theLevel[(i+1)*5 + 3] =  tempS[3];
        theLevel[(i+1)*5 + 4] =  tempS[4];

        saveStrings("data/l.txt", theLevel);
        lLevel = loadStrings("l.txt");

        //println(lLevel
        deleteLevel(heldLevel+2);
      } else if (heldLevel < i) {

        newLevel(i+1);
        theLevel[(i+1)*5] =  tempS[0];
        theLevel[(i+1)*5 + 1] =  tempS[1];
        theLevel[(i+1)*5 + 2] =  tempS[2];
        theLevel[(i+1)*5 + 3] =  tempS[3];
        theLevel[(i+1)*5 + 4] =  tempS[4];
        saveStrings("data/l.txt", theLevel);
        lLevel = loadStrings("l.txt");
        deleteLevel(heldLevel+1);
      }



      lLevel = loadStrings("l.txt");
    }
  }


  if (drag >=0) {
    fill(200);
    ellipse(mouseX, mouseY, 10, 10);
    fill(0);
    text(drag  + 1, mouseX, mouseY + 7.5);
  }

  if (drag == -2) {
    drag = -1;
  }



  saveStuff();
}


int drag = -1;
String[] tempS = new String[5];
int heldLevel;


int id = 0;



//int c =  0;

int mGridX, mGridY, rGridX, rGridY;







int specialCount = 0;













int k=0;

String[] theLevel;

int par = 0;

int startPin;

String pin ="";

void keyPressed() {

  if (key == 'z') {
    saveVar = -99;
  }

  if (key == 'q') {
    startPin = 0;
    pin = "";
  }

  if (startPin >0 && startPin < 3) {
    pin+=key;
  }


  startPin++;
  if (keyCode == RIGHT) {
    lev++;
    if (lev > numLevs) 
      lev = 1;
    loadLevel(lev);
  } else if (keyCode == LEFT) {
    lev--;
    if (lev < 1)
      lev = numLevs;
    loadLevel(lev);
  } 





  if (key == 'n') {
    newLevel(lev);
  } else if (key == 'd') {
    deleteLevel(lev);
  }
}



String returnStuff(int x) {
  String sx;
  if (x<0) {
    x *=-1;
    x+=50;
    sx = "0" + x;
  }
  if ( x < 10 && x>=0) 
    sx = "0" + x;
  else 
  sx = "" + x  +"" ;
  return sx;
}

String returnStuff2(int x) {//3 digits
  String sx;
  if ( x < 10) 
    sx = "00" + x;
  else  if ( x < 100)
    sx = "0" + x;
  else
    sx = "" + x  +"" ;
  return sx;
}

PFont myFont;// = createFont("verdana", 12);




void drawGrid(int q) {
  stroke(0, 32);
  for (int i = 0; i < mSize/q; i++) {
    line(0, q*i, mSize, q*i);
    line(q+q*i, 0, q+q*i, mSize);
  }
}
