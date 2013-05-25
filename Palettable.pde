int rootH = 50;
int rootS = 65;
int rootV = 65;
color root;
color temp = root;

int rootX = 10;
int rootY = 10;

int swatchesS = 2;
int swatchesV = 2;
int varianceS = 20;
int varianceV = 20;
int swatchWidth = 50;
int swatchGap = swatchWidth/10;

boolean isOverRoot = false;

int curve = 15;
  
void setup()
{
  size(800, 600);
  colorMode(HSB, 360, 100, 100);
  frameRate(30);
  root = color(rootH, rootS, rootV);
  //Menu background
  fill(25);
  rect(0, 0, width/3, height);
  //Palette background
  fill(0);
  //Why do I have to subtract an extra 1 here?
  rect(width - 1 - 2*(width/3), 0, 2*width/3, height);
  
  
  
  
}

void draw() {
  update(mouseX, mouseY);
  fill(root);
  
  if(isOverRoot) {
    strokeWeight(2);
    stroke(255);
    rectMode(CORNER);
    fill(root);
    rect(rootX, rootY, swatchWidth, swatchWidth, curve);
  } else {
    strokeWeight(2);
    stroke(0);
    rectMode(CORNER);
    fill(root);
    rect(rootX, rootY, swatchWidth, swatchWidth, curve);
  }
}

void update(int x, int y) {
  //Root check
  if (overSwatch(rootX, rootY, swatchWidth) ) {
    isOverRoot = true;
  } else {
    isOverRoot = false;
  }
}

boolean overSwatch(int x, int y, int h) {  
  if (mouseX >= x && mouseX <= x+h && 
      mouseY >= y && mouseY <= y+h) {
    return true;
  } else {
    return false;
  }
}

void mousePressed() {
  if (isOverRoot) {
    rectMode(CENTER);
    
    fill(root);
    rect(2*width/3, height/2, swatchWidth, swatchWidth, curve);
    
    for(int i = 1; i <= swatchesS; i++) {
       fill(color(rootH, rootS + (i * varianceS), rootV));
       rect(2*width/3 + (i * (swatchWidth + swatchGap)), height/2, swatchWidth, swatchWidth, curve);
       fill(color(rootH, rootS - (i * varianceS), rootV));
       rect(2*width/3 - (i * (swatchWidth + swatchGap)), height/2, swatchWidth, swatchWidth, curve);
    }
    for(int i = 1; i <= swatchesV; i++) {
      fill(color(rootH, rootS, rootV + (i * varianceV)));
      rect(2*width/3, height/2 - (i * (swatchWidth + swatchGap)), swatchWidth, swatchWidth, curve);
      fill(color(rootH, rootS, rootV - (i * varianceV)));
      rect(2*width/3, height/2 + (i * (swatchWidth + swatchGap)), swatchWidth, swatchWidth, curve);
    } 
  }
}
