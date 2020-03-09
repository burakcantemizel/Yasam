class Kamera{
  float x;
  float y;
  float hareketHizi;
  float yakinlik;
  float yakinlastirmaHizi;
  
  boolean yukari;
  boolean asagi;
  boolean sola;
  boolean saga;
  boolean yakinlastir;
  boolean uzaklastir;
  
  Kamera(float hareketHizi, float yakinlastirmaHizi){
    this.x = 0;
    this.y = 0;
    this.hareketHizi = hareketHizi;
    this.yakinlik = 1;
    this.yakinlastirmaHizi = yakinlastirmaHizi;
    this.yukari = false;
    this.asagi = false;
    this.sola = false;
    this.saga = false;
    this.yakinlastir = false;
    this.uzaklastir = false;
  }
  
  void etkinlestir(){
    hareket();
    yakinlastirma();
  }
  
  void hareket(){
    if(yukari == true){
      y -= hareketHizi;
    }
    if(asagi == true){
      y += hareketHizi;
    }
    if(sola == true){
      x -= hareketHizi;
    }
    if(saga == true){
      x += hareketHizi;
    }
    translate(width/2 - kamera.x , height/2 - kamera.y);
  }
  
  void yakinlastirma(){
    if(yakinlastir == true){
      yakinlik += yakinlastirmaHizi;
    }
    if(uzaklastir == true){
      yakinlik -= yakinlastirmaHizi;
    }
    scale(kamera.yakinlik);
  }
  
}
