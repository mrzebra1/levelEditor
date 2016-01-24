void drawTab(float x, float y, color c, String w, int type) {
  float tw = 70, th = 20;
  

  
  
  fill(c);
  beginShape();
  vertex(x, y);//bottom left
  vertex(x+tw/8, y-th);//top left
  vertex(x+.875*tw, y-th);//150
  vertex(x+tw, y);
  endShape();
  
  if(mouseP && mouseX > x+tw/8 && mouseX < x+.875*tw && mouseY <  y && mouseY >y-th){
    mouseP = false;
    tabVar = type;
  }
  
  textAlign(CENTER);
  textFont(myFont, 12);
  fill(0);
  text(w, x+tw/2, y-th/4);
}
