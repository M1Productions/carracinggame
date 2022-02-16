class Car {
  private int w, h, maxVelocity, checkpointIndex;
  private float angle, acceleration;
  private color mainColor;
  private PVector velocity, position, direction;

  Car(int x, int y, int w, int h, color mainColor) {
    this.position = new PVector(x, y);
    this.w = w;
    this.h = h;
    this.acceleration = 1.5;
    this.velocity = new PVector(0, 0);
    this.direction = new PVector(1, 0);
    this.mainColor = mainColor;
    this.maxVelocity = 20;
    this.checkpointIndex = 0;
  }

  public void draw() {
    this.angle = this.direction.heading();
    translate(this.position.x, this.position.y);
    rotate(this.angle);
    strokeWeight(0);
    fill(this.mainColor);
    rect(-this.w/2, -this.h/2, this.w, this.h);
    fill(#00FFFF);
    rect(this.w/6, -this.h/2, this.w/3, this.h);
    rotate(-this.angle);
    translate(-this.position.x, -this.position.y);

    this.updatePosition();
  }

  private void updatePosition() {
    this.position.add(this.velocity); // driving forwards
    // if the car is out of screen
    if(this.position.x > width || this.position.x < 0 || this.position.y > height || this.position.y < 0) {
      this.position.sub(this.velocity);
      // todo : rotate to middle of screen
    }

    if(this.velocity.mag()>0.01) {
      this.velocity.mult(0.85); // dragg / friction to ground slows vehicle down
    }
    else {
      this.velocity = new PVector(0, 0);
    }
  }

  public void rotateMe(float byAngle) {
    float multiplyer = (this.velocity.mag()/this.maxVelocity); // todo : rotate faster when slower, not as fast as when driving though
    this.direction.rotate(byAngle*multiplyer);
    this.velocity.rotate(byAngle*multiplyer);
  }

  public void drive(int direct) { // direct is either 1 or -1 (forwards/backwards) // todo : rewrite
    if(this.velocity.mag() > 0.1 || this.velocity.mag() < -0.1) {
      this.velocity.x += (this.velocity.x*this.acceleration*direct);
      this.velocity.y += (this.velocity.y*this.acceleration*direct);
      this.velocity.limit(this.maxVelocity); // max velocity
    }
    else {
      this.velocity.x = this.direction.x;
      this.velocity.y = this.direction.y;
      this.velocity.mult(0.5*direct);
    }
  }

  public int getCheckpointindex() {
    return this.checkpointIndex;
  }
}
