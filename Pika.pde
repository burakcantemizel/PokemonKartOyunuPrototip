import java.util.Collections;


//Sabit Çözünürlük
int PENCERE_GENISLIK = 1280;
int PENCERE_YUKSEKLIK = 720;

//Oyuna ait ortadaki kartlar
ArrayList<Pokemon> kartListesi;

//Sahne değişkeni
String sahne;

int KART_GENISLIK = 120;
int KART_YUKSEKLIK= 180;

boolean baslangicKartDagitildiMi;
boolean oyunDevamEdiyorMu = true;

InsanOyuncusu oyuncu1;
BilgisayarOyuncusu oyuncu1b;
BilgisayarOyuncusu oyuncu2;


int tur = 1;
int bilgisayarTimer = 0;
int savasTimer = 0;
int bitisTimer = 0;


boolean turSonuKartCek;

  PImage kartResim;

/*
ArrayList<Pokemon> pokemonlar0 = new ArrayList<Pokemon>();
ArrayList<Pokemon> pokemonlar1 = new ArrayList<Pokemon>();
ArrayList<Pokemon> pokemonlar2 = new ArrayList<Pokemon>();
*/

Pokemon savasan1;
Pokemon savasan2;

void settings(){
  size(PENCERE_GENISLIK,PENCERE_YUKSEKLIK);
}

void setup(){
  frameRate(60);
  sahne = "menu";
  baslangicKartDagitildiMi = false;
  turSonuKartCek = false;
  tur = 1;
  bilgisayarTimer = 0;
  savasTimer = 0;
  bitisTimer = 0;
  oyuncu1 = new InsanOyuncusu();
  oyuncu2 = new BilgisayarOyuncusu(2,null,0);
  oyuncu1b = new BilgisayarOyuncusu(1,null,0);
  kartListesi = new ArrayList<Pokemon>();
  desteOlustur(kartListesi);
  desteKaristir(kartListesi);
      kartResim = loadImage("bosKart.png");
      savasan1 = null;
      savasan2 = null;
}

