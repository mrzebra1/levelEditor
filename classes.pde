class Zebra {
  int x, y, a1, a2, a3, n;
  void update() {
  }
}







ArrayList<Zebra> items;
class Item extends Zebra {
  //x, y, type
  Item(int x, int y, int a1) {
    this.x=x;
    this.y=y; 
    this.a1=a1;
  }

  Item(int x, int y) {
    this.x=x;
    this.y=y;
  }
  void update() {
    noStroke();
    fill(#FF0000);
    rect(x*g, y*g, g, g);
    fill(0);
    textSize(10);
    textAlign(CENTER);
    text("i" + n+"-"+a1, g*(x+a1/2), g*(y+a2/2)+6);
  }
}




ArrayList<Zebra> lands;
class Land extends Zebra {
  //x, y, width, height
  Land(int x, int y, int a1, int a2, int _a3) {
    this.x=x;
    this.y=y; 
    this.a1=a1;
    this.a2=a2;
    a3 = _a3;
  }
  void update() {//draw gray rectangle for land
    noStroke();
    if (a3 == 0) {
      fill(150);
    } else if (a3 == 1) {
      fill(#994400);
    }
    rect(x*g, y*g, a1*g, a2*g);
    fill(0);
    textSize(10);
    textAlign(CENTER);
    text("L" + n, g*(x+a1/2), g*(y+a2/2)+6);
  }
}

ArrayList<Zebra> homes;
class House extends Zebra {


  //x, y, ID, orintation, color


  House(int x, int y) {//created by user
    this.x=x;
    this.y=y;
    a1 = 1;
    a2 = 1;
    a3 = 1;
  } 
  House(int x, int y, int a1, int a2, int a3) {//loaded
    this.x=x;
    this.y=y;
    this.a1=a1;
    this.a2=a2;
    this.a3=a3;
  } 
  void update() {
    noStroke();
    fill(#0000FF);
    rect(x*g - g/2, y*g-g/2, 2*g, 2*g);
    fill(0);
    //doors
    //a2?
    if (a2 == 1)
      ellipse(x*g + g/2, y*g - g/2, 5, 5);//up
    else if (a2 == 2) 
      ellipse(x*g+g/2, y*g + g + g/2, 5, 5);//down
    else if (a2 == 3) 
      ellipse(x*g -g/2, y*g + g/2, 5, 5);//left
    else if (a2 == 4) 
      ellipse(x*g + g+g/2, y*g + g/2, 5, 5);//right


    textSize(10);
    textAlign(LEFT);
    text("H" + n + "-"+ a1, g*x-g/2, g*y);
  }
}


ArrayList<Zebra> buses;
class Bus extends Zebra {
  //x, y, routeID, nextMapID, dir
  Bus(int x, int y) {
    this.x=x;
    this.y=y;
    a1 = 1;
    a2 = 1;
    a3 = 1;
  } 

  Bus(int x, int y, int a1, int a2, int a3) {
    this.x=x;
    this.y=y;
    this.a1=a1;
    this.a2=a2;
    this.a3=a3;
  } 

  void update() {
    noStroke();
    fill(#00FF00);
    rect(x*g, y*g, g, g);
    fill(0);

    if (a3 == 1) 
      ellipse(x*g + g/2, y*g, 5, 5);//up
    else if (a3 == 2) 
      ellipse(x*g+g/2, y*g + g, 5, 5);//down
    else if (a3 == 3) 
      ellipse(x*g, y*g + g/2, 5, 5);//left
    else if (a3 == 4) 
      ellipse(x*g + g, y*g + g/2, 5, 5);//right


    textSize(10);
    textAlign(LEFT);
    text("b" + n + "-"+ a1+""+a2, g*x, g*y+g/2);
  }
}






ArrayList<Zebra> rocks;
//ArrayList lilys;
class Rock extends Zebra {

  //in,   int b;
  int go;
  int b, s;
  Rock(int x, int y) {//created on mouseclick
    this.x = x;
    this.y = y;
  }


  Rock(int x, int y, int a1) {
    this.x=x;
    this.y=y; 
    this.a1 = a1;

    go = 0;
    b = 0;


    if (a1> 0 && a1< 5)///used for animation
      b = a1* 20;
  } 






  void update() {
    if (a1> 10)
      a1= 0;
    if (b>0) {
      b++;
      if (b > 60) {
        go = 1;
        if (b > 80) {
          go = 0;
          b = 1;
        }
      }
    }


    if (go == 0) {
      fill(160);
      if (s == 1)//special
        fill(160, 100);
      else if (a1== 5) {//dissapear
        fill(#FF0000, 100);
      }
      ellipse(x*g + g/2, y*g + g/2, g/2, g/2);
      fill(0);
      textSize(10);
      textAlign(CENTER);
      text("r" + n, g*(x)+g/2, g*(y)+g/2+6);
    }
  }
}

