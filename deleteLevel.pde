void deleteLevel(int q) {
  println("delete this: " + q);

  for (int i = 0; i < 5; i++) {
    lLevel[(q-1)*5 + i] = null;
  }


  numLevs--;
  if (numLevs > 0) {
    theLevel = new String[numLevs*5];
    int ii = 0;
    for (int i = 0; i < (numLevs+1)*5; i++) {
      if (lLevel[i] != null) {
        theLevel[ii] = lLevel[i];
        ii++;
      }
    }
    saveStrings("data/l.txt", theLevel); 
    lLevel = loadStrings("l.txt");//load everything
    
    if(lev == numLevs+1){
     lev--; 
    }
  }else{
    numLevs = 1;
    theLevel[0] = "000-03120412070999";
    theLevel[1] = "x";
    theLevel[2] = "000512";
    theLevel[3] = "0313041303140414";
    theLevel[4] = "x";
    saveStrings("data/l.txt", theLevel);
    lLevel = loadStrings("l.txt");//load everything
    lev = 1;    
  }


  loadLevel(lev);


}

