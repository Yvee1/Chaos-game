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

void setup(){
  size(1000, 1000);
  vertices = new PVector[5];
  // Start at the center
  rabbit = new PVector(width/2, height/2);
  // Calculate the vertices of the pentagon
  pentagon(width/2, height/2, height/1.8);
  stroke(0,50);
  
  previous = new PVector(0, 0);
  
  smooth();
  background(255);
  
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

// Save png when mouse is pressed
void mousePressed(){
  save("chaos.png");
}
