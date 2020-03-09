class Squirtle extends Pokemon{
  int hasarPuani = 30;
  boolean kartKullanildiMi = false;
  PImage squirtle;
  
  Squirtle(){
    super(0, null, null);
    squirtle = loadImage("squirtle.png");
  }
  
  Squirtle(int pokemonID, String pokemonAdi, String pokemonTip){
    super(pokemonID, pokemonAdi, pokemonTip);
    squirtle = loadImage("squirtle.png");
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
    image(squirtle, x, y);
    fill(0);
    textSize(12);
    //text(pokemonAdi, x + kartResim.width/3, y + kartResim.height/2);
  }
  
  
}
