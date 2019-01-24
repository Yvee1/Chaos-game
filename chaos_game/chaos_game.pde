// Vertices of the pentagon
PVector[] vertices;
// Point jumping around the pentagon
PVector rabbit;
// Previously chosen vertex
PVector previous;
// Current vertex
PVector vertex;
// First time going through the loop?
boolean first = true;

PGraphics big;

void setup(){
  big = createGraphics(10000, 10000);
  big.beginDraw();
  vertices = new PVector[5];
  // Start at the center
  rabbit = new PVector(big.width/2, big.height/2);
  // Calculate the vertices of the pentagon
  pentagon(big.width/2, big.height/2, big.height/1.8);
  big.stroke(0,50);
  
  previous = new PVector(0, 0);
  
  big.background(255);
  
}

void draw(){
  // Jump half the distance towards a randomly chosen vertex, but the currently chosen vertex cannot be the same as the previously chosen vertex.
  for(int i=0; i<10000; i++){
    vertex = vertices[int(random(0, 5))].copy();
    if(!first){
      while(vertex.x == previous.x && vertex.y == previous.y){
        vertex = vertices[int(random(0, 5))].copy();
      }
    }
    previous = vertex.copy();
    rabbit = rabbit.add(vertex.sub(rabbit).mult(0.5));
    point(rabbit.x, rabbit.y);
  

    first=false;
    //println(vertex);
  }
}

void pentagon(float x, float y, float r){
  noFill();
  //beginShape();
  for (float a = 0; a < TWO_PI; a += TWO_PI/5){
    float vx = x+r*cos(a-PI/2);
    float vy = y+r*sin(a-PI/2);
    //vertex(vx, vy);
    vertices[parseInt(a/(TWO_PI/5))] = new PVector(vx, vy);
  }
  //endShape(CLOSE);
  
}

// Save tif when mouse is pressed
void mousePressed(){
  big.save("big.tif");
  println("finished");
}
