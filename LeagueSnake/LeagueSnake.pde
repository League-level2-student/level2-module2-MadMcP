//*
// ***** SEGMENT CLASS *****
// This class will be used to represent each part of the moving snake.
//*

class Segment {

  //Add x and y member variables. They will hold the corner location of each segment of the snake.
  int x;
  int y;

  // Add a constructor with parameters to initialize each variable.
  Segment(int x, int y){
    this.x = x;
    this.y = y;
  }
  
}


//*
// ***** GAME VARIABLES *****
// All the game variables that will be shared by the game methods are here
//*

Segment head;
int foodX;
int foodY;
int direction = UP;
int foodEaten = 0;
Segment[] tail = new Segment[0];

//*
// ***** SETUP METHODS *****
// These methods are called at the start of the game.
//*

void setup() {
  size(500, 500);
  head = new Segment(50, 50);
  frameRate(2.0);
  dropFood();
}

void dropFood() {
  //Set the food in a new random location
  foodX = ((int)random(50)*10);
  foodY = ((int)random(50)*10);
}



//*
// ***** DRAW METHODS *****
// These methods are used to draw the snake and its food 
//*

void draw() {
  background(0, 0, 0);
  drawFood();
  move();
  drawSnake();
  checkBoundaries();
  eat();
}

void drawFood() {
  //Draw the food
  fill(28, 247, 15);
  rect(foodX, foodY, 10, 10);
}

void drawSnake() {
  //Draw the head of the snake followed by its tail
  fill(245, 17, 17);
  rect(head.x, head.y, 10, 10);
  manageTail();
}


//*
// ***** TAIL MANAGEMENT METHODS *****
// These methods make sure the tail is the correct length.
//*

void drawTail() {
  //Draw each segment of the tail
  for(int i = 0; i < 0; i++){
    rect(, , 10, 10); 
  }
}

void manageTail() {
  //After drawing the tail, add a new segment at the "start" of the tail and remove the one at the "end" 
  //This produces the illusion of the snake tail moving.
  checkTailCollision();
  drawTail();
  
}

void checkTailCollision() {
  //If the snake crosses its own tail, shrink the tail back to one segment
  for(int j = 0; j < tail.length; j++){
     if(head.x == tail[j].x && head.y == tail[j].y){
        foodEaten = 0;
        tail = new Segment[0];
     }
  }
}



//*
// ***** CONTROL METHODS *****
// These methods are used to change what is happening to the snake
//*

void keyPressed() {
  //Set the direction of the snake according to the arrow keys pressed
  if(key == CODED){
    if(direction != DOWN && keyCode == UP){
      direction = UP;
    }
    else if(direction != UP && keyCode == DOWN){
      direction = DOWN;
    }
    else if(direction != LEFT && keyCode == RIGHT){
      direction = RIGHT;
    }
    else if(direction != RIGHT && keyCode == LEFT){
      direction = LEFT;
    }
  }
}

void move() {
  //Change the location of the Snake head based on the direction it is moving.
  
  
  switch(direction) {
   case UP:
   // move head up here 
   head.y = head.y - 10;
   break;
   case DOWN:
   // move head down here 
   head.y = head.y + 10;
   break;
   case LEFT:
   // figure it out
   head.x = head.x - 10;
   break;
   case RIGHT:
   // mystery code goes here 
   head.x = head.x + 10;
   break;
   }
   
}

void checkBoundaries() {
  //If the snake leaves the frame, make it reappear on the other side
  if(head.y < 0){
    head.y = 500;
  }
  if(head.y > 500){
    head.y = 0;
  }
  if(head.x < 0){
    head.x = 500;
  }
  if(head.x > 500){
    head.x = 0;
  }
}



void eat() {
  //When the snake eats the food, its tail should grow and more food appear
  if(head.x == foodX && head.y == foodY){
    foodEaten = foodEaten + 1;
    foodX = ((int)random(50)*10);
    foodY = ((int)random(50)*10);

  }
}
