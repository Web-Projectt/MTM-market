<%@page import ="Controller.urunController,Model.urunModel"%>

<%

String urunKodu=request.getParameter("urunKodu");
int uKodu=Integer.valueOf(urunKodu);

String urunAdi=request.getParameter("urunAd");
String urunDetayi=request.getParameter("urunDetay");
String adeti=request.getParameter("urunAdet");
int uAdet=Integer.parseInt(adeti);
String urunFiyati=request.getParameter("urunFiyat");
int uFiyat=Integer.parseInt(urunFiyati);
String urunFotografi=request.getParameter("urunFotograf");
String ozelKategori=request.getParameter("ozelKategori");
String kategori=request.getParameter("kategori");
urunModel urun=new urunModel(uKodu,urunAdi,urunDetayi,uFiyat,uAdet,urunFotografi,ozelKategori,kategori);
urunController db=new urunController();
boolean result=db.control(urun);
if(result){
	
	db.Update(urun);
}
else{
	
	db.Add(urun);
}
response.sendRedirect("adminpanel.jsp#list-item-1");
%>

%>