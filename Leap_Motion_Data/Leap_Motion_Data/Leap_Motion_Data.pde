import de.voidplus.leapmotion.*;

PVector Thumb_Position;
PVector Index_Position;
PVector Middle_Position;
PVector Ring_Position;
PVector Pinky_Position;

PVector Hand_Position;
PVector Hand_Direction;
int     Hand_Num;

LeapMotion leap;
PFont font;

PrintWriter output1;
PrintWriter output2;
PrintWriter output3;
PrintWriter output4;
PrintWriter output5;
PrintWriter output6;
PrintWriter output7;

int a=0;

void setup()
{
  size(1280,720);
  smooth();
  background(255);
  strokeWeight(6);
  
  leap = new LeapMotion(this);
  font = loadFont("Serif-48.vlw");
  
  Window_Display();
  
  output1 = createWriter("Hand_Position.txt");
  output2 = createWriter("Hand_Direction.txt");
  output3 = createWriter("Thumb_Position.txt");
  output4 = createWriter("Index_Position.txt");
  output5 = createWriter("Middle_Position.txt");
  output6 = createWriter("Ring_Position.txt");
  output7 = createWriter("Pinky_Position.txt");
}

void draw()
{
  background(255);
  Window_Display();
  
  textFont(font,50);
  fill(255,0,0);
  text("Please put in one hand !",400,370);
  for(Hand hand:leap.getHands())
  {
    Hand_Num = leap.countHands();
    Thumb_Position    = hand.getThumb().getPosition();
    Index_Position    = hand.getIndexFinger().getPosition();
    Middle_Position   = hand.getMiddleFinger().getPosition();
    Ring_Position     = hand.getRingFinger().getPosition();
    Pinky_Position    = hand.getPinkyFinger().getPosition();
    Hand_Position     = hand.getPosition();
    Hand_Direction    = hand.getDirection();
    
    if(Hand_Num == 1)
    {
      if(hand.isLeft())  //Just find the left hand
      {
        background(255);
        if(a==1)
        {
          fill(255,0,0);
          ellipse(250,670,30,30);
        }
        if(a==0)
        {
          fill(0,255,0);
          ellipse(250,670,30,30);
        }
        
        Window_Display();
        textSize(0.1);
        strokeWeight(10);
        hand.draw(); 
        textFont(font, 50);
        fill(0);
        text("Left Hand",540,200);
        
        translate(360,60);
        textFont(font, 14);
        fill(0);
        //Display Hand Position//
        text("Hand Position.X:",0,200);      text(Hand_Position.x, 120, 200);
        text("Hand Position.Y:",200,200);    text(Hand_Position.y, 320, 200);
        text("Hand Position.Z:",400,200);    text(Hand_Position.z, 520, 200);
        output1.println(Hand_Position.x + ","+ Hand_Position.y + "," + Hand_Position.z);
        
        //Display Hand Direction//  
        text("Hand Direction.X:",0,290);     text(Hand_Direction.x, 120, 290);
        text("Hand Direction.Y:",200,290);   text(Hand_Direction.y, 320, 290);
        text("Hand Direction.Z:",400,290);   text(Hand_Direction.z, 520, 290); 
        output2.println(Hand_Direction.x + "," + Hand_Direction.y + "," + Hand_Direction.z);
        
        //Display Thumb Position//  
        text("Thumb Position.X:",0,380);     text(Thumb_Position.x, 120, 380);
        text("Thumb Position.Y:",200,380);   text(Thumb_Position.y, 320, 380);
        text("Thumb Position.Z:",400,380);   text(Thumb_Position.z, 520, 380);
        output3.println(Thumb_Position.x + "," + Thumb_Position.y + "," + Thumb_Position.z);
        
        //Display Index Position//  
        text("Index Position.X:",0,410);     text(Index_Position.x, 120, 410);
        text("Index Position.Y:",200,410);   text(Index_Position.y, 320, 410);
        text("Index Position.Z:",400,410);   text(Index_Position.z, 520, 410);
        output4.println(Index_Position.x + "," + Index_Position.y + "," + Index_Position.z);
        
        //Display Middle Position//  
        text("Middle Position.X:",0,440);     text(Middle_Position.x, 120, 440);
        text("Middle Position.Y:",200,440);   text(Middle_Position.y, 320, 440);
        text("Middle Position.Z:",400,440);   text(Middle_Position.z, 520, 440);
        output5.println(Middle_Position.x + "," + Middle_Position.y + "," + Middle_Position.z);
        
        //Display Ring Position//  
        text("Ring Position.X:",0,470);     text(Ring_Position.x, 120, 470);
        text("Ring Position.Y:",200,470);   text(Ring_Position.y, 320, 470);
        text("Ring Position.Z:",400,470);   text(Ring_Position.z, 520, 470);
        output6.println(Ring_Position.x + "," + Ring_Position.y + "," + Ring_Position.z);
        
        //Display Pinky Position//  
        text("Pinky Position.X:",0,500);     text(Pinky_Position.x, 120, 500);
        text("Pinky Position.Y:",200,500);   text(Pinky_Position.y, 320, 500);
        text("Pinky Position.Z:",400,500);   text(Pinky_Position.z, 520, 500);
        output7.println(Pinky_Position.x + "," + Pinky_Position.y + "," + Pinky_Position.z);
      }
      
      if(hand.isRight())  //Just find the right hand
      {
        background(255);
        if(a==1)
        {
          fill(255,0,0);
          ellipse(250,670,30,30);
        }
        if(a==0)
        {
          fill(0,255,0);
          ellipse(250,670,30,30);
        }
        
        Window_Display();
        textSize(0.1);
        strokeWeight(10);
        hand.draw(); 
        textFont(font, 50);
        fill(0);
        text("Right Hand",500,200);
        
        translate(360,60);
        textFont(font, 14);
        fill(0);
        //Display Hand Position//
        text("Hand Position.X:",0,200);      text(Hand_Position.x, 120, 200);
        text("Hand Position.Y:",200,200);    text(Hand_Position.y, 320, 200);
        text("Hand Position.Z:",400,200);    text(Hand_Position.z, 520, 200);
        output1.println(Hand_Position.x + ","+ Hand_Position.y + "," + Hand_Position.z);
        
        //Display Hand Direction//  
        text("Hand Direction.X:",0,290);     text(Hand_Direction.x, 120, 290);
        text("Hand Direction.Y:",200,290);   text(Hand_Direction.y, 320, 290);
        text("Hand Direction.Z:",400,290);   text(Hand_Direction.z, 520, 290); 
        output2.println(Hand_Direction.x + "," + Hand_Direction.y + "," + Hand_Direction.z);
        
        //Display Thumb Position//  
        text("Thumb Position.X:",0,380);     text(Thumb_Position.x, 120, 380);
        text("Thumb Position.Y:",200,380);   text(Thumb_Position.y, 320, 380);
        text("Thumb Position.Z:",400,380);   text(Thumb_Position.z, 520, 380);
        output3.println(Thumb_Position.x + "," + Thumb_Position.y + "," + Thumb_Position.z);
        
        //Display Index Position//  
        text("Index Position.X:",0,410);     text(Index_Position.x, 120, 410);
        text("Index Position.Y:",200,410);   text(Index_Position.y, 320, 410);
        text("Index Position.Z:",400,410);   text(Index_Position.z, 520, 410);
        output4.println(Index_Position.x + "," + Index_Position.y + "," + Index_Position.z);
        
        //Display Middle Position//  
        text("Middle Position.X:",0,440);     text(Middle_Position.x, 120, 440);
        text("Middle Position.Y:",200,440);   text(Middle_Position.y, 320, 440);
        text("Middle Position.Z:",400,440);   text(Middle_Position.z, 520, 440);
        output5.println(Middle_Position.x + "," + Middle_Position.y + "," + Middle_Position.z);
        
        //Display Ring Position//  
        text("Ring Position.X:",0,470);     text(Ring_Position.x, 120, 470);
        text("Ring Position.Y:",200,470);   text(Ring_Position.y, 320, 470);
        text("Ring Position.Z:",400,470);   text(Ring_Position.z, 520, 470);
        output6.println(Ring_Position.x + "," + Ring_Position.y + "," + Ring_Position.z);
        
        //Display Pinky Position//  
        text("Pinky Position.X:",0,500);     text(Pinky_Position.x, 120, 500);
        text("Pinky Position.Y:",200,500);   text(Pinky_Position.y, 320, 500);
        text("Pinky Position.Z:",400,500);   text(Pinky_Position.z, 520, 500);
        output7.println(Pinky_Position.x + "," + Pinky_Position.y + "," + Pinky_Position.z);
      }
    }
      
  }
  if(a==1)
  {
    fill(255,0,0);
    ellipse(250,670,30,30);
  }
  if(a==0)
  {
    fill(255);
    ellipse(250,670,30,30);
  }
}

