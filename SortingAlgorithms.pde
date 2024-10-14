import java.util.*;
import java.util.concurrent. *;
class SortingAlgorithms {
  int i = 0;
  int j = 0;
  boolean swapped = true;
  int speed = 1;
  int comparisons = 0;
  ArrayList<CreateBars.Bar> bars;
  boolean playSound = false;
  int size = 0;


  public SortingAlgorithms(ArrayList<CreateBars.Bar> bars) {
    this.bars = bars;
    this.size = bars.size();
  }
  public void playSound() {
    if (this.playSound) {

      file.rate(1+ (float)this.j/this.size *3);
      file.play();
    }
  }



  private void swap(CreateBars.Bar bar1, CreateBars.Bar bar2) {
    int temp = bar1.barHeight;
    bar1.barHeight = bar2.barHeight;
    bar2.barHeight = temp;
    bar1.isCompared = true;
    bar2.isCompared = true;


    this.comparisons++;
    try {

      Thread.sleep(1);
    }
    catch(InterruptedException e) {
    }
  }


  public void bubbleSortTest() {
    CompletableFuture.runAsync(() -> {



      boolean swapped;
      for (int i = 0; i < this.size - 1; i++) {

        swapped = false;
        for (int j = 0; j < this.size - i - 1; j++) {
          final int k = j;
          if (this.bars.get(j).barHeight > this.bars.get(j + 1).barHeight) {

            this.swap(this.bars.get(k), this.bars.get(k+1));
            this.j = j;
            this.playSound();

            swapped = true;
          }
        }

        if (swapped == false)
        break;
        this.bars.get(this.size - i- 1).isSorted = true;
      }
    }
    );
  }



  public void bubbleSort() {

    if (this.i < this.size-1 && this.swapped == true) {

      if (this.j >= this.size - this.i-1) {
        this.j =0;
        this.i++;
      }
      this.swapped = false;

      CreateBars.Bar bar1 = bars.get(this.j);
      CreateBars.Bar bar2 = bars.get(this.j+1);

      if (bar1.barHeight > bar2.barHeight) {
        this.playSound();
        int temp = bar1.barHeight;
        bar1.barHeight = bar2.barHeight;
        bar2.barHeight = temp;

        bar1.isCompared = true;
        bar2.isCompared = true;


        this.swapped = true;
        this.comparisons++;
      }

      this.j++;

      if (this.swapped == false) {
        this.swapped = true;
      }
      bars.get(this.size-this.i-1).isSorted = true;
    } else {
      noLoop();
    }
  }




  int tempHeight = 0;



  public void insertationSort() {

    int i = this.i+1;
    if (i <  this.size) {
      int j =  i - this.j - 1;
      if (this.j == 0) {
        this.tempHeight = this.bars.get(i).barHeight;
      }

      boolean swap = false;

      if ( j >= 0 && tempHeight < this.bars.get(j).barHeight) {
        this.playSound();

        CreateBars.Bar bar1 = this.bars.get(j+1);
        bar1.barHeight = this.bars.get(j).barHeight;

        swap = true;
        bar1.isCompared = true;
        bar1.isSorted = true;
        this.comparisons++;
        this.j++;
      }

      if (swap == false) {

        CreateBars.Bar bar1 = this.bars.get(j+1);
        bar1.barHeight = this.tempHeight;
        bar1.isCompared = true;
        this.comparisons++;
        this.j = 0;
        this.i++;
      }
    } else {
      noLoop();
    }
  }

  private void merge(int l, int m, int r) {


    int i = l;
    int j = m + 1;
    int tempArr[] = new int[r - l + 1];
    int k = 0;

    while (i <= m && j <= r) {
      CreateBars.Bar bar1 = bars.get(i);
      CreateBars.Bar bar2 = bars.get(j);
      if (bar1.barHeight < bar2.barHeight) {
        tempArr[k] = bar1.barHeight;
        i++;
      } else {
        tempArr[k] = bar2.barHeight;
        j++;
      }
      k++;
    }

    while (i <= m) {
      tempArr[k] = bars.get(i).barHeight;
      i++;
      k++;
    }
    while (j <= r) {
      tempArr[k] = bars.get(j).barHeight;
      j++;
      k++;
    }
    i = l;

    for (int a : tempArr) {

      this.bars.get(i).barHeight = a;
      this.j = l;
      this.playSound();
      this.bars.get(i).isCompared = true;
      this.bars.get(i).isSorted = true;
      this.comparisons++;
      i++;

      try {

        Thread.sleep(8);
      }
      catch(InterruptedException e) {
      }
    }
  }


  private void mergeSortR(int l, int r) {

    if (l < r) {
      int m = (l + r) / 2;
      mergeSortR(l, m);
      mergeSortR(m + 1, r);
      merge(l, m, r);
    }
  }
  public void mergeSort() {
    CompletableFuture.runAsync(() -> {
      mergeSortR(0, this.size-1);
    }
    );
  }
}
