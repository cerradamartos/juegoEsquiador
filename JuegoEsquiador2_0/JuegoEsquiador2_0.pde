
int value = 0;
int posYban=50;
int posXban=50;
int anchuraBan=150;
int vel=3;
int score=0;
int life= 5;
boolean gameover=false;
boolean youwin = false;

void setup() {
  size(500, 500);
  value = 0;
  posYban=50;
  posXban=50;
  anchuraBan=150;
  vel=3;
  score=0;
  life= 5;
}

void draw() {
  background(100, 200, 0);

  fill(255, 0, 0);
  noStroke();
  triangle(mouseX, 400, mouseX + 30, 450, mouseX - 30, 450);

  fill(204, 255, 229);
  textSize(12);
  text("Score:"+score+ "puntos", 400, 30);
  fill(0, 0, 0);
  plotVidasCuadradas(life);
  if (gameover==false && youwin ==false) {
    fill(value);
    posYban+=vel;
    if (posYban >= 500) {
      posYban = 0;
      posXban = (int)random(5, 500-anchuraBan-5);
    }
    println(mouseX+",,"+mouseY);
    stroke(0);
    strokeWeight(10);
    line(posXban, posYban, posXban, posYban+40);
    line(posXban+anchuraBan, posYban, posXban+anchuraBan, posYban+40);


    //text("Vidas:"+life+ "vidas", 20, 30);

    if  ( posXban < mouseX-30 && mouseX +30 < posXban+ anchuraBan && posYban+20 == 422) {
      score = score+5;
    } else if ( posYban+20 == 422) {
      score = score -3;
      life =life - 1;
    }

    if (score >= 50) {
      youwin = true;
    }
    if (life == 0) {
      gameover=true;
    }
  } else if (youwin==true) {
    textSize(30);
    fill(102, 255, 102);
    text("YOU WIN", 200, 250);
  } else if (gameover==true) {

    fill(255, 0, 0);
    textSize(30);
    text("GAME OVER", 200, 250);
  }
}


void mouseClicked() {
  if (gameover==true) {
    gameover=false;
    setup();
  } else if (youwin ==true) {
    youwin=false;
    setup();
  }
}


void plotVidasCuadradas(int numVidas) {

  for (int i=0; i<numVidas; i++) {
    int desp=i*30;
    quad(20+desp, 30, 30+desp, 30, 30+desp, 40, 20+desp, 40);
  }
}