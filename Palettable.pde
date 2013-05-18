int rootH = 255;
int rootS = 65;
int rootB = 65;
color root;
color temp = root;

int rootX = 10;
int rootY = 10;
int rootW = 50;
boolean isOverRoot = false;

int curve = 15;
  
void setup()
{
  size(800, 600);
  colorMode(HSB, 360, 100, 100);
  frameRate(30);
  root = color(rootH, rootS, rootB);
  //Menu background
  fill(25);
  rect(0, 0, width/3, height);
  //Palette background
  fill(0);
  //Why do I have to subtract an extra 1 here?
  rect(width - 1 - 2*(width/3), 0, 2*width/3, height);
  
  
  
  
}

void draw() {
  colorMode(HSB, 360, 100, 100);
  update(mouseX, mouseY);
  fill(root);
  
  if(isOverRoot) {
    stroke(255);
    rectMode(CORNER);
    fill(root);
    rect(rootX, rootY, rootW, rootW, curve);
  } else {
    stroke(0);
    rectMode(CORNER);
    fill(root);
    rect(rootX, rootY, rootW, rootW, curve);
  }
}

void update(int x, int y) {
  //Root check
  if (overSwatch(rootX, rootY, rootW) ) {
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
    rect(2*width/3, height/2, rootW, rootW, curve);
    
    temp = color(rootH, rootS + 10, rootB);
    fill(temp);
    rect(2*width/3 + 55, height/2, rootW, rootW, curve);
    
    temp = color(rootH, rootS + 20, rootB);
    fill(temp);
    rect(2*width/3 + 110, height/2, rootW, rootW, curve);
    
  }
}
