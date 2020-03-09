class Pokemon{
  int pokemonID;
  String pokemonAdi;
  String pokemonTip;

  int x = 0;
  int y = 0;
  
  Pokemon(){
    this.pokemonID = 0;
    this.pokemonAdi = null;
    this.pokemonTip = null;
  }
  
  Pokemon(int pokemonID, String pokemonAdi, String pokemonTip){
    this.pokemonID = pokemonID;
    this.pokemonAdi = pokemonAdi;
    this.pokemonTip = pokemonTip;
  }
  
  int hasarPuaniGoster(boolean cizdir){
    //BU FONKSİYON OVERRİDE EDİLİP ÖZELLEŞTİRİLİYOR.
    return 0;
  }
  
  void kartCiz(int x, int y){
    this.x = x;
    this.y = y;
    image(kartResim, x, y);
    fill(0);
    textSize(12);
    text(pokemonAdi, x + kartResim.width/3, y + kartResim.height/2);
  }
  
  boolean tiklandiMi(){
     if(mouseOver(x,y,KART_GENISLIK,KART_YUKSEKLIK) && mousePressed){
       return true;
     }
     return false;
  }
  
}
