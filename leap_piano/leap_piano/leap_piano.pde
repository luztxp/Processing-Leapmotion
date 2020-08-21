import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

import de.voidplus.leapmotion.*;


PVector Thumb_direction = null;
PVector Index_direction = null;
PVector Middle_direction = null;
PVector Ring_direction = null;
PVector Pink_direction = null;

int flag_0 = 0;
int flag_1 = 0;
int flag_2 = 0;
int flag_3 = 0;
int flag_4 = 0;
int flag_5 = 0;
int flag_6 = 0;

LeapMotion leap;
Minim minim;   //apply for the object

AudioPlayer player0;
AudioPlayer player1;
AudioPlayer player2;
AudioPlayer player3;
AudioPlayer player4;
AudioPlayer player5;
AudioPlayer player6;

PVector hand_position=null, Thumb=null, Index=null, Middle=null, Ring=null, Pink=null;  
int hands_num = 0;



void setup()
{
  size(1280,720);
  smooth();
  background(255);
  strokeWeight(10);
  
  minim = new Minim(this);  //initialize the object
  player0 = minim.loadFile("1 do.mp3");
  player1 = minim.loadFile("2 re.mp3");
  player2 = minim.loadFile("3 mi.mp3");
  player3 = minim.loadFile("4 fa.mp3");
  player4 = minim.loadFile("5 sol.mp3");
  player5 = minim.loadFile("6 la.mp3");
  player6 = minim.loadFile("7 si.mp3");
  
  leap = new LeapMotion(this);
  
  
}


void draw()
{
  PImage img;
  img = loadImage("put_hands.jpg");
  image(img,0,0);
 
 
  for(Hand hand:leap.getHands())
  {
    
    
    //hand.draw();
   
    
    hand_position = hand.getPosition();  
    Thumb = hand.getThumb().getPosition();
    Index  = hand.getIndexFinger().getPosition();
    Middle = hand.getMiddleFinger().getPosition();
    Ring  = hand.getRingFinger().getPosition();
    Pink  = hand.getPinkyFinger().getPosition();
    
    Index_direction = hand.getIndexFinger().getDirection();
    Thumb_direction = hand.getThumb().getDirection();
    Middle_direction = hand.getMiddleFinger().getDirection();
    Ring_direction = hand.getRingFinger().getDirection();
    Pink_direction = hand.getPinkyFinger().getDirection();
    
    //println(Thumb.y+" "+Index.y+" "+Middle.y+" "+Ring.y+" "+Pink.y);
    
    //println(Thumb_direction.x);    //print testing data

    hands_num = leap.countHands();  //count the hands

   if(hands_num == 2)    //If there are two hands,start the piano.
   {  
    hand.draw(); 
    if(hand.isRight())
    {
///////////////Thumb////////////// 
      if(Thumb_direction.x > -0.3)
        flag_0 += 1;
        
      if(flag_0 == 1)
      {
        
        player0.play();
        player0.rewind();
        
      }
      if(Thumb_direction.x < -0.3)
        flag_0 = 0; 
   
/////////////////Index///////////////  
      if(Index_direction.y > 0.75)
        flag_1 += 1;
      if(flag_1 == 1)
      {
        player1.play();
        player1.rewind();
      }
  
      if(Index_direction.y < 0.75)
        flag_1 = 0;
  
   
///////////////Middle/////////////
      if(Middle_direction.y > 0.55)
        flag_2 += 1;
      if(flag_2 == 1)
      {
        player2.play();
        player2.rewind();
      }
      if(Middle_direction.y < 0.55)
        flag_2 = 0;
   
///////////////Ring//////////////
      if(Ring_direction.y > 0.6)
        flag_3 += 1;
      if(flag_3 == 1)
      {
        player3.play();
        player3.rewind();
      }
      if(Ring_direction.y < 0.6)
        flag_3 = 0;
   
///////////////Pinky////////////// 
      if(Pink_direction.y > 0.55)
        flag_4 += 1;
      if(flag_4 == 1)
      {
        player4.play();
        player4.rewind();
      }
      if(Pink_direction.y < 0.55)
        flag_4 = 0;   
 }   
   
 if(hand.isLeft())
 {
  /////////////////Index/////////////// 
      if(Index_direction.y > 0.5)
        flag_5 += 1;
      if(flag_5 == 1)
      {
        player5.play();
        player5.rewind();
      }
  
      if(Index_direction.y < 0.5)
        flag_5 = 0;
  
   
///////////////Middle/////////////
      if(Middle_direction.y > 0.45)
        flag_6 += 1;
      if(flag_6 == 1)
      {
        player6.play();
        player6.rewind();
      }
      if(Middle_direction.y < 0.45)
        flag_6 = 0;
  }
   
 }   
 
  }
}