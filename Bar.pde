
import java.util.*;
int no = 0;

class CreateBars {

  int comparisons = 0;
  ArrayList<Bar> bars = new ArrayList<Bar>();
  long initalTime = 0;
  int speed = 0;
  SortingAlgorithms SortingAlogrithm;

  public class Bar {
    int x = 0;
    int y = 0;
    int barWidth = 0;
    int barHeight = 0;
    int n = 0;
    boolean showText = false;
    boolean isCompared = false;
    boolean isSorted = false;
    long initalTime = 0;
    long finalTime = 0;

    // <--Constructor-->

    public Bar(int x, int y, int barWidth, int barHeight) {
      this.x = x;
      this.y = 0;
      this.barWidth = barWidth;
      this.barHeight = barHeight;
      no++;
      this.n = no;
    };


    public void DrawBar() {
      if (this.isCompared == true) {
        fill(195, 0, 255);
        this.isCompared = false;
      } else if (this.isSorted) {
        fill(0, 255, 247);

        
      } else {
        fill(255, 59, 98);
      }


      rect(this.x, height - this.barHeight, this.barWidth, this.barHeight);
      if (this.showText) {
        fill(255, 255, 255);
        textSize(15);
        text(this.n, this.x, this.barHeight+20);
      }
    }
    public void ShowText() {
      this.showText = true;
    }
  }



  // <--Constructor-->

  public CreateBars(int rectWidth, int numbers) {
    int gap = width  / numbers - rectWidth ;
    this.initalTime = System.currentTimeMillis();

    for (int i = 0; i < numbers; i++) {
      int barHeight = int(random(2, height));
      int gapx = i * gap;
      int widthx = i * rectWidth;
      Bar obj = new Bar(gapx + widthx, 0, rectWidth, barHeight);
      bars.add(obj);
    };
    this.SortingAlogrithm = new SortingAlgorithms(bars);
  }





  public void ShowComparisons() {
    String str = "Comparisons: %,d";
    fill(255, 255, 255);
    text(String.format(str, this.SortingAlogrithm.comparisons), 10, 30);
  }

  public void updateSortingSpeed(int speed) {
    this.speed = speed;
  }

  public void displaySortringTime() {
    int time = (int)(System.currentTimeMillis() - this.initalTime);
    String str = "Time: %,d ms ";
    String timeFormated = String.format(str, time);
    fill(255, 255, 255);

    text(timeFormated, 10, 60);
  }
  public void playSound() {
    this.SortingAlogrithm.playSound = true;
  }

  public void Sort(String algorithm) {
    
     
    for (int i =0; i < this.speed; i++) {
      
      if (algorithm.toUpperCase().equals("BUBBLESORT")) {
        
        this.SortingAlogrithm.bubbleSortTest();
        
        
      } 
      
      
      else if (algorithm.toUpperCase().equals("INSERTATIONSORT")) {
        this.SortingAlogrithm.insertationSort();
      }else if(algorithm.toUpperCase().equals("MERGESORT")){
        this.SortingAlogrithm.mergeSort();
      }
    }
    
    
  }
}
