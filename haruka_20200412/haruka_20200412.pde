int i_atack = 0;
int num = 100;

float rx = mouseX - 5.0;
float ry = mouseY - 5.0;

int[] bx = new int [num];
int[] by = new int [num];
int[] sx = new int [num];
int[] sy = new int [num];
float[] bulletX = new float[num];
float[] bulletY = new float[num];
//float[] bsX = new float[num];
float[] bsY = new float[num];
int hp = num;
int ehp = num;
color c = color(100, 100, 255);

int enemyX;
int enemyY = 10;
//int eSpeadX = 1;
float eSpeadX = 0.01;
//int eSpeadY;

int a;

void setup() {
  size(800, 800);

  bulletX[0] = rx;
  bulletY[0] = ry;
  for (int i = 0; i < num; i++) {
    bx[i] = width/2;
    by[i] = height/2;
    sx[i] = int(random(-100, 100));
    sy[i] = int(random(-100, 100));
  }
  //for (int i = 0; i < num; i++) {
  //  bulletX[i] = width/2;
  //  bulletY[i] = height/2;
  //  //bsX[i] = random(-100, 100);
  //  bsY[i] = random(-100, 0);
  //}
  //sx[0] = int(random(50));
  //sy[0] = int(random(50));
  //sx[1] = int(random(-50));
  //sy[1] = int(random(-50));
  //sx[2] = int(random(50));
  //sy[2] = int(random(50));
  //sx[3] = int(random(-50));
  //sy[3] = int(random(-50));
  //sx[4] = int(random(50));
  //sy[4] = int(random(50));
  //sx[5] = int(random(-50));
  //sy[5] = int(random(-50));
  //sx[6] = int(random(50));
  //sy[6] = int(random(50));
  //sx[7] = int(random(-50));
  //sy[7] = int(random(-50));
}

void draw() {
  a = int(random(200));

  float rx = mouseX - 5.0;
  float ry = mouseY - 5.0;

  background(0);
  noStroke();

  if (a >= 195) {
    for (int i = 0; i < num; i++) {
      bx[i] = enemyX;
      by[i] = enemyY;
      sx[i] = int(random(-25, 25));
      sy[i] = int(random(-25, 25));
    }
  }

  for (int i = 0; i < num; i++) {
    fill(255);
    ellipse(bx[i], by[i], 5, 5);
    bx[i] += sx[i];
    by[i] += sy[i];

    if (bx[i] >= 800) {
      sx[i] = -5;
    }
    if (by[i] >= 800) {
      sy[i] = -5;
    }
    if (bx[i] <= 0) {
      sx[i] = 5;
    }
    if (by[i] <= 0) {
      sy[i] = 5;
    }
    //if( || ) または
    //if( && )　かつ

    if (bulletX[i] <= enemyX + 25 && bulletX[i] >= enemyX - 25 && bulletY[i] <= enemyY + 25 && bulletY[i] >= enemyY - 25) {
      //background(0, 255, 0);
      ehp -= 1;
      c = color(100);
    } else 
    {
      c = color(100, 100, 255);
    }

    if (bx[i] <= rx + 10 && bx[i] >= rx - 10 && by[i] <= ry + 10 && by[i] >= ry - 10) {
      //background(0, 255, 0);
      hp -= 1;
      c = color(100);
    } else 
    {
      c = color(100, 100, 255);
    }
    if (mousePressed) {
      //for(int i = 0; i < num; i++){
      bulletX[i_atack] = rx + 5;
      bulletY[i_atack] = ry + 5;
      //bsX[i] = int(random(-25, 25);
      bsY[i_atack] = -25;
      i_atack += 1;
      if (i_atack >= 100) {
        i_atack = 1;
      }
    }
    fill(255, 0, 0);
    ellipse(enemyX, enemyY, 50, 50);
    enemyX += eSpeadX;
    if (enemyX >= 800) {
      eSpeadX -= 0.01;
    }
    if (enemyX <= 0) {
      eSpeadX -= -0.01;
    }

    if (hp < 1) {
      fill(255, 0, 0);
      textSize(165);
      text("gameover", 0, 400);
    }
    if (ehp < 1) {
      fill(255, 0, 0);
      textSize(165);
      text("clear", 200, 400);
    }

    fill(c);
    rect(rx, ry, 10, 10);
    println(hp);
    println(ehp);
    //println(rx);
    //println(ry);

    for (int a = 0; a < num; a++) {
      ellipse(bulletX[a], bulletY[a], 5, 5);
      bulletY[a] += bsY[a];
    }
  }
}
