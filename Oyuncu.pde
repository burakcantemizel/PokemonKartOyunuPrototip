class Oyuncu{
  int oyuncuID;
  String oyuncuAdi;
  int skor;
  
  ArrayList<Pokemon> kartListesi;
  
  Oyuncu(){
    this.oyuncuID = 0;
    this.oyuncuAdi = null;
    this.skor = 0;
    kartListesi = new ArrayList<Pokemon>();
  }
  
  Oyuncu(int oyuncuID, String oyuncuAdi, int skor){
    this.oyuncuID = oyuncuID;
    this.oyuncuAdi = oyuncuAdi;
    this.skor = skor;
    kartListesi = new ArrayList<Pokemon>();
  }
  
  int skorGoster(){
    //Skor gösterecek
    return 0;
  }
  
  boolean kartSec(){
    //Override edilecek abstract olacak nesnelerde tanımlancak.
    return false;
  };


}
