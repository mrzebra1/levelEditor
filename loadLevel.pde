String levWords;

void loadLevel(int q) {
  homes = new ArrayList();
  buses = new ArrayList();
  lands = new ArrayList();
  rocks = new ArrayList();
  items = new ArrayList();


  //  lilys = new ArrayList();
  flys = new ArrayList();
  bees = new ArrayList();
  lshoots = new ArrayList();
  specialCount = 0;
  snakeX = -99;
  snakeY = -99;

  int laz = q - 1;


  String k;
  int kk=0;
  int t;




  int x, y, a1, a2, a3;





  //lands
  k = lLevel[1 +laz*numLines];
  if (k.length() > 1) {
    kk = 0;
    for (int i = 0; i < k.length (); i+=10) {
      x = parseInt(k.substring(i, i+2));
      y = parseInt(k.substring(i+2, i+4));
      a1 = parseInt(k.substring(i+4, i+6));
      a2 = parseInt(k.substring(i+6, i+8));
      a3 = parseInt(k.substring(i+8, i+10));
      lands.add(new Land(x, y, a1, a2,a3  ));
    }
  }



  //homes
  k = lLevel[5 +laz*numLines];
  if (k.length() > 1) {
    kk = 0;
    for (int i = 0; i < k.length (); i+=10) {
      x = parseInt(k.substring(i, i+2));
      y = parseInt(k.substring(i+2, i+4));
      a1 = parseInt(k.substring(i+4, i+6));
      a2 = parseInt(k.substring(i+6, i+8));
      a3 = parseInt(k.substring(i+8, i+10));


      homes.add(new House(x, y, a1, a2, a3));
    }
  }


  k = lLevel[6 +laz*numLines];
  if (k.length() > 1) {
    kk = 0;
    for (int i = 0; i < k.length (); i+=10) {
      buses.add(new Bus(  parseInt(k.substring(i, i+2)), parseInt(k.substring(i+2, i+4)), parseInt(k.substring(i+4, i+6)), parseInt(k.substring(i+6, i+8)), parseInt(k.substring(i+8, i+10))));
    }
  }


  /*
  k = lLevel[7 +laz*numLines];
   if (k.length() > 1) {
   kk = 0;
   for (int i = 0; i < k.length (); i+=6) {
   items.add(new Item(  parseInt(k.substring(i, i+2)), parseInt(k.substring(i+2, i+4)), parseInt(k.substring(i+4, i+6))));
   }
   }
   
   */



  //flys
  k = lLevel[3+laz*numLines];
  if (k.length() > 1) {
    kk = k.length()/16;

    // println("flyGroups: " + kk);
    for (int i = 0; i < k.length (); i+=4) {
      flys.add(new Fly(  parseInt(k.substring(i, i+2)), parseInt(k.substring(i+2, i+4))));
    }
  }


  //rocks!
  k = lLevel[2+laz*numLines];
  if (k.length() > 1) {
    t = 1;
    for (int i = 0; i < k.length (); i+=6) {
      t = 0;
      //if (i < kk*6) {
      //   t = 1;
      //   specialCount++;
      // }
      rocks.add(new Rock(parseInt(k.substring(i, i+2)), parseInt(k.substring(i+2, i+4)), parseInt(k.substring(i+4, i+6))));
      //((Rock)lilys.get(lilys.size() -1)).s=t;
    }
  }


  //various info



  String itemz = "";//everything after 16 will be item stuff
  //xx yy type --> 000000 six digits



  k = lLevel[0+laz*numLines];
  if (k.length() > 1) {
    id = parseInt(k.substring(0, 3));
    sx = parseInt(k.substring(4, 6));
    sy = parseInt(k.substring(6, 8));
    ex = parseInt(k.substring(8, 10));
    ey = parseInt(k.substring(10, 12));
    lw = parseInt(k.substring(12, 14));
    lh = parseInt(k.substring(14, 16));


    itemz = k.substring(16);
  }

  k = itemz;



  if (k.length() > 1) {
    kk = 0;
    for (int i = 0; i < k.length (); i+=6) {
      x = parseInt(k.substring(i, i+2));
      y = parseInt(k.substring(i+2, i+4));
      a1 = parseInt(k.substring(i+4, i+6));


      items.add(new Item( x, y, a1));
    }
  }

 // println(itemz);











  //enemies
  k = lLevel[4+laz*numLines];
  if (k.length() > 1) {
    for (int i = 0; i < k.length (); i+=10) {
      t =  parseInt(k.substring(i, i + 2));
      if ( t < 10) {
        bees.add(new Bee(parseInt(k.substring(i+2, i+4)), parseInt(k.substring(i+4, i+6))));
        ((Bee)bees.get(bees.size() -1)).setVars(t, parseInt(k.substring(i+6, i+8)), parseInt(k.substring(i+8, i+10)));
      } else if (t == 10) {
        snakeX = parseInt(k.substring(i+2, i+4));
        snakeY =  parseInt(k.substring(i+4, i+6));
        snakeV =  parseInt(k.substring(i+6, i+8));
      } else if (t == 20) {
        lshoots.add(new LShoot(parseInt(k.substring(i+2, i+4)), parseInt(k.substring(i+4, i+6))));
      }
    }
  }
}

