int[] primes;
PFont body;
void setup() {
  size(200, 200);
  fill(255);
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
  text("First 1000 Prime Numbers", 20, 20);
  int primeIndex = 0;
    for (int j = 0; j < 100; j++) {
      for (int i = 0; i < 80; i++) {
      color c = color(0);
      if(primeIndex < primes.length && (j*80 + i) == primes[primeIndex]){
        c = color(255);
        primeIndex++;
      }
      set(i+60, j+35, c);
    }
  }

  if(primeIndex >= primes.length)
  {
    primeIndex--;
    println("Ran out of stored primes.");
  }
  text("Last Prime Used: " + primes[primeIndex],  20, 180);
}

