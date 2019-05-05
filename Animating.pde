// Class for animating a sequence of GIFs

class Animation {
  PImage[] images;
  int imageCount;
  int frame;
  int time;

  Animation(String imagePrefix, int count, int t) {
    imageCount = count;
    images = new PImage[imageCount];
    time = t;

    for (int i = 0; i < imageCount; i++) {
      // Use nf() to number format 'i' into four digits
      String filename = imagePrefix + "/" + nf(i, 4) + ".gif";
      images[i] = requestImage(filename);
    }
  }

  void display(float xpos, float ypos) {
    if (frameCount%time==0)
      frame = (frame+1) % imageCount;
    image(images[frame], xpos, ypos, width, height);
  }

  int getWidth() {
    return images[0].width;
  }
}
