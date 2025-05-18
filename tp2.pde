PFont miFuente;
PImage fondo0, fondo1, fondo2;

int numPantalla;
int contadorTiempo;
int alphaTexto;
float tamanoTexto;

void setup() {
  size(640, 480);

  // Fuente personalizada
  miFuente = createFont("Georgia", 24);  
  textFont(miFuente);

  // Cargar imágenes de fondo (deben estar en la carpeta "data")
  fondo0 = loadImage("teamlab-museo 1.jpg");
  fondo1 = loadImage("teamlab-museo 2.jpg");
  fondo2 = loadImage("teamlab-museo 3.jpg");

  // Inicializar variables
  numPantalla = 0;
  contadorTiempo = 0;
  alphaTexto = 0;
  tamanoTexto = 10;
  frameRate(30);
  textAlign(CENTER, CENTER);
}

void draw() {
  // Mostrar el fondo correspondiente a la pantalla
  if (numPantalla == 0) {
    image(fondo0, 0, 0, width, height);
    
    float y = map(contadorTiempo, 0, 150, 0, height);
    fill(250);
    textSize(24);
    text("Borderless: Dibujando la Luz es una experiencia artística inmersiva y digital creada por el colectivo japonés teamLab, un grupo interdisciplinario de artistas, ingenieros, programadores, arquitectos y matemáticos que trabajan en la intersección del arte, la ciencia, la tecnología y la naturaleza.", 145, 120, width / 2, y);
    
    contadorTiempo++;
    if (contadorTiempo > 150) {
      numPantalla = 1;
      contadorTiempo = 0;
      alphaTexto = 0;
    }

  } else if (numPantalla == 1) {
    image(fondo1, 0, 0, width, height);
    
    if (alphaTexto < 255) {
      alphaTexto += 5;
      if (alphaTexto > 255) alphaTexto = 255;
    }
    fill(250, alphaTexto);
    textSize(24);
    text("Esta obra forma parte del concepto general de teamLab Borderless, que ha sido exhibido en distintos lugares del mundo, especialmente en Tokio, Shanghái y otras ciudades importantes." ,145,120 , width / 2, height / 2);
    
    contadorTiempo++;
    if (contadorTiempo > 150) {
      numPantalla = 2;
      contadorTiempo = 0;
      tamanoTexto = 10;
    }

  } else if (numPantalla == 2) {
    image(fondo2, 0, 0, width, height);

    if (tamanoTexto < 24) {
      tamanoTexto += 0.5;
      if (tamanoTexto > 24) tamanoTexto = 24;
    }

    fill(255);
    textSize(tamanoTexto);
    text("Temática y mensaje: Explora la relación entre los seres humanos y la naturaleza. Invita a reflexionar sobre la interconexión entre todos los elementos del universo. Busca eliminar las barreras entre el espectador y la obra", 145,120 , width / 2, height / 2);

    // Botón reset
    fill(200);
    ellipse(600, 440, 80, 80);
    fill(0);
    textSize(20);
    text("reset", 600, 440);
  }
}

void mousePressed() {
  if (numPantalla == 2) {
    float distancia = dist(600, 440, mouseX, mouseY);
    if (distancia < 40) {
      reiniciarSketch();
      println("Botón reset presionado");
    }
  }
}

void reiniciarSketch() {
  numPantalla = 0;
  contadorTiempo = 0;
  alphaTexto = 0;
  tamanoTexto = 10;
}
