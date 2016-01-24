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
  //x, y, building, orintation, ID
  House(int x, int y) {
    this.x=x;
    this.y=y;
  } 

  void drawMe() {
    noStroke();
    fill(#0000FF);
    rect(x*g - g/2, y*g-g/2, 2*g, 2*g);
    fill(0);
    textFont(myFont, 10);
    textAlign(CENTER);
    text("H" + n, g*(x+a1/2), g*(y+a2/2)+6);
  }
}








ArrayList lilys;
class Lily {
  int x, y, n, s;
  int type;
  int b;
  int go;
  Lily(int type, int x, int y) {
    this.x=x;
    this.y=y; 
    go = 0;
    b = 0;
    this.type = type;
    if (type > 0 && type < 5)
      b = type * 20;
  } 
  void drawMe() {
    if (type > 10)
      type = 0;
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
      else if (type == 5) {//dissapear
        fill(#FF0000, 100);
      }
      ellipse(x*g + g/2, y*g + g/2, g/2, g/2);
      fill(0);
      textFont(myFont, 10);
      textAlign(CENTER);
      text("P" + n, g*(x)+g/2, g*(y)+g/2+6);
    }
  }
}




int numRow = 20;




void Obj(ArrayList<Zebra> q, int px, int py) {
  int ppy = py;
  fill(0);
  textFont(myFont, 10);
  textAlign(LEFT);



  for (int i = 0; i < q.size(); i++) {  
    //println(instanceof q );
    text(i + ": " + q.get(i).x + "," + q.get(i).y + "," + q.get(i).a1 + "," + q.get(i).a2+","+q.get(i).a2, px+10, py+14.5);//number
    ellipse(px, py+10, 10, 10);//delete button

    for (int j = 0; j <5; j++) {
      ellipse(px + 100 + 15*j, py+10, 10, 10);//delete button

      if (mouseP && dist(px + 100 + 15*j, py+10, mouseX, mouseY)<5) {
        if (j == 0)
          q.get(i).x=parseInt(pin);
        if (j == 1)
          q.get(i).y=parseInt(pin);
        if (j == 2)
          q.get(i).a1=parseInt(pin);
        if (j == 3)
          q.get(i).a2=parseInt(pin);
        if (j == 4)
          q.get(i).a3=parseInt(pin);

        mouseP = false;

        return;
      }
    }



    if (mouseP && dist(px, py+10, mouseX, mouseY)<5) {//delete on Press
      mouseP = false;
      q.remove(i);
      return;
      //i--;
    }

    py+=15;
    if (py > numRow*15) {//restack
      px += 80;
      py = ppy;
    }
  }
}


void rockTab(int px, int py) {
  int ppy = py;


  fill(0);
  textFont(myFont, 10);
  textAlign(LEFT);


  String locs1 = "";
  int k = 0;
  for (int i = 0; i <lilys.size(); i++) {
    locs1 = "";
    k = 2;
    if (i>9)
      k=8;
    if ( ((Lily) lilys.get(i)).s == 1) {
      locs1 = "s";
      k+=5;
    }
    fill(200);
    ellipse(px + 25.5+k, py+10+2, 10, 10);

    fill(0);
    text(i + locs1 +" (" +((Lily) lilys.get(i)).type + ") ", px+10, py+14.5);
    ellipse(px, py+10, 10, 10);

    if (mouseP && dist(px + 25.5+k, py+10+2, mouseX, mouseY)<5) {//change type
      ((Lily) lilys.get(i)).type++;
      ((Lily) lilys.get(i)).b = ((Lily) lilys.get(i)).type * 20;

      mouseP = false;
    } else if (mouseP && dist(px, py+10, mouseX, mouseY)<5) {
      mouseP = false;
      if (((Lily) lilys.get(i)).s==1)
        specialCount--;
      lilys.remove(i);
      i--;
    }

    py+=15;
    if (py > 300) {
      px += 80;
      py = ppy;
    }
  }
}