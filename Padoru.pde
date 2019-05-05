import processing.sound.*;

import java.awt.MouseInfo;
import java.awt.Point;

SoundFile snd;
PImage img;
Animation ani;
boolean up;
boolean right;
int speed = 3;

Point mouse;
int x = (int)random(0, 1820);
int y = (int)random(0, 980);

void setup() {
  size(150, 150, P2D);
  surface.setResizable(false);
  surface.setLocation(x, y);
  ani = new Animation("gif", 4, 4);
  snd = new SoundFile(this, "padoru-padoru.mp3");
  snd.loop();
}

int mode = 1;
void draw() {
  background(0);
  ani.display(0, 0);
  mode1();
}

void mode1() {
  mouse = MouseInfo.getPointerInfo().getLocation();
  //println( "X=" + mouse.x + " Y=" + mouse.y );
  //println( "x: " + x + "   y:" + y );
  if (mouse.x > x && mouse.x <= x+width && mouse.y >= y && mouse.y <= y+height+25) {
    x = (int)random(0, 1820);
    y = (int)random(0, 980);
    int a = (int)random(0, 1000);
    if (a%2 == 0)
      up = true;
    else
      up = false;
    int b = (int)random(0, 1000);
    if (b%2 == 0)
      right = true;
    else
      right = false;
    surface.setLocation(x, y);
  }
  if (right)
    x+=speed;
  else
    x-=speed;

  if (up)
    y-=speed;
  else
    y+=speed;

  if (x <= 0)
    right = true;

  if (x >= 1920-width)
    right = false;

  if (y <= 0)
    up = false;

  if (y >= 1080-height-25)
    up = true;

  //println( "x: " + x + "   y:" + y );
  surface.setLocation(x, y);
}
