void newLevel(int q){
    numLevs++;
    theLevel = new String[numLevs*numLines];

    for (int i = 0; i < (q)*numLines; i++)
      theLevel[i] = lLevel[i];

   theLevel[q*5] = "000-03120412070999";
  theLevel[q*5+1] = "x";
  theLevel[q*5+2] = "000512";
  theLevel[q*5+3] = "0313041303140414";
  theLevel[q*5+4] = "x";


    for (int i = (q + 1)*numLines; i < numLevs*numLines; i++)
      theLevel[i] = lLevel[i-numLines];
      
      if(q == 1){
        lev = 1;
      }

    saveStrings("data/l.txt", theLevel);
    lLevel = loadStrings("l.txt");//load everything
    
    
  
}