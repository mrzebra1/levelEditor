int whichItem = 0;
String[] w  = {
  "land", "rock", "sRock", "fly", "bee", "startP", "endP", "size", "snake", "lshoot", "house"
};


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
  } else {
    drag = -1;
  }
  mouseP  =false;


  rGridX = gridX;
  rGridY = gridY;

  if (mouseX < mSize && mouseY < mSize && mousePGraph) {
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
    if (whichItem==0) {
      lands.add(new Land(mGridX, mGridY, rGridX-mGridX+1, rGridY-mGridY+1));//drag and release
    } else if (whichItem==1 || whichItem==2) {


      if (whichItem==1) {
        lilys.add(new Lily(0, mGridX, mGridY));
      } else if (whichItem == 2) {

        lilys.add(specialCount, new Lily(0, mGridX, mGridY));
        ((Lily) lilys.get(specialCount)).s=1;
        specialCount++;
      }
    } else if (whichItem == 3) {

      //check for duplicates
      for (int i=0; i <flys.size(); i++) {
        if ( ((Fly)flys.get(i)).x == mGridX &&  ((Fly)flys.get(i)).y == mGridY) {
          println("fly in same spot!"); 
          return;
        }
      }


      flys.add(new Fly(mGridX, mGridY));
    } else if (whichItem==4) {//bee

      bees.add(new Bee(mGridX, mGridY));
    } else if (whichItem == 5) {//starting position

      sx = mGridX;
      sy = mGridY;
    } else if (whichItem == 6) {//end position

      ex = mGridX;
      ey = mGridY;
    } else if (whichItem == 7) {//map size

      lw = mGridX+  1;
      lh = mGridY+1;
    } else if (whichItem == 8) {//snake

      snakeX= mGridX;
      snakeY = mGridY;
    } else if (whichItem == 9) {//lavaShooter

      lshoots.add(new LShoot(mGridX, mGridY));
    }else if (whichItem == 10) {//home

     homes.add(new House(mGridX, mGridY));
    }
  }

  mousePGraph = false;
}