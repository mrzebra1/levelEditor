













int numRow = 40;




void Obj(ArrayList<Zebra> q, int px, int py, int beg, int end) {
  int ppy = py;
  fill(0);
  textSize( 10);
  textAlign(LEFT);



  for (int i = 0; i < q.size(); i++) {  
    //println(instanceof q );
    text(i + ": " + q.get(i).x + ", " + q.get(i).y + ", " + q.get(i).a1 + ", " + q.get(i).a2+", "+q.get(i).a3, px+10, py+14.5);//number
    ellipse(px, py+10, 10, 10);//delete button

    for (int j = beg; j <end; j++) {
      ellipse(px + 120 + 15*j, py+10, 10, 10);//delete button

      if (mouseP && dist(px + 120 + 15*j, py+10, mouseX, mouseY)<5) {
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
    if (i == 20) {//restack
      px += 200;
      py = ppy;
    }
  }
}


/*
void rockTab(int px, int py) {
 int ppy = py;
 
 
 fill(0);
 textSize( 10);
 textAlign(LEFT);
 
 
 String locs1 = "";
 int k = 0;
 for (int i = 0; i <lilys.size(); i++) {
 locs1 = "";
 k = 2;
 if (i>9)
 k=8;
 if ( ((Rock) lilys.get(i)).s == 1) {
 locs1 = "s";
 k+=5;
 }
 fill(200);
 ellipse(px + 25.5+k, py+10+2, 10, 10);
 
 fill(0);
 text(i + locs1 +" (" +((Rock) lilys.get(i)).a1 + ") ", px+10, py+14.5);
 ellipse(px, py+10, 10, 10);
 
 if (mouseP && dist(px + 25.5+k, py+10+2, mouseX, mouseY)<5) {//change type
 ((Rock) lilys.get(i)).a1++;
 ((Rock) lilys.get(i)).b = ((Rock) lilys.get(i)).a1 * 20;
 
 mouseP = false;
 } else if (mouseP && dist(px, py+10, mouseX, mouseY)<5) {
 mouseP = false;
 if (((Rock) lilys.get(i)).s==1)
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
 */