void draw(){
    switch(sahne){
      case "menu":
        background(210);
        fill(255);
        rect(width/2-90, height/3-60, 180, 60);
        rect(width/2-90, height/2-60, 180, 60);
        rect(width/2-90, height/2+60, 180, 60);
        fill(0);
        textSize(16);
        text("Bilgisayar-Bilgisayar", width/2-90 + 15, height/3 -60 + 30);
        text("Insan-Bilgisayar", width/2-90 + 15, height/2 -60 + 30);
        text("Çıkış", width/2-90 + 15, height/2 +60 + 30);
        
        if(mouseOver(width/2-90, height/3-60, 180, 60) && mousePressed){
          sahne = "oyunbb";
          //println("asf");
        }
        
        if(mouseOver(width/2-90, height/2-60, 180, 60) && mousePressed){
          sahne = "oyunbk";
        }
        
        if(mouseOver(width/2-90, height/2+60, 180, 60) && mousePressed){
          exit();
        }
      break;
      
      case "oyunbb":
      println("oyunbb");
        if(baslangicKartDagitildiMi == false){
          kartCek(kartListesi,oyuncu1b.kartListesi);
          kartCek(kartListesi,oyuncu2.kartListesi);
          kartCek(kartListesi,oyuncu1b.kartListesi);
          kartCek(kartListesi,oyuncu2.kartListesi);
          kartCek(kartListesi,oyuncu1b.kartListesi);
          kartCek(kartListesi,oyuncu2.kartListesi);
          baslangicKartDagitildiMi = true;
        }
        
        savasYap();
        
        if(tur % 2 == 0){ //2. oyuncu oynayacak
          //Eğer elinde 3 kart yoksa kart çeksin

          if(savasan2 == null && oyuncu2.kartListesi.size() > 0){
            if(oyuncu2.kartSec() == true ){
              tur++;
            }
          }

        }else { //1. oyuncu oynayacak
          if(savasan1 == null && oyuncu1b.kartListesi.size() > 0){
            if(oyuncu1b.kartSec() == true ){
              tur++;
            }
          }
        }
        
        println(turSonuKartCek);
        
        //Tur bitiminde her iki oyuncuyada kart çektirilecek
        if(turSonuKartCek == true){
          if(kartListesi.size() >= 2){
          kartCek(kartListesi, oyuncu2.kartListesi);
          kartCek(kartListesi, oyuncu1b.kartListesi);
          }
          turSonuKartCek = false;
        }
        
        tumDesteleriCiz();
        
         if(kartListesi.size() == 0 && oyuncu1b.kartListesi.size() == 0 && oyuncu2.kartListesi.size() == 0 && savasan1 == null && savasan2 == null){
          textSize(24);
          //Oyun bitmiştir
          if(oyuncu1b.skor > oyuncu2.skor){
            text("Oyuncu 1 Kazandi!", width/2, height/2);
          }else if(oyuncu1b.skor < oyuncu2.skor){
            text("Oyuncu 2 Kazandi!", width/2, height/2);
          }else{
            text("Berabere!", width/2, height/2);
          }
          
          bitisTimer++;
          if(bitisTimer > 150){
            bitisTimer = 0;
            setup();
          }
          
        }
      break;
      
      case "oyunbk":
        background(210);
        //println("oyunbk");
        if(baslangicKartDagitildiMi == false){
          kartCek(kartListesi,oyuncu1.kartListesi);
          kartCek(kartListesi,oyuncu2.kartListesi);
          kartCek(kartListesi,oyuncu1.kartListesi);
          kartCek(kartListesi,oyuncu2.kartListesi);
          kartCek(kartListesi,oyuncu1.kartListesi);
          kartCek(kartListesi,oyuncu2.kartListesi);
          baslangicKartDagitildiMi = true;
        }
        
        savasYap();
        
        if(tur % 2 == 0){ //2. oyuncu oynayacak
          //Eğer elinde 3 kart yoksa kart çeksin

          if(savasan2 == null){
            if(oyuncu2.kartSec() == true ){
              tur++;
            }
          }

        }else { //1. oyuncu oynayacak
          if(savasan1 == null){
            if(oyuncu1.kartSec() == true ){
              tur++;
            }
          }
        }
        //Savasyap son turdada kart çektirtiyor.
        //son turda yerdeki kartlari kontrol ettirip öyle kart çektirmemiz gerek.
        //Tur bitiminde her iki oyuncuyada kart çektirilecek
        if(turSonuKartCek == true){
          if(kartListesi.size() >= 2){
          kartCek(kartListesi, oyuncu2.kartListesi);
          kartCek(kartListesi, oyuncu1.kartListesi);
          }
          turSonuKartCek = false;
        }
        
        
        tumDesteleriCiz();
        
        //Bitme şartı
        
        if(kartListesi.size() == 0 && oyuncu1.kartListesi.size() == 0 && oyuncu2.kartListesi.size() == 0 && savasan1 == null && savasan2 == null){
          textSize(24);
          //Oyun bitmiştir
          if(oyuncu1.skor > oyuncu2.skor){
            text("Oyuncu 1 Kazandi!", width/2, height/2);
          }else if(oyuncu1.skor < oyuncu2.skor){
            text("Oyuncu 2 Kazandi!", width/2, height/2);
          }else{
            text("Berabere!", width/2, height/2);
          }
          
          bitisTimer++;
          if(bitisTimer > 150){
            bitisTimer = 0;
            setup();
          }
          
        }
        
        
      break;
    }
}



void karsilikliOrtadanKartCek(){      
          if(oyuncu2.kartListesi.size() < 3 && kartListesi.size() > 0){
            kartCek(kartListesi,oyuncu2.kartListesi);
          }
       
          if(oyuncu1.kartListesi.size() < 3 && kartListesi.size() > 0){
            kartCek(kartListesi,oyuncu1.kartListesi);
          }
}


void desteOlustur(ArrayList<Pokemon> kartListesi){
  kartListesi.add(new Pikachu(0,"Pikachu","Elektrik"));
  kartListesi.add(new Bulbasaur(1,"Bulbasaur","Çim"));
  kartListesi.add(new Charmander(2,"Charmander","Ateş"));
  kartListesi.add(new Squirtle(3,"Squirtle","Su"));
  kartListesi.add(new Zubat(4,"Zubat","Hava"));
  kartListesi.add(new Psyduck(5,"Psyduck","Su"));
  kartListesi.add(new Snorlax (6,"Snorlax","Normal"));
  kartListesi.add(new Butterfree(7,"Butterfree","Hava"));
  kartListesi.add(new Jigglypuff(8,"Jigglypuff","Ses"));
  kartListesi.add(new Meowth(9,"Meowth","Normal"));
}

void desteKaristir(ArrayList<Pokemon> kartListesi){
  Collections.shuffle(kartListesi);
}

void desteYazdir(ArrayList<Pokemon> kartListesi){
  println("Kart Listesi");
  for(int i = 0; i < kartListesi.size(); i++){
    println("- " + kartListesi.get(i).pokemonAdi);
  }
  println();
}

