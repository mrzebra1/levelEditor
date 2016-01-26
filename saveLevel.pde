void saveLevel(int q) {
  q*=5;

  //line 1
  theLevel[0 + q] = new String();
  theLevel[0 + q]+= returnStuff2(id) + "-";
  theLevel[0 + q]+=returnStuff(sx);
  theLevel[0 + q]+=returnStuff(sy);
  theLevel[0 + q]+=returnStuff(ex);
  theLevel[0 + q]+=returnStuff(ey);
  theLevel[0 + q]+=returnStuff(lw);
  theLevel[0 + q]+=returnStuff(lh);
  theLevel[0 + q]+=returnStuff(par);
  theLevel[0 + q]+=levWords;

  //line 2
  theLevel[1 + q] = new String();
  for (int i = 0; i <lands.size(); i++) {
    theLevel[1 + q]+=returnStuff(((Land)lands.get(i)).x);
    theLevel[1 + q]+=returnStuff( ((Land)lands.get(i)).y);
    theLevel[1 + q]+=returnStuff( (lands.get(i)).a1);
    theLevel[1 + q]+=returnStuff( (lands.get(i)).a2);
  }
  if (lands.size() == 0)
    theLevel[1 + q]+="x";

  //line 3
  theLevel[2 + q] = new String();
  for (int i = 0; i <lilys.size(); i++) {
    theLevel[2 + q]+=returnStuff( ((Lily)lilys.get(i)).type);
    theLevel[2 + q]+=returnStuff( ((Lily)lilys.get(i)).x);
    theLevel[2 + q]+=returnStuff( ((Lily)lilys.get(i)).y);
  }

  if (lilys.size() == 0)
    theLevel[2 + q]+="you need at least 1 rock";

  //line 4
  theLevel[3 + q] = new String();
  for (int i = 0; i <flys.size(); i++) {
    theLevel[3 + q]+=returnStuff( ((Fly)flys.get(i)).x);
    theLevel[3 + q]+=returnStuff( ((Fly)flys.get(i)).y);
  }

  if (flys.size() == 0)
    theLevel[3 + q]+="x";

  //line 5
  theLevel[4 + q] = new String();
  for (int i = 0; i <bees.size(); i++) {
    theLevel[4 + q]+=returnStuff( ((Bee)bees.get(i)).type);
    theLevel[4 + q]+=returnStuff( ((Bee)bees.get(i)).x);
    theLevel[4 + q]+=returnStuff( ((Bee)bees.get(i)).y);
    theLevel[4 + q]+=returnStuff( ((Bee)bees.get(i)).r);
    theLevel[4 + q]+=returnStuff( ((Bee)bees.get(i)).v);
  }


  for (int i = 0; i <lshoots.size(); i++) {
    theLevel[4 + q]+="20";
    theLevel[4 + q]+=returnStuff( ((LShoot)lshoots.get(i)).x);
    theLevel[4 + q]+=returnStuff( ((LShoot)lshoots.get(i)).y);
    theLevel[4 + q]+="xxxx";
  }

  if (snakeX != -99) {
    theLevel[4 + q]+="10";
    theLevel[4 + q]+=returnStuff(snakeX);
    theLevel[4 + q]+=returnStuff( snakeY);
    theLevel[4 + q]+=returnStuff( snakeV);
    theLevel[4 + q]+="xx";
  }



  if (bees.size() == 0 && snakeX == -99 && lshoots.size() == 0)
    theLevel[4 + q]+="x";
}


String[] saveData;
int saveVar = -1;
int numLines = 7;

void  saveStuff() {

  if (saveVar == -99) {
    numLines = 7;
    saveData = new String[numLevs*numLines];
    println(numLevs + " " + saveData.length);
    saveVar = 0;
  }

  if (saveVar >=0) {
    numLines = 7;
    save1Lev(lev);
    saveVar++;
    if (saveVar > numLevs-1) {
      saveVar = -1;
      saveStrings("data/cheese.txt", saveData);
      lLevel = loadStrings("cheese.txt");//load everything
    }
    lev++;
    if (lev > numLevs) 
      lev = 1;

   // numLines = 6;
    loadLevel(lev);
  }





  //loadLevel(lev);
}

