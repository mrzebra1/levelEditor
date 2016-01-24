void setup() {
  size(985, 670);
  frameRate(30);
   myFont = createFont("verdana", 12);
  // smooth();
  textFont(myFont, 20);
  textAlign(CENTER);
  lLevel = loadStrings("l.txt");//load everything
  theLevel = new String[lLevel.length];
  numLevs = lLevel.length/5;
  loadLevel(1);
}

int lev = 1;
int numLevs;

int snakeX = -99, snakeY = - 99, snakeV;


String[] lLevel;




int gridX, gridY;
int sx, sy, ex, ey;
int lw = 7, lh = 9;//boxes per screen

int g = 10;

int mSize = 600;


int tabVar;

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


  //folders
  noStroke();
  if (tabVar == 0) {//land
    drawTab(700, 40, #FFBF8E, "Enemies", 3);
    drawTab(640, 40, #DDFF8E, "Flys", 2);
    drawTab(580, 40, #8EFFCF, "Rocks", 1);
    drawTab(520, 40, #8EB2FF, "Lands", 0);
    fill(#8EB2FF);
    rect(520, 40, (700-520)+70, 300);   
    landTab(540, 50);
  }
  else if (tabVar == 1) {//rocks
    drawTab(700, 40, #FFBF8E, "Enemies", 3);
    drawTab(520, 40, #8EB2FF, "Lands", 0);
    drawTab(640, 40, #DDFF8E, "Flys", 2);
    drawTab(580, 40, #8EFFCF, "Rocks", 1);
    fill(#8EFFCF);
    rect(520, 40, (700-520)+70, 300);
    rockTab(540, 50);
  }
  else if (tabVar == 2) {//flys
    drawTab(700, 40, #FFBF8E, "Enemies", 3);
    drawTab(520, 40, #8EB2FF, "Lands", 0);
    drawTab(580, 40, #8EFFCF, "Rocks", 1);
    drawTab(640, 40, #DDFF8E, "Flys", 2);
    fill(#DDFF8E);
    rect(520, 40, (700-520)+70, 300);
    flyTab(540, 50);
  }
  else if (tabVar == 3) {//enemies
    drawTab(520, 40, #8EB2FF, "Lands", 0);
    drawTab(580, 40, #8EFFCF, "Rocks", 1);
    drawTab(640, 40, #DDFF8E, "Flys", 2);
    drawTab(700, 40, #FFBF8E, "Enemies", 3);
    fill(#FFBF8E);
    rect(520, 40, (700-520)+70, 300);
    beeTab(540, 50);
  }


  //bottom menu
  textAlign(CENTER);
  textFont(myFont, 10);

  for (int i = 0; i < w.length; i++) {
    fill(64);
    rect(20 + 50*i, 550, 35, 15);
    fill(255);
    text(w[i], 20 + 50*i + 35/2, 550 + 7.5 + 5);
    if (mouseP && mouseX > 20 + 50*i && mouseX < 20 + 50*i + 35 && mouseY >550 && mouseY < 550 + 15) 
      c = i;
  }


  fill(0);
  textAlign(LEFT);
  textFont(myFont, 15);
  text("tool: " + w[c], 20, 530);


  text("mouse pos: ", 140, 530);
  if (mouseX<mSize && mouseY < mSize) {
    text("(" + gridX+  ", " + gridY + ")", 240, 530);
  }

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
  }
  else if (mouseP && dist(mouseX, mouseY, loc0+ 120, loc1-7.5) < 5) {
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
  }
  else if (mouseP && dist(mouseX, mouseY, loc0+ 120, loc1-7.5) < 5) {
    mouseP = false;
    id++;
    if (id > 99)
      id = 0;
  }


  loc1 += 30;

  textFont(myFont, 8);
  text(levWords, loc0, loc1);


  textFont(myFont, 12);
  loc1 = 620;



  //levels in circles
  textAlign(CENTER);
  for (int i = 0; i < theLevel.length/5; i++) {

    loc0 = 20 + 25*((i%20));
    loc1 = 600+ 25*((int)(i/20));
    k = 0;
    fill(200);
    if (i == lev - 1)
      fill(#FF0000);
    ellipse(loc0, loc1, 10, 10);
    fill(0);
    text(i+1, loc0, loc1+ 7.5);

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
      }
      else if (heldLevel < i) {

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
}


int drag = -1;
String[] tempS = new String[5];
int heldLevel;


int id = 0;

String[] w  = {
  "Land", "rock", "sRock", "fly", "bee", "startP", "endP", "size", "snake", "lshoot"
};

int c =  0;

int mGridX, mGridY, rGridX, rGridY;

boolean mouseP;
boolean mousePGraph = false;
void mousePressed() {
  mouseP = true;
  mGridX = gridX;
  mGridY = gridY;
  if (mouseX < mSize && mouseY < mSize) {
    mousePGraph = true;
  }
}



void mouseReleased() {
  if (drag >=0) {//u were draging a level
    drag = -2;
  }
  else {
    drag = -1;
  }
  mouseP  =false;
  rGridX = gridX;
  rGridY = gridY;

  if (mouseX < mSize && mouseY < mSize && mousePGraph == true) {
    int t = 0;
    if (mGridX>rGridX) {
      t = rGridX;
      rGridX =mGridX;
      mGridX = t;
    }
    if (mGridY>rGridY) {
      t = rGridY;
      rGridY =mGridY;
      mGridY = t;
    }
    //lands
    if (c==0) {
      lands.add(new Land(mGridX, mGridY, rGridX-mGridX+1, rGridY-mGridY+1));
    }
    else if (c==1 || c==2) {

/*
      //check for duplicates
      for (int i=0; i <lilys.size();i++) {
        if ( ((Lily)lilys.get(i)).x == mGridX &&  ((Lily)lilys.get(i)).y == mGridY) {
          println("lily in same spot!"); 
          return;
        }
      }
      
      */

      if (c==1) {
        lilys.add(new Lily(0, mGridX, mGridY));
      }
      else if (c == 2) {

        lilys.add(specialCount, new Lily(0, mGridX, mGridY));
        ((Lily) lilys.get(specialCount)).s=1;
        specialCount++;
      }
    }
    else if (c == 3) {

      //check for duplicates
      for (int i=0; i <flys.size();i++) {
        if ( ((Fly)flys.get(i)).x == mGridX &&  ((Fly)flys.get(i)).y == mGridY) {
          println("fly in same spot!"); 
          return;
        }
      }


      flys.add(new Fly(mGridX, mGridY));
    }
    else if (c==4) {//bee

      bees.add(new Bee(mGridX, mGridY));
    }
    else if (c == 5) {//starting position

      sx = mGridX;
      sy = mGridY;
    }
    else if (c == 6) {//end position

      ex = mGridX;
      ey = mGridY;
    }
    else if (c == 7) {//map size

      lw = mGridX+  1;
      lh = mGridY+1;
    }
    else if (c == 8) {//snake

      snakeX= mGridX;
      snakeY = mGridY;
    }
    else if (c == 9) {//lavaShooter
    
     lshoots.add(new LShoot(mGridX, mGridY));
     
    }
  }

  mousePGraph = false;
}


int specialCount = 0;













int k=0;

String[] theLevel;

int par = 0;
void keyPressed() {
  if (keyCode == RIGHT) {
    lev++;
    if (lev > numLevs) 
      lev = 1;
    loadLevel(lev);
  }
  else if (keyCode == LEFT) {
    lev--;
    if (lev < 1)
      lev = numLevs;
    loadLevel(lev);
  }
  else if (key == 'e') {
    if (lev == 1) {
      saveLevel(0);
      for (int i = 5; i < numLevs*5; i++)
        theLevel[i] = lLevel[i];
    }
    else if (lev < numLevs) {
      for (int i = 0; i < (lev-1)*5; i++)
        theLevel[i] = lLevel[i];
      saveLevel(lev-1);
      for (int i = (5*(lev)); i < numLevs*5; i++)
        theLevel[i] = lLevel[i];
    }
    else if (lev == numLevs) {
      for (int i = 0; i < (numLevs-1)*5; i++)
        theLevel[i] = lLevel[i];
      saveLevel(lev-1);
    }
    saveStrings("data/l.txt", theLevel);
    lLevel = loadStrings("l.txt");//load everything
  }
  else if (key == 'n') {
    newLevel(lev);
  }
  else if (key == 'd') {
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