void tumDesteleriCiz(){
  background(210);
  desteCiz(kartListesi, width/8, height/2 - KART_YUKSEKLIK/2, 3, 0);
  
  if(sahne == "oyunbb"){
    desteCiz(oyuncu1b.kartListesi,width/2 - (oyuncu1b.kartListesi.size() * (KART_GENISLIK+20))/2-10,height - KART_YUKSEKLIK - 20,KART_GENISLIK + 20,0);
  }else if(sahne == "oyunbk"){
    desteCiz(oyuncu1.kartListesi,width/2 - (oyuncu1.kartListesi.size() * (KART_GENISLIK+20))/2-10,height - KART_YUKSEKLIK - 20,KART_GENISLIK + 20,0);
  }
  
  
  desteCiz(oyuncu2.kartListesi,width/2 - (oyuncu2.kartListesi.size() * (KART_GENISLIK+20))/2-10,20 ,KART_GENISLIK + 20,0);
  
  
  //Savasanlari cizelim.
  //savasan1
  if(savasan1 != null){
    //image(kartResim, width/2 - KART_GENISLIK -10, height/2 - KART_YUKSEKLIK/2);
    fill(0);
    savasan1.kartCiz(width/2 - KART_GENISLIK -30,height/2 - KART_YUKSEKLIK/2);
    textSize(12);
    text(savasan1.pokemonAdi,  width/2 - KART_GENISLIK -30 + kartResim.width/3, height/2 - KART_YUKSEKLIK/2 + kartResim.height/2);
    textSize(20);
    text(savasan1.hasarPuaniGoster(false),width/2 - KART_GENISLIK -30 + KART_GENISLIK / 2,height/2 - KART_YUKSEKLIK/2 + KART_YUKSEKLIK/2 + 50);
  }
  
  //savasan2
  if(savasan2 != null){
    //image(kartResim, width/2 +10, height/2 - KART_YUKSEKLIK/2);
    fill(0);
    savasan2.kartCiz(width/2 -10,height/2 - KART_YUKSEKLIK/2);
    textSize(12);
    text(savasan2.pokemonAdi,  width/2 -10 + kartResim.width/3, height/2 - KART_YUKSEKLIK/2 + kartResim.height/2);
    textSize(20);
    text(savasan2.hasarPuaniGoster(false),width/2 -10 + KART_GENISLIK / 2,height/2 - KART_YUKSEKLIK/2 + KART_YUKSEKLIK/2 + 50);
  }
  
  //Skorlar
  
  textSize(16);
  text("Oyuncu 1 Skor: " + oyuncu1.skor, 15, height-20 );
  text("Oyuncu 2 Skor: " + oyuncu2.skor, 15, 30 );
}

void desteCiz(ArrayList<Pokemon> kartListesi, int x, int y, int kaymaX, int kaymaY){
  for(int i = 0; i < kartListesi.size(); i++){
    kartListesi.get(i).kartCiz(x + i * kaymaX ,y + i * kaymaY);
    kartListesi.get(i).hasarPuaniGoster(true);
  }
}

void kartCek(ArrayList<Pokemon> kartListesi, ArrayList<Pokemon> kartListesi2){
    int secilenKart = (int)random(0, kartListesi.size());
    kartListesi2.add(kartListesi.get(secilenKart));
    kartListesi.remove(secilenKart);
}

boolean mouseOver(int x, int y, int w, int h){
  if(mouseX > x && mouseX < x+w && mouseY > y && mouseY < y+h){
    return true;
  }
  return false;
}

void savasYap(){
  if(savasan1 != null && savasan2 != null){
    savasTimer++;
  }
  
  
  if(savasTimer > 150){
    if(savasan1 != null && savasan2 != null){
    if(savasan1.hasarPuaniGoster(false) > savasan2.hasarPuaniGoster(false)){
      oyuncu1.skor += 5;
      savasan1 = null;
      savasan2 = null;
      savasTimer = 0;
      if(kartListesi.size() >=2 ){
      turSonuKartCek = true;
      }
      
      return;
      
    }else if(savasan1.hasarPuaniGoster(false) < savasan2.hasarPuaniGoster(false)){
      oyuncu2.skor += 5;
      savasan1 = null;
      savasan2 = null;
      savasTimer = 0;
      if(kartListesi.size() >=2 ){
      turSonuKartCek = true;
      }
      return;
      
    }else{
      //Beraberlik
      savasan1 = null;
      savasan2 = null;
      savasTimer = 0;
      if(kartListesi.size() >=2 ){
      turSonuKartCek = true;
      }
      return;

    }
  }
  }
  
}
