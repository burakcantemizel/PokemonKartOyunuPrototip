class Charmander extends Pokemon{
  int hasarPuani = 60;
  boolean kartKullanildiMi = false;
  PImage charmander;

  Charmander(){
    super(0, null, null);
    charmander = loadImage("charmander.png");
  }
  
  Charmander(int pokemonID, String pokemonAdi, String pokemonTip){
    super(pokemonID, pokemonAdi, pokemonTip);
    charmander = loadImage("charmander.png");
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
  
   @Override
    void kartCiz(int x, int y){
    this.x = x;
    this.y = y;
    image(charmander, x, y);
    fill(0);
    textSize(12);
    //text(pokemonAdi, x + kartResim.width/3, y + kartResim.height/2);
  }
  
  
}
