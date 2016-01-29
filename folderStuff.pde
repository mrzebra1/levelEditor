int tabVar;
int Fspace = 60;
color[] tabColors = {#FFBF8E, #DDFF8E, #8EFFCF, #8EB2FF, #FF0000, #00AA88 };
String[] tabNames = {"land", "rock", "fly", "ene", "home", "bus" };




void folderStuff(int x, int y) {
  noStroke();
  for (int i =0; i < tabNames.length; i++) {
    if (i == tabVar)
      continue;
    drawTab(x+i*Fspace, y, tabColors[i], tabNames[i], i);
  }
  drawTab(x+tabVar*Fspace, y, tabColors[tabVar], tabNames[tabVar], tabVar);

  fill(tabColors[tabVar]);
  rect(x, y, (tabNames.length-1)*70 + 35, 300); 
  drawComp(x, y, tabVar);
}




void drawComp(int x, int y,  int q) {
  if (q == 0 )
    Obj(lands, x+20, y+10, 0,0);
  if (q == 1)
   Obj(rocks, x+20, y+10, 2,3);
  if (q == 2)
    flyTab(x+20, y+10);
  if (q == 3)
    beeTab(x+20, y+10);
  if (q == 4 )
    Obj(homes, x+20, y+10, 2,4);
  if (q == 5 )
    Obj(buses, x+20, y+10, 0,5);
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
  textSize( 12);
  fill(0);
  text(w, x+tw/2, y-th/4);
}
