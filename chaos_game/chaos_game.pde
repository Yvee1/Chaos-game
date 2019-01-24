PVector[] vertices;
PVector rabbit;
PVector previous;
PVector vertex;
  boolean first = true;

void setup(){
  size(1000, 1000);
  vertices = new PVector[5];
  rabbit = new PVector(width/2, height/2);
  pentagon(width/2, height/2, height/1.8);
  stroke(0,50);
  
  previous = new PVector(0, 0);
  
  smooth();
  background(255);
  
}

void draw(){
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

void mousePressed(){
  save("chaos10.png");
}
