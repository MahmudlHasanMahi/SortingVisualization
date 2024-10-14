import java.util.*;
import processing.sound.*;

SoundFile file;

int windowWidth = 1000;
int windowHeight = 600;
int n = 500;
CreateBars bars;

void setup() {
  size(1000, 600);
  file = new SoundFile(this, "sound1.mp3");
  bars = new CreateBars(2, n);
  bars.updateSortingSpeed(2);
  bars.playSound();
  bars.Sort("MERGESORT");
}

void draw() {

  background(0);
  fill(255, 255, 255);
  textSize(25);

  for (int i =0; i < n; i++) {

    bars.bars.get(i).DrawBar();
    bars.ShowComparisons();
    bars.displaySortringTime();
  }
  
}
