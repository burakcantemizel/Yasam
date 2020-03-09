class Yilan{
  PImage resimYilan;
  int konumX;
  int konumY;
  int hiz = 2;
  int yon = 0;
  int kareX;
  int kareY;
  int hedefKareX;
  int hedefKareY;
  
  Yilan(int kareX, int kareY){
    this.kareX = kareX;
    this.kareY = kareY;
    this.resimYilan = loadImage("data/yilan.png");
    this.konumX = kareX * kareBoyutu;
    this.konumY = kareY * kareBoyutu;
    this.yon = 0;
  }
  
  void hareket(){
    if(yon == 0){
      yon = yonSec();
    }else if(yon == 1){
      if(this.konumX >= this.hedefKareX * kareBoyutu){
        this.konumX -= hiz;
        if(this.konumX <= this.hedefKareX * kareBoyutu){
          kareX = kareX-1;
          yon = yonSec();
        }
      }
    }else if(yon == 2){
      if(this.konumX <= this.hedefKareX * kareBoyutu){
        this.konumX += hiz;
        if(this.konumX >= this.hedefKareX * kareBoyutu){
          kareX = kareX+1;
          yon = yonSec();
        }
      }
    }else if(yon == 3){
      if(this.konumY <= this.hedefKareY * kareBoyutu){
        this.konumY += hiz;
        if(this.konumY >= this.hedefKareY * kareBoyutu){
          kareY = kareY+1;
          yon = yonSec();
        }
      }
    }else if(yon == 4){
      if(this.konumY >= this.hedefKareY * kareBoyutu){
        this.konumY -= hiz;
        if(this.konumY <= this.hedefKareY * kareBoyutu){
          kareY = kareY-1;
          yon = yonSec();
        }
      }
    }
  }
  
int yonSec(){
    int yon = (int)random(1,5);
    //1 durumu Sol olsun
    if(yon == 1){
      //Sola gitmesi için x te en az 1 kare sağda olmalı
      if(kareX > 0){
        //Solundaki kare su ise
        if(dunya[kareX-1][kareY] == 1 || dunya[kareX-1][kareY] == 2){
          //O kareyi hedef seçsin
          hedefKareX = kareX-1;
          hedefKareY = kareY;
          return 1;
        }
      }
    }else if(yon == 2){ // 2 durumu sag olsun
      //Saga gitmesi için x te en sagda olmamasi lazim
      if(kareX < yatayKareSayisi-1){
        if(dunya[kareX+1][kareY] == 1 || dunya[kareX+1][kareY] == 2){
          //O kareyi hedef seçsin
          hedefKareX = kareX + 1;
          hedefKareY = kareY;
          return 2;
        }
      }
    }else if(yon == 3){ // 3 durumu asagi olsun
      //asagi gitmesi için kareY > 0 olmali
      if(kareY < dikeyKareSayisi-1){
        if(dunya[kareX][kareY+1] == 1 || dunya[kareX][kareY+1] == 2){
          //O kareyi hedef seçsin
          hedefKareX = kareX;
          hedefKareY = kareY+1;
          return 3;
        }
      }
    }else if(yon == 4){ //4 durumu yukari olsun
      //yukari gitmesi için kareY > 0 olmali
      if(kareY > 0){
        if(dunya[kareX][kareY-1] == 1 || dunya[kareX][kareY-1] == 2){
          //O kareyi hedef seçsin
          hedefKareX = kareX;
          hedefKareY = kareY-1;
          return 4;
        }
      }
    }
    
    return 0;
  }
  
  void draw(){
    hareket();
    pushMatrix();
      image(resimYilan,this.konumX,this.konumY);
    popMatrix();
  }

}
