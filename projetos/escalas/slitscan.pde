//o video em questão tem tamanho 720x480, 474s a 29fps, totalizando 13746 frames, dos quais usaremos apenas 13700.
//pegamos sempre a linha número 360.
import processing.video.*;

Movie myMovie;
int contaQuadro = 0;

color [][] imagemFinal = new color [13700][480];

void setup() {
  size(720, 480, P2D);
  frame.setResizable(true);
  myMovie = new Movie(this, "big pan.mov");
  myMovie.loop();
  myMovie.frameRate(24);
  frameRate(24);
  loadPixels();
}

void movieEvent(Movie myMovie) {
  myMovie.read();
}

void draw() {
  if (contaQuadro >= 13700) {
        size(13700, 480, P2D);
    for (int i = 0; i<13700; i++) {
      for (int j = 0; j<480; j++) {
        stroke(imagemFinal[i][j]);
        point(i, j);
      }
    }

    save("deucerto.png");
    noLoop();
  }
  else {
    image(myMovie, 0, 0);
    for (int i = 0; i < 480; i++) {
      imagemFinal [contaQuadro][i] = get(360, i);
    }
    updatePixels();
    println(contaQuadro);
    contaQuadro++;
  }
}
