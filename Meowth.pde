class Meowth extends Pokemon{
  int hasarPuani = 40;
  boolean kartKullanildiMi = false;

  Meowth(){
    super(0, null, null);
  }
  
  Meowth(int pokemonID, String pokemonAdi, String pokemonTip){
    super(pokemonID, pokemonAdi, pokemonTip);
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
