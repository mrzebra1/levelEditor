


String[] saveData;
int saveVar = -1;

int numLines = 8;



void  saveStuff() {

  if (saveVar == -99) {
   // numLines = 7;
    saveData = new String[numLevs*numLines];
    println(numLevs + " " + saveData.length);
    saveVar = 0;
  }

  if (saveVar >=0) {
    //numLines = 7;
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
  String line8 = "";//items


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




  for (int i = 0; i <lands.size (); i++) {
    line2+=returnStuff(((Land)lands.get(i)).x);
    line2+=returnStuff( ((Land)lands.get(i)).y);
    line2+=returnStuff( (lands.get(i)).a1);
    line2+=returnStuff( (lands.get(i)).a2);
  }
  if (lands.size() == 0)
    line2+="L";


  for (int i = 0; i <rocks.size (); i++) {

    line3+=returnStuff( rocks.get(i).x);
    line3+=returnStuff( rocks.get(i).y);
    line3+=returnStuff( rocks.get(i).a1);
  }

  if (rocks.size() == 0)
    line3+="R";

  for (int i = 0; i <flys.size (); i++) {
    line4+=returnStuff( ((Fly)flys.get(i)).x);
    line4+=returnStuff( ((Fly)flys.get(i)).y);
  }

  if (flys.size() == 0)
    line4+="F";



  //line 5

  for (int i = 0; i <bees.size (); i++) {
    line5+=returnStuff( ((Bee)bees.get(i)).type);
    line5+=returnStuff( ((Bee)bees.get(i)).x);
    line5+=returnStuff( ((Bee)bees.get(i)).y);
    line5+=returnStuff( ((Bee)bees.get(i)).r);
    line5+=returnStuff( ((Bee)bees.get(i)).v);
  }


  for (int i = 0; i <lshoots.size (); i++) {
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
    line5+="E";


  for (int i = 0; i <homes.size (); i++) {
    line6+=returnStuff(homes.get(i).x);
    line6+=returnStuff(homes.get(i).y);
    line6+=returnStuff(homes.get(i).a1);
    line6+=returnStuff(homes.get(i).a2);
    line6+=returnStuff(homes.get(i).a3);
  }

  if (homes.size() == 0)
    line6+="H";


  for (int i = 0; i <buses.size (); i++) {
    line7+=returnStuff(buses.get(i).x);
    line7+=returnStuff(buses.get(i).y);
    line7+=returnStuff(buses.get(i).a1);
    line7+=returnStuff(buses.get(i).a2);
    line7+=returnStuff(buses.get(i).a3);
  }

  if (buses.size() == 0)
    line7+="B";




  for (int i = 0; i <items.size (); i++) {
    line8+=returnStuff(items.get(i).x);
    line8+=returnStuff(items.get(i).y);
    line8+=returnStuff(items.get(i).a1);
  }

  if (items.size() == 0)
    line8+="i";



  saveData[numLines*q+0] = line1;
  saveData[numLines*q+1] = line2;
  saveData[numLines*q+2] = line3;
  saveData[numLines*q+3] = line4;
  saveData[numLines*q+4] = line5;
  saveData[numLines*q+5] = line6;
  saveData[numLines*q+6] = line7;
  saveData[numLines*q+7] = line8;
}

