void drawMap() {
  for (int i = 0; i < lands.size (); i++) {
    lands.get(i).n=i;
    lands.get(i).update();
  }

  for (int i = 0; i <homes.size (); i++) {
    homes.get(i).n=i;
    homes.get(i).update();
  }

  for (int i = 0; i <buses.size (); i++) {
    buses.get(i).n=i;
    buses.get(i).update();
  }

  for (int i = 0; i <rocks.size (); i++) {
    rocks.get(i).n=i;
    rocks.get(i).update();
  }

  for (int i = 0; i <items.size (); i++) {
    items.get(i).n=i;
    items.get(i).update();
  }








  //flys
  for (int i = 0; i <flys.size (); i++) {
    ((Fly) flys.get(i)).n=i;
    ((Fly) flys.get(i)).update();
  }

  //bees
  for (int i = 0; i <bees.size (); i++) {
    ((Bee) bees.get(i)).n=i;
    ((Bee) bees.get(i)).update();
  }

  //lavashooters
  for (int i = 0; i <lshoots.size (); i++) {
    ((LShoot) lshoots.get(i)).n=i;
    ((LShoot) lshoots.get(i)).update();
  }






  //fill(#FF0000);
  drawHero(sx*g + g/2, sy*g+g/2, .5, #02AF28);

  //fill(#FF00FF);
  drawHero(ex*g + g/2, ey*g+g/2, .5, 0);

  //draw Snake
  fill(#FFFF00);
  ellipse(snakeX*g + g/2, snakeY*g + g/2, 10, 10);
  fill(0);
  ellipse(snakeX*g + g/2, snakeY*g + g/2, 5, 5);


  drawGrid(g);//grid

  noFill();//map width & height
  strokeWeight(2);
  stroke(#FF0000);
  rect(0, 0, lw*g, lh*g);
  strokeWeight(1);
  stroke(0, 128);
  rect(0, 0, 7*g, 9*g);
}

