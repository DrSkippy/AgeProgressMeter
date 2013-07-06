
import java.text.*;
import java.util.*;

int boxSize = 5;      // pixel size of month representation
int boxSpacing = 4;   // vertical and horizontal spacing
int decadeSpacing = 2*boxSpacing;  // extra space between decades
int markerOverhang = 18;
int margin = 150;
int w;
// Ages
int age = 0;
int maxYears = 95;
int medianAge = 78;
String yourBirthday = "1966-05-25";
// Colors
int backShade = 65;
int fillShade = 240;
int strokeShade = 240;
int medianAgeShade = #70A070;

public static final int getMonthDiff(Date d1, Date d2) {
  int m1 = d1.getYear() * 12 + d1.getMonth();
  int m2 = d2.getYear() * 12 + d2.getMonth();
  return m2 - m1;
}

public void setup() {
  w = int(2 * margin + maxYears * (boxSize + boxSpacing) - boxSpacing + (maxYears/10. - 1) * decadeSpacing);
  int h = int(2 * margin + 12 * (boxSize + boxSpacing) - boxSpacing); 
  Date bday = new Date();
  try {
    bday = new SimpleDateFormat("yyyy-MM-dd").parse(yourBirthday);
  } 
  catch (ParseException e) {
    println("Whups!");
  }
  Date today = new Date();
  age = getMonthDiff(bday, today);
  //size(w, h);
  size(h, w);
}
  
public void draw() {    
  background(backShade);
  int jump = 0;
  for (int i = 0; i < maxYears; i++) {
    if (i%10 == 0) {
      jump += decadeSpacing;
    }
    int x = jump + margin + i * (boxSize + boxSpacing);
    if (i == medianAge) {
       stroke(medianAgeShade);
       // line(x - boxSpacing/2, margin - markerOverhang, x - boxSpacing/2, margin + 12 * (boxSize + boxSpacing) - boxSpacing + markerOverhang);
       line(margin - markerOverhang, w - x - boxSpacing/2,  margin + 12 * (boxSize + boxSpacing) - boxSpacing + markerOverhang, w - x - boxSpacing/2);
    }  
    for (int j = 0; j < 12; j ++ ) {
      int y = margin + j * (boxSize + boxSpacing);
      if (i*12 + j < age) {
        stroke(fillShade);
        fill(fillShade);
      } else {
        stroke(fillShade);
        fill(backShade);
      }
      //rect(x, y, boxSize, boxSize);
      rect(y, w-x, boxSize, boxSize);
    }
  }
  save("yourCurrentCalendar.png");
}
