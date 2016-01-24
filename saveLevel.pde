void saveLevel(int q){
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
    for (int i = 0; i <lands.size();i++) {
      theLevel[1 + q]+=returnStuff(((Land)lands.get(i)).x);
      theLevel[1 + q]+=returnStuff( ((Land)lands.get(i)).y);
      theLevel[1 + q]+=returnStuff( ((Land)lands.get(i)).w);
      theLevel[1 + q]+=returnStuff( ((Land)lands.get(i)).h);
    }
    if (lands.size() == 0)
      theLevel[1 + q]+="x";

    //line 3
    theLevel[2 + q] = new String();
    for (int i = 0; i <lilys.size();i++) {
      theLevel[2 + q]+=returnStuff( ((Lily)lilys.get(i)).type);
      theLevel[2 + q]+=returnStuff( ((Lily)lilys.get(i)).x);
      theLevel[2 + q]+=returnStuff( ((Lily)lilys.get(i)).y);
    }

    if (lilys.size() == 0)
      theLevel[2 + q]+="you need at least 1 rock";
      
    //line 4
    theLevel[3 + q] = new String();
    for (int i = 0; i <flys.size();i++) {
      theLevel[3 + q]+=returnStuff( ((Fly)flys.get(i)).x);
      theLevel[3 + q]+=returnStuff( ((Fly)flys.get(i)).y);
    }

    if (flys.size() == 0)
      theLevel[3 + q]+="x";

    //line 5
    theLevel[4 + q] = new String();
    for (int i = 0; i <bees.size();i++) {
      theLevel[4 + q]+=returnStuff( ((Bee)bees.get(i)).type);
      theLevel[4 + q]+=returnStuff( ((Bee)bees.get(i)).x);
      theLevel[4 + q]+=returnStuff( ((Bee)bees.get(i)).y);
      theLevel[4 + q]+=returnStuff( ((Bee)bees.get(i)).r);
      theLevel[4 + q]+=returnStuff( ((Bee)bees.get(i)).v);
    }
    
    
        for (int i = 0; i <lshoots.size();i++) {
          theLevel[4 + q]+="20";
      theLevel[4 + q]+=returnStuff( ((LShoot)lshoots.get(i)).x);
      theLevel[4 + q]+=returnStuff( ((LShoot)lshoots.get(i)).y);
      theLevel[4 + q]+="xxxx";

    }
    
    if(snakeX != -99){
      theLevel[4 + q]+="10";
      theLevel[4 + q]+=returnStuff(snakeX);
      theLevel[4 + q]+=returnStuff( snakeY);
      theLevel[4 + q]+=returnStuff( snakeV);
      theLevel[4 + q]+="xx";
      
    }
    
    
 
    if (bees.size() == 0 && snakeX == -99 && lshoots.size() == 0)
      theLevel[4 + q]+="x";
}
