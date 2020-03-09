class Zubat extends Pokemon{
  int hasarPuani = 50;
  boolean kartKullanildiMi = false;

  Zubat(){
    super(0, null, null);
  }
  
  Zubat(int pokemonID, String pokemonAdi, String pokemonTip){
    super(pokemonID ,pokemonAdi, pokemonTip);
  }
  
  @Override
  int hasarPuaniGoster(boolean cizdir){
    if(cizdir){
      pushStyle();
      textSize(20);
     textAlign(CENTER,CENTER);
    text(hasarPuani,x + KART_GENISLIK / 2,y + KART_YUKSEKLIK/2 + KART_YUKSEKLIK/4);
    popStyle();
    }

    return hasarPuani;
  }
  
  
}
