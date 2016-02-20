int whichItem = 0;
String[] w  = {
  "land", "rock", "item", "fly", "bee", "startP", "endP", "size", "snake", "lshoot", "home", "bus",
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


    if ( (w[whichItem]).equals("fly")   ) {
      flys.add(new Fly(mGridX, mGridY));
    }

    if ( (w[whichItem]).equals("item")   ) {
      items.add(new Item(mGridX, mGridY));
    }



    if ( (w[whichItem]).equals("land")   ) {
      lands.add(new Land(mGridX, mGridY, rGridX-mGridX+1, rGridY-mGridY+1, 0));//drag and release
    }

    if ( (w[whichItem]).equals("rock")   ) {
      rocks.add(new Rock(mGridX, mGridY, 0));
    }

    if ( (w[whichItem]).equals("bus")) {
      buses.add(new Bus(mGridX, mGridY));
    }

    if ((w[whichItem]).equals("home")) {
      homes.add(new House(mGridX, mGridY));
    } 

    if ((w[whichItem]).equals("bee")) {

      bees.add(new Bee(mGridX, mGridY));
    }


    if ((w[whichItem]).equals("startP")) {

      sx = mGridX;
      sy = mGridY;
    } 

    if ((w[whichItem]).equals("endP")) {

      ex = mGridX;
      ey = mGridY;
    }

    if ((w[whichItem]).equals("size")) {
      lw = mGridX+  1;
      lh = mGridY+1;
    }

    if ((w[whichItem]).equals("lshoot")) {

      lshoots.add(new LShoot(mGridX, mGridY));
    }











    if ((w[whichItem]).equals("snake")) {

      snakeX= mGridX;
      snakeY = mGridY;
    }

    /*

     if (whichItem == 3) {
     
     //check for duplicates
     for (int i=0; i <flys.size(); i++) {
     if ( ((Fly)flys.get(i)).x == mGridX &&  ((Fly)flys.get(i)).y == mGridY) {
     println("fly in same spot!"); 
     return;
     }
     }
     
     
     flys.add(new Fly(mGridX, mGridY));
     } 
     
     
     if (whichItem == 8) {//snake
     
     snakeX= mGridX;
     snakeY = mGridY;
     }
     
     */
  }

  mousePGraph = false;
}

