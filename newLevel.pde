void newLevel(int q){
    numLevs++;
    theLevel = new String[numLevs*5];

    for (int i = 0; i < (q)*5; i++)
      theLevel[i] = lLevel[i];

   theLevel[q*5] = "000-03120412070999";
  theLevel[q*5+1] = "x";
  theLevel[q*5+2] = "000512";
  theLevel[q*5+3] = "0313041303140414";
  theLevel[q*5+4] = "x";


    for (int i = (q + 1)*5; i < numLevs*5; i++)
      theLevel[i] = lLevel[i-5];
      
      if(q == 1){
        lev = 1;
      }

    saveStrings("data/l.txt", theLevel);
    lLevel = loadStrings("l.txt");//load everything
    
    
  
}
