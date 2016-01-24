void drawMap() {
  //lands
  for (int i = 0; i < lands.size(); i++) {
    ((Land) lands.get(i)).n=i;
    ((Land)(lands.get(i))).drawMe();
  }

  //rocks
  for (int i = 0; i <lilys.size();i++) {
    ((Lily) lilys.get(i)).n=i;
    ((Lily) lilys.get(i)).drawMe();
  }

  //flys
  for (int i = 0; i <flys.size();i++) {
    ((Fly) flys.get(i)).n=i;
    ((Fly) flys.get(i)).drawMe();
  }

  //bees
  for (int i = 0; i <bees.size();i++) {
    ((Bee) bees.get(i)).n=i;
    ((Bee) bees.get(i)).drawMe();
  }
  
    //lavashooters
  for (int i = 0; i <lshoots.size();i++) {
    ((LShoot) lshoots.get(i)).n=i;
    ((LShoot) lshoots.get(i)).drawMe();
  }
  
  
      //homes
  for (int i = 0; i <homes.size();i++) {
    ((House)homes.get(i)).n=i;
    ((House)homes.get(i)).drawMe();
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