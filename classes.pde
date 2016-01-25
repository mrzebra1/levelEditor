class Zebra {
  int x, y, a1, a2, a3, n;
}



ArrayList<Zebra> lands;
class Land extends Zebra {
  //x, y, width, height
  
  Land(int x, int y, int a1, int a2) {
    this.x=x;
    this.y=y; 
    this.a1=a1;
    this.a2=a2;
  }

  void drawMe() {//draw gray rectangle for land
    noStroke();
    fill(150);
    rect(x*g, y*g, a1*g, a2*g);
    fill(0);
    textFont(myFont, 10);
    textAlign(CENTER);
    text("L" + n, g*(x+a1/2), g*(y+a2/2)+6);
  }
}

ArrayList<Zebra> homes;
class House extends Zebra {
  //x, y, orintation, ID, type
  House(int x, int y) {
    this.x=x;
    this.y=y;
    a1 = 1;
    a2 = 1;
    a3 = 1;
  } 


  House(int x, int y, int a1, int a2) {
    this.x=x;
    this.y=y;
    this.a1=a1;
    this.a2=a2;
  } 

  void drawMe() {
    noStroke();
    fill(#0000FF);
    rect(x*g - g/2, y*g-g/2, 2*g, 2*g);
    fill(0);

    if (a2 == 1) {
      ellipse(x*g + g/2, y*g - g/2, 5, 5);//up
    }
    if (a2 == 2) {
      ellipse(x*g+g/2, y*g + g + g/2, 5, 5);//down
    }
    if (a2 == 3) {
      ellipse(x*g -g/2, y*g + g/2, 5, 5);//left
    }
    if (a2 == 4) {
      ellipse(x*g + g+g/2, y*g + g/2, 5, 5);//right
    }


    textFont(myFont, 10);
    textAlign(LEFT);
    text("H" + n + "-"+ a1, g*x-g/2, g*y);
  }
}