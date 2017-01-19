class Walker{
  //int x;
  //int y;
  
  float x;
  float y;
  
  Walker(){
    x = width/2;
    y = height/2;
  }
  
  void display(){
    stroke(0);
    point(x,y);
  }
  
  void step(){
    //int choise = int(random(4));
    //if(choise == 0){
    //  x++;
    //}else if(choise ==1){
    //  x--;
    //}else if(choise ==2){
    //  y++;
    //}else{
    //  y--;
    //}
    
    //-----------method 2--------------
    //int stepx = int(random(3))-1;
    //int stepy = int(random(3))-1;
    //x+=stepx;
    //y+=stepy;
    
    //------------method 3-------------
    float stepx = random(-1,1);
    float stepy = random(-1,1);
    x+=stepx;
    y+=stepy;
    
    
  }
  
}