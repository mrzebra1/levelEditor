
void addMenu(int x, int y) {
  //bottom menu
  textAlign(CENTER);
  textFont(myFont, 10);

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
  rect(x, y, 100, 100);
  fill(0);
  textAlign(LEFT);
  textFont(myFont, 15);



  String s = "mouse pos: ";

  if (mouseX<mSize && mouseY < mSize) {
    s+="(" + gridX+  ", " + gridY + ")";
  }

  text("tool: " + w[whichItem], x+20, y+20);
  text(s, x+20, y+40);
  text("pin:" + pin, x+20, y+60);
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