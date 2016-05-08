
int value = 0;
int posYban=50;
int posXban=50;
int anchuraBan=150;
int vel=3;
int score=0;
int life= 5;
int posEsq =250;
int velEsq=0;
boolean gameover=false;
boolean youwin = false;
PImage photoband;
PImage photoesq;
PImage photoesq2; 

void setup() {
  size(500, 500);
  value = 0;
  posYban=50;
  posXban=50;
  anchuraBan=150;
  vel=3;
  score=0;
  velEsq=0;
  life= 5;
  photoband = loadImage("bandera.png");
  photoesq = loadImage("Esquiador_dch.png");
  photoesq2 = loadImage("Esquiador_izq2.png");
}

void draw() {
  background(100, 200, 0);
  getVelSkiador();
  posEsq+=velEsq;
  println("posE="+posEsq);
  /* fill(255, 0, 0);
   noStroke();
   triangle(posEsq, 400, posEsq + 30, 450, posEsq - 30, 450);*/
  if (vel<=3) {
    image(photoesq, posEsq, 400);
  } else {
    image(photoesq2, posEsq, 400);
  }

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
  /*  stroke(0);
    strokeWeight(7);
    line(posXban, posYban, posXban, posYban+40);
    line(posXban+anchuraBan, posYban, posXban+anchuraBan, posYban+40);*/
    //text("Vidas:"+life+ "vidas", 20, 30);
    image(photoband,posXban,posYban);
    image(photoband,posXban+anchuraBan,posYban);
    if  ( posXban< posEsq-30 && posEsq +30 < posXban+ anchuraBan && posYban+20 == 422) {
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

void getVelSkiador() {
  if (mouseX<width/2) {
    velEsq=-3;
  } else {
    velEsq=3;
  }
}

void plotVidasCuadradas(int numVidas) {

  for (int i=0; i<numVidas; i++) {
    int desp=i*30;
    quad(20+desp, 30, 30+desp, 30, 30+desp, 40, 20+desp, 40);
  }
}