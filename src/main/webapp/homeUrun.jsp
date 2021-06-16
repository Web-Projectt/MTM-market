<%@ page import="java.io.*" %>
<%@ page language="java" import="java.sql.*" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import ="Controller.urunController,Model.urunModel,java.util.*,Controller.kategoriController,Model.kategoriModel"%>

<%
urunController data=new urunController();
List<urunModel> urunler=data.readingData();
for(urunModel urun:urunler){
    %>
	<div class="col-sm-4">
							<div class="product-image-wrapper">
								<div class="single-products">
									<div class="productinfo text-center">
										<img src=<%= urun.getFotograf() %>alt="" />
										<h2>$<%= urun.getUrunFiyat() %></h2>
										<p><%= urun.getUrunAdi() %></p>
										<a href="#" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Add to cart</a>
									</div>
									<div class="product-overlay">
										<div class="overlay-content">
											<h2>$<%= urun.getUrunFiyat() %></h2>
											<p><%= urun.getUrunAdi() %></p>
											<a href="#" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Add to cart</a>
										</div>
									</div>
								</div>
							</div>
						</div>
	<% 
}

%> 

