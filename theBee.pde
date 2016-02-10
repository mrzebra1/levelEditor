ArrayList bees;// = new ArrayList();
class Bee extends Zebra {
  //FIX BECAUSE a1 IS FIRST

  //x, y, type, radius, velocity

  float t;
  float xx, yy;//bee art x and y


    float ox, oy;//outline

  Bee(int x, int y) {
    this.x=x;//center
    this.y=y;
    a3 = 1;
    a2 = 1;
  }




  void setVars(int a1, int a2/*radius*/, int a3/*velocity*/) {
    this.a1= a1;//type



    if (a2 > 50) {
      a2 -=50;
      a2*=-1;
    }


    this.a2 = a2;

    if (a3 > 50) {
      a3 -=50;
      a3*=-1;
    }


    this.a3 = a3;
  }









  void update() {
    //println(a2 + "  " + a3);

    if (a1 > 7) {//type
      a1 = 0;
    }



    if (a1 == 0) {//flying in circle
      noFill();
      stroke(00);
      ellipse(x*g + g/2, y*g + g/2, (a2*2)*g, (a2*2)*g);
      t+=(float)a3/40;
      xx=g/2+x*g+a2*g*cos(t);
      yy=g/2+y*g+a2*g*sin(t);
    } else if (a1 == 1) {//flying in "figure 8"
      t+=(float)a3/80;
      xx=g/2+x*g+a2*g*cos(t);
      yy=g/2+y*g+a2*g*sin((t+PI/2)/2);
      fill(0);
      for (int i = 0; i < 40; i++) {
        ox=g/2+x*g+a2*g*cos(360*(float)i/18);
        oy=g/2+y*g+a2*g*sin((360*(float)i/18+PI/2)/2);
        ellipse(ox, oy, 1, 1);
      }
    } else if (a1 == 2) {//flying like the infinity symbol
      t+=(float)a3/80;
      xx=g/2+x*g+a2*g*cos(t/2);
      yy=g/2+y*g+a2*g*sin(t);
      fill(0);
      for (int i = 0; i < 40; i++) {
        ox=g/2+x*g+a2*g*cos(360*(float)i/18/2);
        oy=g/2+y*g+a2*g*sin((360*(float)i/18));
        ellipse(ox, oy, 1, 1);
      }
    } else if (a1 == 3) {//number 3
      t+=(float)a3/80;
      xx=g/2+x*g+a2*g*cos(t);
      yy=g/2+y*g+a2*g*sin(t/4);
      fill(0);
      for (int i = 0; i < 40; i++) {
        ox=g/2+x*g+a2*g*cos(360*(float)i/18);
        oy=g/2+y*g+a2*g*sin((360*(float)i/18/4));
        ellipse(ox, oy, 1, 1);
      }
    } else if (a1 == 4) {//horizontal
      t+=(float)a3/80;
      xx=g/2+x*g+a2*g*cos(t);
      yy=g/2+y*g;//+r*g*sin(t/4);
      fill(0);
      for (int i = 0; i < 40; i++) {
        ox=g/2+x*g+a2*g*cos(360*(float)i/18);
        oy=g/2+y*g;//+r*g*sin((360*(float)i/18/4));
        ellipse(ox, oy, 1, 1);
      }
    } else if (a1 == 5) {//slant
      t+=(float)a3/80;
      xx=g/2+x*g+a2*g*cos(t);
      yy=g/2+y*g+a2*g*cos(t);
      fill(0);
      for (int i = 0; i < 40; i++) {
        ox=g/2+x*g+a2*g*cos(360*(float)i/18);
        oy=g/2+y*g+a2*g*cos((360*(float)i/18));
        ellipse(ox, oy, 1, 1);
      }
    } else if (a1 == 6) {//vertical
      t+=(float)a3/80;
      xx=g/2+x*g;//+r*g*cos(t);
      yy=g/2+y*g+a2*g*sin(t);
      fill(0);
      for (int i = 0; i < 40; i++) {
        ox=g/2+x*g;//+r*g*cos(360*(float)i/18);
        oy=g/2+y*g+a2*g*sin(360*(float)i/18);
        ellipse(ox, oy, 1, 1);
      }
    }else if(a1 == 7){///square
    
     stroke(0);
     noFill();
     rect(x*g+g/2,y*g+g/2,g*a2,g*a2);
     
     noStroke();
    // fill(0);
    // text("cw",x*g+g/2,y*g+g/2);
      
      
      
      
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
    //textSize(12);
    text("b" + n, g*(x)+g/2, g*(y)+g/2+4.5);
  }
}

