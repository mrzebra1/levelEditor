int tabVar;
int FLeft = 620;
int Fspace = 60;
color[] tabColors = {#FFBF8E, #DDFF8E, #8EFFCF, #8EB2FF, #FF0000, #00AA88 };
String[] tabNames = {"land", "rock", "fly", "ene", "home", "bus" };




void folderStuff() {
  noStroke();
  for (int i =0; i < tabNames.length; i++) {
    if (i == tabVar)
      continue;
    drawTab(FLeft+i*Fspace, 40, tabColors[i], tabNames[i], i);
  }
  drawTab(FLeft+tabVar*Fspace, 40, tabColors[tabVar], tabNames[tabVar], tabVar);

  fill(tabColors[tabVar]);
  rect(FLeft, 40, (tabNames.length-1)*70 + 35, 300); 
  drawComp(tabVar);
}

void drawComp(int q) {
  if (q == 0 )
    Obj(lands, FLeft+20, 50);
  if (q == 1)
    rockTab(FLeft+20, 50);
  if (q == 2)
    flyTab(FLeft+20, 50);
  if (q == 3)
    beeTab(FLeft+20, 50);
  if (q == 4 )
    Obj(homes, FLeft+20, 50);
  if (q == 5 )
    Obj(buses, FLeft+20, 50);
}

void drawTab(float x, float y, color c, String w, int type) {
  float tw = 70, th = 20;
  fill(c);
  beginShape();
  vertex(x, y);//bottom left
  vertex(x+tw/8, y-th);//top left
  vertex(x+.875*tw, y-th);//150
  vertex(x+tw, y);
  endShape();

  if (mouseP && mouseX > x+tw/8 && mouseX < x+.875*tw && mouseY <  y && mouseY >y-th) {
    mouseP = false;
    tabVar = type;
  }

  textAlign(CENTER);
  textFont(myFont, 12);
  fill(0);
  text(w, x+tw/2, y-th/4);
}