int tabVar;
int Fspace = 45;




void folderStuff(int x, int y) {
  noStroke();
  for (int i =0; i < tabNames.length; i++) {
   // if (i != tabVar)
    
    drawTab(x+i*Fspace, y, tabColors[i], tabNames[i], i);
  }
  drawTab(x+tabVar*Fspace, y, tabColors[tabVar], tabNames[tabVar], tabVar);

  fill(tabColors[tabVar]);
  rect(x, y, (tabNames.length-1)*(Fspace) + 50, 350); 
  drawComp(x, y, tabNames[tabVar]);
}





color[] tabColors = {
  #FFBF8E, #DDFF8E, #8EFFCF, #8EB2FF, #FF0000, #00AA88, #00AAFF, #aaaa00
};
String[] tabNames = {
  "land", "rock", "fly", "ene", "home", "bus", "item", "tree",
};


void drawComp(int x, int y, String q) {
  if (q.equals("land") )
    Obj(lands, x+20, y+20, 4, 5);

  if (q.equals("rock") )
    Obj(rocks, x+20, y+20, 4, 5);

  if (q.equals("home") )
    Obj(homes, x+20, y+20, 2, 5);

  if (q.equals("bus") )
    Obj(buses, x+20, y+20, 0, 5);

  if (q.equals("item"))
    Obj(items, x+20, y+20, 2, 3);


  if (q.equals("ene"))
    beeTab(x+20, y+20);

  if (q.equals("fly"))
    flyTab(x+20, y+20);



}

void drawTab(float x, float y, color c, String w, int type) {
  float tw = 50, th = 20;
  fill(c);
  beginShape();
  vertex(x, y);//bottom left
  vertex(x+tw/8, y-th);//top left
  vertex(x+.875*tw, y-th);//150
  vertex(x+tw, y);
  endShape();

 // fill(#FF0000);
 // ellipse(x+tw, y, 5, 5);

 // fill(#00FF00);
 // ellipse(x, y, 5, 5);

  if (mouseP && mouseX > x+tw/8 && mouseX < x+.875*tw && mouseY <  y && mouseY >y-th) {
    mouseP = false;
    tabVar = type;
  }

  textAlign(CENTER);
  textSize(10);
  fill(0);
  text(w, x+tw/2, y-th/4);
}

