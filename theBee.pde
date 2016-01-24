


ArrayList bees;// = new ArrayList();
class Bee {
  int x, y, n, s, r, v;
  float t, xx, yy;
  int type;

  float ox, oy, ot;
  Bee(int x, int y) {

    this.x=x;
    this.y=y;

    v = 1;
    r=1;
  }

  void setVars(int type, int r, int v) {
    this.type = type;
    
        if (r > 50) {
      r -=50;
      r*=-1;
    }
    
    this.r = r;

    if (v > 50) {
      v -=50;
      v*=-1;
    }
    
    
    this.v = v;
  }

  void drawMe() {
    
    if(type > 6){
      type = 0;
    }



    if (type == 0) {//flying in circle
      noFill();
      stroke(00);
      ellipse(x*g + g/2, y*g + g/2, (r*2)*g, (r*2)*g);
      t+=(float)v/40;
      xx=g/2+x*g+r*g*cos(t);
      yy=g/2+y*g+r*g*sin(t);
    }
    else if (type == 1) {//flying in "figure 8"
      t+=(float)v/80;
      xx=g/2+x*g+r*g*cos(t);
      yy=g/2+y*g+r*g*sin((t+PI/2)/2);
      fill(0);
      for (int i = 0; i < 40; i++) {
        ox=g/2+x*g+r*g*cos(360*(float)i/18);
        oy=g/2+y*g+r*g*sin((360*(float)i/18+PI/2)/2);
        ellipse(ox, oy, 1, 1);
      }
    }else if (type == 2) {//flying like the infinity symbol
      t+=(float)v/80;
      xx=g/2+x*g+r*g*cos(t/2);
      yy=g/2+y*g+r*g*sin(t);
      fill(0);
      for (int i = 0; i < 40; i++) {
        ox=g/2+x*g+r*g*cos(360*(float)i/18/2);
        oy=g/2+y*g+r*g*sin((360*(float)i/18));
        ellipse(ox, oy, 1, 1);
      }
    }else if (type == 3) {//number 3
      t+=(float)v/80;
      xx=g/2+x*g+r*g*cos(t);
      yy=g/2+y*g+r*g*sin(t/4);
      fill(0);
      for (int i = 0; i < 40; i++) {
        ox=g/2+x*g+r*g*cos(360*(float)i/18);
        oy=g/2+y*g+r*g*sin((360*(float)i/18/4));
        ellipse(ox, oy, 1, 1);
      }
    }else if (type == 4) {//horizontal
      t+=(float)v/80;
      xx=g/2+x*g+r*g*cos(t);
      yy=g/2+y*g;//+r*g*sin(t/4);
      fill(0);
      for (int i = 0; i < 40; i++) {
        ox=g/2+x*g+r*g*cos(360*(float)i/18);
        oy=g/2+y*g;//+r*g*sin((360*(float)i/18/4));
        ellipse(ox, oy, 1, 1);
      }
    }else if (type == 5) {//slant
      t+=(float)v/80;
      xx=g/2+x*g+r*g*cos(t);
      yy=g/2+y*g+r*g*cos(t);
      fill(0);
      for (int i = 0; i < 40; i++) {
        ox=g/2+x*g+r*g*cos(360*(float)i/18);
        oy=g/2+y*g+r*g*cos((360*(float)i/18));
        ellipse(ox, oy, 1, 1);
      }
    }else if (type == 6) {//vertical
      t+=(float)v/80;
      xx=g/2+x*g;//+r*g*cos(t);
      yy=g/2+y*g+r*g*sin(t);
      fill(0);
      for (int i = 0; i < 40; i++) {
        ox=g/2+x*g;//+r*g*cos(360*(float)i/18);
        oy=g/2+y*g+r*g*sin(360*(float)i/18);
        ellipse(ox, oy, 1, 1);
      }
    }

    fill(0);
    ellipse(xx, yy, 4, 4);


    noStroke();

    //yellow center circle
    fill(255, 255, 0);
    ellipse(x*g + g/2, y*g + g/2, g/2, g/2);
    //text
    fill(0);
    textAlign(CENTER);
    //textFont(myFont, 12);
    text("b" + n, g*(x)+g/2, g*(y)+g/2+4.5);


  
  }
}

