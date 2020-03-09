int kareBoyutu = 64;
int yatayKareSayisi = 80;
int dikeyKareSayisi = 45;
int dunyaGenislik = kareBoyutu * yatayKareSayisi;
int dunyaYukseklik = kareBoyutu * dikeyKareSayisi;
int[][] dunya;

PImage resimSu;
PImage resimCimen;
PImage resimToprak;

PFont font;

Kamera kamera;
ArrayList<Tavsan> tavsanlar;
ArrayList<Timsah> timsahlar;
ArrayList<Yilan> yilanlar;
ArrayList<Civciv> civcivler;

void setup(){
  size(1600,900, P2D);
 
  
  resimSu = loadImage("data/su2.png");
  resimCimen = loadImage("data/cimen.png");
  resimToprak = loadImage("data/toprak.png");
  
  kamera = new Kamera(10, 0.005);
  dunya = new int[yatayKareSayisi][dikeyKareSayisi];
  tavsanlar = new ArrayList<Tavsan>();
  timsahlar = new ArrayList<Timsah>();
  yilanlar = new ArrayList<Yilan>();
  civcivler = new ArrayList<Civciv>();
  dunyaOlustur();
  canliOlustur();
  
  font = loadFont("Alef-Bold-128.vlw");
}

void draw(){
  background(255);
  kamera.etkinlestir();
  translate( -dunyaGenislik / 2, -dunyaYukseklik / 2 );
  dunyaCiz();
  canliCiz();
  
  fill(255);
  textSize(16);
  text("Özgecik", tavsanlar.get(0).konumX + 4,tavsanlar.get(0).konumY);
  
  /*
  pushMatrix();
  resetMatrix();
  noStroke();
  fill(255,0,200,150);
  rect(0,0,width,height);
  textAlign(CENTER,CENTER);
  fill(255);
  textFont(font);
  textSize(128);
  text("Yaşam",width/2-100,height/2);
  textSize(32);
  text("Burak Can Temizel",width/2+90,height/2+80);
  popMatrix();
  */
}

void dunyaOlustur(){
  float rastgeleDeger;
  
  for(int x = 0; x < yatayKareSayisi; x++){
    for(int y = 0; y < dikeyKareSayisi; y++){
      rastgeleDeger = random(0,7);
      if(rastgeleDeger < 2){
        dunya[x][y] = 0; // SU
      }else if(rastgeleDeger < 6){
        dunya[x][y] = 1; // ÇİMEN
      }else if(rastgeleDeger < 7){
        dunya[x][y] = 2; // TOPRAK
      }
    }
  }
  
 for(int x = 0; x < yatayKareSayisi; x++){
    for(int y = 0; y < dikeyKareSayisi; y++){
      if(x > 0 && x < yatayKareSayisi-1 && y > 0 && y < dikeyKareSayisi-1){
        if(dunya[x][y] == 0 && dunya[x-1][y] != 0 && dunya[x+1][y] != 0 && dunya[x][y-1] != 0 && dunya[x][y+1] != 0){
          dunya[x][y] = (int)random(1,3);
        }
      }
    }
  }
  
}

void dunyaCiz(){
  pushMatrix();
  for(int x = 0; x < yatayKareSayisi; x++){
    for(int y = 0; y < dikeyKareSayisi; y++){
      if(dunya[x][y] == 0){
        //fill(0,0,255);
        //rect(x * kareBoyutu, y * kareBoyutu, kareBoyutu, kareBoyutu);
        image(resimSu, x * kareBoyutu, y * kareBoyutu);
      }else if(dunya[x][y] == 1){
        image(resimCimen, x * kareBoyutu, y * kareBoyutu);
      }else if(dunya[x][y] == 2){
        image(resimToprak, x * kareBoyutu, y * kareBoyutu);
      }
      
      //noSmooth();
      //textSize(10);
      //text(x + "," + y, x * kareBoyutu + 4, y * kareBoyutu + 16);
    }
  }
  popMatrix();
}

void canliOlustur(){
  int tavsanAdedi = (int)random(15,26);
  int yilanAdedi = (int)random(10,11);
  int timsahAdedi = (int)random(20,21);
  int civcivAdedi = (int)random(15,21);
  
  //Tavsanlar
  for(int i = 0; i < tavsanAdedi; i++){
    int konumX = (int)random(0,yatayKareSayisi);
    int konumY = (int)random(0,dikeyKareSayisi);
    while(dunya[konumX][konumY] != 1){
      konumX = (int)random(0,yatayKareSayisi);
      konumY = (int)random(0,dikeyKareSayisi);
    }
    tavsanlar.add(new Tavsan(konumX, konumY));
  }
  
  //Yilanlar
  for(int i = 0; i < yilanAdedi; i++){
    int konumX = (int)random(0,yatayKareSayisi);
    int konumY = (int)random(0,dikeyKareSayisi);
    while(dunya[konumX][konumY] != 2){
      konumX = (int)random(0,yatayKareSayisi);
      konumY = (int)random(0,dikeyKareSayisi);
    }
    yilanlar.add(new Yilan(konumX, konumY));
  }
  
  //Timsahlar
  for(int i = 0; i < timsahAdedi; i++){
    int konumX = (int)random(0,yatayKareSayisi);
    int konumY = (int)random(0,dikeyKareSayisi);
    while(dunya[konumX][konumY] != 0){
      konumX = (int)random(0,yatayKareSayisi);
      konumY = (int)random(0,dikeyKareSayisi);
    }
    timsahlar.add(new Timsah(konumX, konumY));
  }
  
  //Civcivler
  for(int i = 0; i < civcivAdedi; i++){
    int konumX = (int)random(0,yatayKareSayisi);
    int konumY = (int)random(0,dikeyKareSayisi);
    while(dunya[konumX][konumY] != 1){
      konumX = (int)random(0,yatayKareSayisi);
      konumY = (int)random(0,dikeyKareSayisi);
    }
    civcivler.add(new Civciv(konumX, konumY));
  }
}

void canliCiz(){
  //Tavsanlar
  for(int i = 0; i < tavsanlar.size(); i++){
    tavsanlar.get(i).draw();
  }
  
  //Yilanlar
  for(int i = 0; i < yilanlar.size(); i++){
    yilanlar.get(i).draw();
  }
  
  //Timsahlar
  for(int i = 0; i < timsahlar.size(); i++){
    timsahlar.get(i).draw();
  }

  //Civcivler
  for(int i = 0; i < civcivler.size(); i++){
    civcivler.get(i).draw();
  }
}

void keyPressed(){
  if(keyCode == UP){
    kamera.yukari = true;
  }
  if(keyCode == DOWN){
    kamera.asagi = true;
  }
  if(keyCode == LEFT){
    kamera.sola = true;
  }
  if(keyCode == RIGHT){
    kamera.saga = true;
  }
  if(keyCode == 65){ // A
    kamera.yakinlastir = true;
  }
  if(keyCode == 90){ // Z
    kamera.uzaklastir = true;
  }
}

void keyReleased(){
  if(keyCode == UP){
    kamera.yukari = false;
  }
  if(keyCode == DOWN){
    kamera.asagi = false;
  }
  if(keyCode == LEFT){
    kamera.sola = false;
  }
  if(keyCode == RIGHT){
    kamera.saga = false;
  }
  if(keyCode == 65){ // A
    kamera.yakinlastir = false;
  }
  if(keyCode == 90){ // Z
    kamera.uzaklastir = false;
  }
}