void Window_Display()
{
  strokeWeight(6);
  textFont(font,70);
  fill(0);
  text("Leap Motion Data Editor",280,100);
  noFill();
  rect(200,130,900,480);
  fill(255);
  rect(370,640,150,65);
  rect(570,640,150,65);
  rect(770,640,150,65);
  textFont(font,45);
  fill(0);
  text("Start",397,685);
  text("Reset",596,685);
  text("Stop",802,685);
  textFont(font,25);
  fill(0);
  text("Recording :",100,680);
}

void mouseClicked()
{
  if((mouseX>370)&&(mouseX<370+150)&&(mouseY>640)&&(mouseY<640+65))    //start
  {
    output1 = createWriter("Hand_Position.txt");
    output2 = createWriter("Hand_Direction.txt");
    output3 = createWriter("Thumb_Position.txt");
    output4 = createWriter("Index_Position.txt");
    output5 = createWriter("Middle_Position.txt");
    output6 = createWriter("Ring_Position.txt");
    output7 = createWriter("Pinky_Position.txt");
    output1.flush();
    output2.flush();
    output3.flush();
    output4.flush();
    output5.flush();
    output6.flush();
    output7.flush();
    a = 1;
  }
  
  if((mouseX>770)&&(mouseX<770+150)&&(mouseY>640)&&(mouseY<640+65))   //stop
  {
    output1.close();
    output2.close();
    output3.close();
    output4.close();
    output5.close();
    output6.close();
    output7.close();
    a = 0;
  }
  
  if((mouseX>570)&&(mouseX<570+150)&&(mouseY>640)&&(mouseY<640+65))   //reset
  {
    output1 = createWriter("Hand_Position.txt");
    output2 = createWriter("Hand_Direction.txt");
    output3 = createWriter("Thumb_Position.txt");
    output4 = createWriter("Index_Position.txt");
    output5 = createWriter("Middle_Position.txt");
    output6 = createWriter("Ring_Position.txt");
    output7 = createWriter("Pinky_Position.txt");
    a = 0;
  }
}
