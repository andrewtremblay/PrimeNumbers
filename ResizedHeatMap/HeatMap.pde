int[] primes;
PFont body;
void setup() {
  size(400, 800);
  noLoop(); //no need to redraw as the values don't change 
  body = loadFont("TheSans-Plain-12.vlw");
  textFont(body);
  String[] lines = loadStrings("FIRST_1000_PRIMES.tsv");
  String[] values = split(lines[0], TAB);
  primes = new int[values.length];
  for (int i = 0; i < values.length; i++) {
    primes[i] = Integer.parseInt(values[i]); // Parse data into integer array
  }
}

void draw() {
  background(0);

  fill(255);
  text("First 1000 Prime Numbers", 20, 20);
//  drawPixelSizeBox(200, 80);
  drawCustomSizeBox(100, 100, 3);
}



void drawCustomSizeBox(int heightOfBox, int widthOfBox, int lengthOfSide){
  strokeWeight(0);
  int widthOffset = (width - widthOfBox*lengthOfSide)/2;
  int heightOffset = (height - heightOfBox*lengthOfSide)/2;
 
  
  int primeIndex = 0;
    for (int j = 0; j < heightOfBox; j++) {
      for (int i = 0; i < widthOfBox; i++) {
        fill(0);
      if(primeIndex < primes.length && (j*widthOfBox + i) == primes[primeIndex]){
        primeIndex++;
        fill(255);
      }
      rect(i*lengthOfSide+widthOffset, j*lengthOfSide+heightOffset, lengthOfSide, lengthOfSide);
    }
  }
}

void drawPixelSizeBox(int heightOfBox, int widthOfBox){
  int widthOffset = (width - widthOfBox)/2;
  int heightOffset = (height - heightOfBox)/2;
  
  int primeIndex = 0;
    for (int j = 0; j < heightOfBox; j++) {
      for (int i = 0; i < widthOfBox; i++) {
      color c = color(0);
      if(primeIndex < primes.length && (j*widthOfBox + i) == primes[primeIndex]){
        c = color(255);
        primeIndex++;
      }
      set(i+widthOffset, j+heightOffset, c);
    }
  }
}

void drawPixelSizeBoxWithBorder(int heightOfBox, int widthOfBox, int borderWidth){
  int offsetY = (height - heightOfBox)/2-borderWidth;
  int offsetX = (width - widthOfBox)/2-borderWidth;
  fill(155);
  rect(offsetX, offsetY, widthOfBox+2*borderWidth-1, heightOfBox+2*borderWidth-1);  
  drawPixelSizeBox(heightOfBox, widthOfBox);

}




