void shiftMenu (int x, int y) {


  fill(#FF0000);
  ellipse(x, y, 40, 40);
  ellipse(x+30, y, 40, 40);

  if (mouseP && dist(mouseX, mouseY, x, y) < 20) {
    mouseP = false;
    shiftX();
  }

  if (mouseP && dist(mouseX, mouseY, x+30, y) < 20) {
    mouseP = false;
    shiftY();
  }
}



void shiftX() {
  int q =  parseInt(pin);
  for (int i = 0; i < lands.size(); i++)
    lands.get(i).x+=q;
  for (int i = 0; i < rocks.size(); i++)
    rocks.get(i).x+=q;
  for (int i = 0; i < homes.size(); i++)
    homes.get(i).x+=q;
  for (int i = 0; i < buses.size(); i++)
    buses.get(i).x+=q;
  for (int i = 0; i <bees.size(); i++)
    ((Bee) bees.get(i)).x+=q;
}

void shiftY() {
  int q =  parseInt(pin);
  for (int i = 0; i < lands.size(); i++)
    lands.get(i).y+=q;
  for (int i = 0; i < rocks.size(); i++)
    rocks.get(i).y+=q;
  for (int i = 0; i < homes.size(); i++)
    homes.get(i).y+=q;
  for (int i = 0; i < buses.size(); i++)
    buses.get(i).y+=q;
  for (int i = 0; i <bees.size(); i++)
    ((Bee) bees.get(i)).y+=q;
}












void addMenu(int x, int y) {
  //bottom menu
  textAlign(CENTER);
  textSize(10);

  int j = 0;

  for (int i = 0; i < w.length; i++) {
    fill(64);
    rect(x + 50*i, y+j, 35, 15);
    fill(255);
    text(w[i], x + 50*i + 35/2, y + 7.5 + 5+j);
    if (mouseP && mouseX > x + 50*i && mouseX < x + 50*i + 35 && mouseY >y+j && mouseY < y + 15+j) 
      whichItem = i;

    if (i == 5) {
      j+=30;
      x-=6*50;
    }
  }
}


void mapInfo(int x, int y) {
  fill(#AAFFFF);
  rect(x, y, 150, 100);
  fill(0);
  textAlign(LEFT);
  textSize(15);



  String s = "mouse pos: ";

  if (mouseX<mSize && mouseY < mSize) {
    s+="(" + gridX+  ", " + gridY + ")";
  }

  text("tool: " + w[whichItem], x, y+20);
  text(s, x, y+40);
  text("pin:" + pin, x, y+60);
}



void drawHero(float x, float y, float s, color c) {
  //s*=sF;
  fill(c);
  ellipse(x-8*s, y-8*s, 8*s, 8*s);
  ellipse(x-8*s, y+8*s, 8*s, 8*s);
  ellipse(x+8*s, y-8*s, 8*s, 8*s);
  ellipse(x+8*s, y+8*s, 8*s, 8*s);
  triangle(x, y+ 15*s, x  +5*s, y + 5*s, x - 5*s, y+5*s);
  // fill(34, 10, 12,50);
  //ellipse(x, y, 20*s, 20*s);
  fill(c);
  ellipse(x, y-10*s, 13*s, 13*s);
}
