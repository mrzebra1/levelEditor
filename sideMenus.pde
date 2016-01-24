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

