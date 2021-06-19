<%@ page import="java.io.*" %>
<%@ page language="java" import="java.sql.*" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ page import="Controller.uyeController,Model.uyeModel,java.util.*"%>


<%

	boolean result=false;

	String kullaniciAdi = request.getParameter("kullaniciAdi");
	String sifre = request.getParameter("sifre");
	String ad = request.getParameter("ad");
	String soyad = request.getParameter("soyad");
	String eMail = request.getParameter("eMail");
	String tel = request.getParameter("telefon");
	String sehir = request.getParameter("sehir");
	String ilce = request.getParameter("ilce");
	String adres = request.getParameter("adres");

	uyeController uDao=new uyeController();
	List<uyeModel> uyeler=uDao.readingData();

	for(uyeModel uye:uyeler) {
			
		if(uye.getKullaniciAdi().equals(kullaniciAdi)) {
			result=true;
			break;
		}
	}

	if(result) {
		session.setAttribute("kayit","true");
		response.sendRedirect("login.jsp");
	}
	else {
		
		session.setAttribute("kayit","false");
		uyeModel uModel=new uyeModel(kullaniciAdi,ad,soyad,tel,eMail,sifre,sehir,ilce,adres);
		uDao.Add(uModel);
		response.sendRedirect("login.jsp");
	}

%>