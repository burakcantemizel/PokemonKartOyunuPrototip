class BilgisayarOyuncusu extends Oyuncu{
  
  BilgisayarOyuncusu(){
    super(0, null ,0);
  }
  
  BilgisayarOyuncusu(int oyuncuID, String oyuncuAdi, int skor){
    super(oyuncuID , oyuncuAdi , skor);
  }
  
  @Override
  boolean kartSec(){
    //Karti rastgele seçecek elindekilerden
    
    int secilenKart = (int)random(0, kartListesi.size());
    bilgisayarTimer++;
    
    if(bilgisayarTimer > 100){
      if(oyuncuID == 1){
         savasan1 = kartListesi.get(secilenKart);
         kartListesi.remove(secilenKart);
      bilgisayarTimer = 0;
      return true;
      }else if(oyuncuID == 2){
         savasan2 = kartListesi.get(secilenKart);
         kartListesi.remove(secilenKart);
      bilgisayarTimer = 0;
      return true;
      }
    }

    
    return false;
  }

}
