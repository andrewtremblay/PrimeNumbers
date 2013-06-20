int[] primes;
PFont body;
void setup() {
  size(800, 800);
  strokeWeight(1);
// noLoop(); //no need to redraw as the values don't change 
  body = loadFont("TheSans-Plain-12.vlw");
  textFont(body);
  String[] lines = loadStrings("TOO_MANY_PRIMES.tsv");//"FIRST_1000_PRIMES.tsv");
  String[] values = split(lines[0], TAB);
  primes = new int[values.length];
  for (int i = 0; i < values.length; i++) {
    primes[i] = Integer.parseInt(values[i]); // Parse data into integer array
  }
}

void draw() {
  background(0);

  fill(255);
  text("Data Set: All Prime Numbers under Ten Million", 20, 20);
  
  int heightOfBox = 700;
  int widthOfBox = 750;
  
  int primeIndexReached = drawPixelSizeBox(heightOfBox, widthOfBox);
  
  int widthOffset = (width - widthOfBox)/2;
  int heightOffset = (height - heightOfBox)/2;

int mouseAdjX = mouseX - 3;//where the mouse thinks the pixel is is wrong
int mouseAdjY = mouseY - 4; 
  
  int xSelectClamp = constrain(mouseAdjX, widthOffset -1, widthOffset+widthOfBox-2);
  int ySelectClamp = constrain(mouseAdjY, heightOffset-1, heightOffset+heightOfBox-2) ;

  stroke(#FFCC00);
  noFill();
  rect(xSelectClamp, ySelectClamp, 2, 2);

  color pixelColor = get(xSelectClamp+1, ySelectClamp+1);
//  fill(pixelColor);
//  noStroke();
//  rect(25, 25, 50, 50);

  String primeTest = "not a prime";
  if(pixelColor == color(255)){
    primeTest = "a prime";
  }
  
  int xReadClamp = constrain(mouseAdjX - widthOffset, 0, widthOfBox);
  int yReadClamp = constrain(mouseAdjY - heightOffset, 0, heightOfBox);

  fill(255);
  text(((xReadClamp+yReadClamp*widthOfBox+1)+"\n" + primeTest), 400, 20);
//"(X:"+xReadClamp+" Y:"+yReadClamp+")"+
}


int drawCustomSizeBox(int heightOfBox, int widthOfBox, int lengthOfSide){
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
   if(primeIndex >= primes.length)
   {
     primeIndex--;
   }
   return primeIndex;
}

int drawPixelSizeBox(int heightOfBox, int widthOfBox){
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

  if(primeIndex >= primes.length)
  {
     primeIndex--;
  }
  return primeIndex;
}

int drawPixelSizeBoxWithBorder(int heightOfBox, int widthOfBox, int borderWidth){
  int offsetY = (height - heightOfBox)/2-borderWidth;
  int offsetX = (width - widthOfBox)/2-borderWidth;
  fill(155);
  rect(offsetX, offsetY, widthOfBox+2*borderWidth-1, heightOfBox+2*borderWidth-1);  
  return drawPixelSizeBox(heightOfBox, widthOfBox);

}




