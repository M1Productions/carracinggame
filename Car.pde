class Car {
  int w, h;
  float angle, acceleration;
  color mainColor;
  PVector velocity, position, direction;

  Car(int x, int y, int w, int h, color mainColor) {
    this.position = new PVector(x, y);
    this.w = w;
    this.h = h;
    this.acceleration = 1.5;
    this.velocity = new PVector(0, 0);
    this.direction = new PVector(1, 0);
    this.velocity.limit(3); // max velocity
    this.mainColor = mainColor;
  }

  public void draw() {
    //this.angle = angleBetween(xAxis, this.direction);
    this.angle = this.direction.heading();
    translate(this.position.x, this.position.y);
    rotate(this.angle);
    strokeWeight(0);
    fill(this.mainColor);
    rect(-this.w/2, -this.h/2, this.w, this.h);
    rotate(-this.angle);
    translate(-this.position.x, -this.position.y);

    this.position.add(this.velocity);
    this.velocity.mult(0.85);
  }

  public void rotateMe(float byAngle) {
    this.direction.rotate(byAngle);
    this.velocity.rotate(byAngle);
  }

  public void drive(int direction) {
    if(this.velocity.mag() > 0.01) {
      this.velocity.mult(this.acceleration*direction);
    }
    else {
      this.velocity = this.direction;
      this.velocity.mult(0.5);
    }
  }
}