void save1Lev(int q) {
  q--;

  String line1 = "";
  String line2 = "";
  String line3 = "";
  String line4 = "";
  String line5 = "";
  String line6 = "";
  String line7 = "";


  //line 1
  line1+= returnStuff2(id) + "-";//do I need this
  line1+=returnStuff(sx);
  line1+=returnStuff(sy);
  line1+=returnStuff(ex);
  line1+=returnStuff(ey);
  line1+=returnStuff(lw);
  line1+=returnStuff(lh);
  line1+=returnStuff(par);//no
  line1+=levWords;


  for (int i = 0; i <lands.size(); i++) {
    line2+=returnStuff(((Land)lands.get(i)).x);
    line2+=returnStuff( ((Land)lands.get(i)).y);
    line2+=returnStuff( (lands.get(i)).a1);
    line2+=returnStuff( (lands.get(i)).a2);
  }
  if (lands.size() == 0)
    line2+="x";




  for (int i = 0; i <lilys.size(); i++) {
    line3+=returnStuff( ((Lily)lilys.get(i)).type);
    line3+=returnStuff( ((Lily)lilys.get(i)).x);
    line3+=returnStuff( ((Lily)lilys.get(i)).y);
  }

  if (lilys.size() == 0)
    line3+="you need at least 1 rock";




  for (int i = 0; i <flys.size(); i++) {
    line4+=returnStuff( ((Fly)flys.get(i)).x);
    line4+=returnStuff( ((Fly)flys.get(i)).y);
  }

  if (flys.size() == 0)
    line4+="x";



  //line 5

  for (int i = 0; i <bees.size(); i++) {
    line5+=returnStuff( ((Bee)bees.get(i)).type);
    line5+=returnStuff( ((Bee)bees.get(i)).x);
    line5+=returnStuff( ((Bee)bees.get(i)).y);
    line5+=returnStuff( ((Bee)bees.get(i)).r);
    line5+=returnStuff( ((Bee)bees.get(i)).v);
  }


  for (int i = 0; i <lshoots.size(); i++) {
    line5+="20";
    line5+=returnStuff( ((LShoot)lshoots.get(i)).x);
    line5+=returnStuff( ((LShoot)lshoots.get(i)).y);
    line5+="xxxx";
  }

  if (snakeX != -99) {
    line5+="10";
    line5+=returnStuff(snakeX);
    line5+=returnStuff( snakeY);
    line5+=returnStuff( snakeV);
    line5+="xx";
  }



  if (bees.size() == 0 && snakeX == -99 && lshoots.size() == 0)
    line5+="x";


  for (int i = 0; i <homes.size(); i++) {
    line6+=returnStuff(homes.get(i).x);
    line6+=returnStuff(homes.get(i).y);
    line6+=returnStuff(homes.get(i).a1);
    line6+=returnStuff(homes.get(i).a2);
    line6+=returnStuff(homes.get(i).a3);
  }

  if (homes.size() == 0)
    line6+="h";


  for (int i = 0; i <buses.size(); i++) {
    line7+=returnStuff(buses.get(i).x);
    line7+=returnStuff(buses.get(i).y);
    line7+=returnStuff(buses.get(i).a1);
    line7+=returnStuff(buses.get(i).a2);
    line7+=returnStuff(buses.get(i).a3);
  }

  if (buses.size() == 0)
    line7+="b";

  saveData[numLines*q+0] = line1;
  saveData[numLines*q+1] = line2;
  saveData[numLines*q+2] = line3;
  saveData[numLines*q+3] = line4;
  saveData[numLines*q+4] = line5;
  saveData[numLines*q+5] = line6;
  saveData[numLines*q+6] = line7;
}