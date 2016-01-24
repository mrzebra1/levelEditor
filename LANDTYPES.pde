ArrayList<Land> lands;
class Land {
  int x, y, a1, a2;//x, y, width, height
  int n;
  Land(int x, int y, int a1, int a2) {
    this.x=x;
    this.y=y; 
    this.a1=a1;
    this.a2=a2;
    this.n = n;
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


ArrayList<House> homes;
class House {
  int x, y, a1, a2;//x, y, building, orintation
  int n;
  House(int x, int y) {
    this.x=x;
    this.y=y; 
    //this.a1=a1;
    //this.a2=a2;
    this.n = n;
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




void landTab(ArrayList q, int px, int py) {//4 att dont need to change anything
  int ppy = py;

  fill(0);
  textFont(myFont, 10);
  textAlign(LEFT);
   
  for (int i = 0; i < lands.size(); i++) {   
    text(i, px+10, py+14.5);//number
    ellipse(px, py+10, 10, 10);//delete button
    if (mouseP && dist(px, py+10, mouseX, mouseY)<5) {//delete on Press
      mouseP = false;
      q.remove(i);
      i--;
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