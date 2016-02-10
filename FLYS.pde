ArrayList lshoots;
class LShoot {
  int x, y, n;
  LShoot(int x, int y) {
    this.x=x;
    this.y=y;
  } 

  void update() {
    noStroke();
    fill(#0000FF);
    ellipse(x*g + g/2, y*g + g/2, g/2, g/2);
    fill(0);
    textSize(12);
    textAlign(CENTER);
    text("la" + n, g*(x)+g/2, g*(y)+g/2+6);
  }
}



ArrayList flys;
class Fly {
  int x, y, n;
  Fly(int x, int y) {
    this.x=x;
    this.y=y;
  } 

  void update() {
    noStroke();
    fill(#8302DB);
    ellipse(x*g + g/2, y*g + g/2, g/2, g/2);
    fill(0);
    textSize(12);
    textAlign(CENTER);
    text("f" + n, g*(x)+g/2, g*(y)+g/2+6);
  }
}






void flyTab(int px, int py) {
  int ppy = py;

  fill(0);
  textSize(10);
  textAlign(LEFT);

  for (int i = 0; i <flys.size (); i++) {
    text(i, px+10, py+14.5);
    ellipse(px, py+10, 10, 10);
    if (mouseP && dist(px, py+10, mouseX, mouseY)<5) {
      mouseP = false;
      flys.remove(i);
      i--;
    }
    py += 15;
    if (py > 300) {
      px += 80;
      py = ppy;
    }
  }
}





//FIX
void beeTab(int px, int py) {

  fill(0);
  textSize(10);
  textAlign(LEFT);
  int k = 0;

  for (int i = 0; i <bees.size (); i++) {
    k = 2;
    if (i>9)
      k+=6;



    fill(200);
    ellipse(px + 25.5+k, py+10+2, 10, 10);

    fill(0);
    text(i + " (" +((Bee) bees.get(i)).a1 + ") " +((Bee) bees.get(i)).a2+ ", " +((Bee) bees.get(i)).a3, px+10, py+14.5);
    ellipse(px, py+10, 10, 10);

    fill(0);
    fill(200);
    ellipse(k+25+px + 50, py+10+2, 10, 10);
    ellipse(k+25+px + 65, py+10+2, 10, 10);
    ellipse(k+25+px + 80, py+10+2, 10, 10);
    ellipse(k+25+px + 95, py+10+2, 10, 10);



    if (mouseP && dist(px, py+10, mouseX, mouseY)<5) {//delete
      mouseP = false;
      bees.remove(i);
      i--;
    } else if (mouseP && dist(px + 25.5+k, py+10+2, mouseX, mouseY)<5) {//change type
      ((Bee) bees.get(i)).a1++;
      mouseP = false;
    } else if (mouseP && dist(k+25+px + 50, py+10+2, mouseX, mouseY)<5) {
      ((Bee) bees.get(i)).a2--;
      mouseP = false;
    } else if (mouseP && dist(k+25+px + 65, py+10+2, mouseX, mouseY)<5) {
      ((Bee) bees.get(i)).a2++;
      mouseP = false;
    } else if (mouseP && dist(k+25+px + 80, py+10+2, mouseX, mouseY)<5) {
      ((Bee) bees.get(i)).a3--;
      mouseP = false;
    } else if (mouseP && dist(k+25+px + 95, py+10+2, mouseX, mouseY)<5) {
      ((Bee) bees.get(i)).a3++;
      mouseP = false;
    }










    py += 15;
  }



  if (snakeX != -99) {
    if (bees.size() > 0)
      py+=15;

    fill(200);
    ellipse(px + 50.5, py+10+2, 10, 10);

    if (mouseP && dist(px + 50.5, py+10+2, mouseX, mouseY)<5) {
      snakeV++;
      if (snakeV > 9)
        snakeV = 1;
      mouseP = false;
    } else if (mouseP && dist(px, py+10, mouseX, mouseY)<5) {
      snakeX = -99;
      snakeY = -99;
      mouseP = false;
    }



    fill(0);
    ellipse(px, py+10, 10, 10);
    text("snake" + " (" + snakeV + ")", px+10, py+14.5);
    py += 15;
  }





  if ( bees.size() > 0)
    py+=15;


  //  if(snakeX != -99 &&  bees.size() == 0)
  // py+=15;

  for (int i = 0; i < lshoots.size (); i++) {
    fill(0);
    ellipse(px, py+10, 10, 10);
    text("lavaShooter" + i, px+10, py+14.5);


    if (mouseP && dist(px, py+10, mouseX, mouseY)<5) {//delete
      mouseP = false;
      lshoots.remove(i);
      i--;
    }



    py+=15;
  }
}

