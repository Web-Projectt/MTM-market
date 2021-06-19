package Model;

public class siparisModel {

	 private int siparisKodu;
	 private String uyekullaniciAdi ; 
	 private String siparisTarihi; 
	 private String isleme;
	 private String hazirlanma ; 
	 private String kargolama ;
	 private String teslim;
	 
	 
	 
	 



	


	public String getUyekullaniciAdi() {
		return uyekullaniciAdi;
	}





	public void setUyekullaniciAdi(String uyekullaniciAdi) {
		this.uyekullaniciAdi = uyekullaniciAdi;
	}





	public siparisModel(int siparisKodu, String uyekullaniciAdi, String siparisTarihi, String isleme, String hazirlanma, String kargolama,
			String teslim) {
		
		this.siparisKodu = siparisKodu;
		this.siparisTarihi = siparisTarihi;
		this.isleme = isleme;
		this.hazirlanma = hazirlanma;
		this.kargolama = kargolama;
		this.teslim = teslim;
		this.uyekullaniciAdi = uyekullaniciAdi;
	}
	
	
	public siparisModel(String siparisTarihi, String isleme, String hazirlanma, String kargolanma, String teslim,
			String uyekullaniciAdi) {
		super();
		this.siparisTarihi = siparisTarihi;
		this.isleme = isleme;
		this.hazirlanma = hazirlanma;
		this.kargolama = kargolanma;
		this.teslim = teslim;
		this.uyekullaniciAdi = uyekullaniciAdi;
	}





	public siparisModel(int siparisKodu, String siparisTarihi, String isleme, String hazirlanma, String kargolanma,
			String teslim) {
		super();
		this.siparisKodu = siparisKodu;
		this.siparisTarihi = siparisTarihi;
		this.isleme = isleme;
		this.hazirlanma = hazirlanma;
		this.kargolama = kargolanma;
		this.teslim = teslim;
	}

	public int getSiparisKodu() {
		return siparisKodu;
	}


	public void setSiparisKodu(int siparisKodu) {
		this.siparisKodu = siparisKodu;
	}


	public String getSiparisTarihi() {
		return siparisTarihi;
	}


	public void setSiparisTarihi(String siparisTarihi) {
		this.siparisTarihi = siparisTarihi;
	}


	public String getIsleme() {
		return isleme;
	}


	public void setIsleme(String isleme) {
		this.isleme = isleme;
	}


	public String getHazirlanma() {
		return hazirlanma;
	}


	public void setHazirlanma(String hazirlanma) {
		this.hazirlanma = hazirlanma;
	}


	public String getKargolama() {
		return kargolama;
	}


	public void setKargolama(String kargolama) {
		this.kargolama = kargolama;
	}


	public String getTeslim() {
		return teslim;
	}


	public void setTeslim(String teslim) {
		this.teslim = teslim;
	}

	



	 
	 
	
	
     
     
}
