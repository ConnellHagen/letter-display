float[] barHeights;
color color1;
color color2;

public void setup(){
  size(1280, 720);
  background(40);
  textSize(30);
  textAlign(CENTER, CENTER);
  
  int[] distributions = new int[26];
  
  String[] lines = loadStrings("book.txt");
  String line = join(lines, " ");
  char[] dataCharArray = line.toCharArray();
  
  for(char letter : dataCharArray){
    
    if((int)letter >= 97 && (int)letter <= 122){
      distributions[(int)letter - 97]++;
    }
    
  }
  
  int largest = 0;
  for(int total : distributions){
    if(total > largest){
      largest = total;
    } 
  }
  
  barHeights = new float[26];
  for(int i = 0; i < 26; i++){
    barHeights[i] = ((float)distributions[i] * 100 / largest);
  }
  
  color1 = color(70, 153, 80);
  color2 = color(62, 135, 70);
  
}

public void draw(){
  //a, c, e...
  fill(color1);
  for(int i = 0; i <= 25; i+=2){
    rect((float)1280 * i / 26 , (float)720 *  (100 - barHeights[i]) / 100, (float)1280 / 26, (float)720 * barHeights[i] / 100);
  }
  
  //b, d, f...
  fill(color2);
  for(int i = 1; i <= 25; i+=2){
    rect((float)1280 * i / 26 , (float)720 *  (100 - barHeights[i]) / 100, (float)1280 / 26, (float)720 * barHeights[i] / 100);
  }
  
  //text
  fill(230);
  for(int i = 97; i <= 122; i++){
    text((char)i, (i - 96.5) * (1280.0 / 26), 690);
  }
  
  
}
