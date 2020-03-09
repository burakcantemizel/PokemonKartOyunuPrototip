class InsanOyuncusu extends Oyuncu{
  
  InsanOyuncusu(){
    super(0, null ,0);
  }
  
  InsanOyuncusu(int oyuncuID, String oyuncuAdi, int skor){
    super(oyuncuID , oyuncuAdi , skor);
  }
  
  @Override
  boolean kartSec(){
    //Insan İçin
    
    //Tıklayıp kartı seçecek tum kartlara tiklanma metodu yazip elindeki kartlari gezebiliriz
    for(int i=0; i < this.kartListesi.size(); i++){
      if(this.kartListesi.get(i).tiklandiMi() == true){
        println(this.kartListesi.size());
        savasan1 = this.kartListesi.get(i);
        this.kartListesi.remove(i);
        return true;
      }
    }
    //Kart elinden gidecek savaş alanina gidecek

    
    return false;
  }

}
