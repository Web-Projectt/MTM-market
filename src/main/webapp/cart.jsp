<%@ page import="java.io.*" %>
<%@ page language="java" import="java.sql.*" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import ="Controller.urunController,Model.urunModel,java.util.*,Controller.kategoriController,Model.kategoriModel"%>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>Cart | E-Shopper</title>
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/font-awesome.min.css" rel="stylesheet">
    <link href="css/prettyPhoto.css" rel="stylesheet">
    <link href="css/price-range.css" rel="stylesheet">
    <link href="css/animate.css" rel="stylesheet">
	<link href="css/main.css" rel="stylesheet">
	<link href="css/responsive.css" rel="stylesheet">
    <!--[if lt IE 9]>
    <script src="js/html5shiv.js"></script>
    <script src="js/respond.min.js"></script>
    <![endif]-->       
    <link rel="shortcut icon" href="images/ico/favicon.ico">
    <link rel="apple-touch-icon-precomposed" sizes="144x144" href="images/ico/apple-touch-icon-144-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="114x114" href="images/ico/apple-touch-icon-114-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="72x72" href="images/ico/apple-touch-icon-72-precomposed.png">
    <link rel="apple-touch-icon-precomposed" href="images/ico/apple-touch-icon-57-precomposed.png">
</head><!--/head-->

<body>
	<header id="header"><!--header-->
		<div class="header_top"><!--header_top-->
			<div class="container">
				<div class="row">
					<div class="col-sm-6">
						<div class="contactinfo">
							<ul class="nav nav-pills">
								<li><a href="#"><i class="fa fa-phone"></i> +9 0123 456 78 99 </a></li>
								<li><a href="#"><i class="fa fa-envelope"></i> MTMmarket@domain.com</a></li>
							</ul>
						</div>
					</div>
					<div class="col-sm-6">
						<div class="social-icons pull-right">
							<ul class="nav navbar-nav">
								<li><a href="#"><i class="fa fa-facebook"></i></a></li>
								<li><a href="#"><i class="fa fa-twitter"></i></a></li>
								<li><a href="#"><i class="fa fa-linkedin"></i></a></li>
								<li><a href="#"><i class="fa fa-dribbble"></i></a></li>
								<li><a href="#"><i class="fa fa-google-plus"></i></a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div><!--/header_top-->
		
		<div class="header-middle"><!--header-middle-->
			<div class="container">
				<div class="row">
					<div class="col-md-4 clearfix">
						<div class="logo pull-left">
							<a href="index.jsp"><img src="images/home/melismaaaaa-removebg-preview_2.png" alt="" /></a>
						</div>
						
					</div>
					<div class="col-md-8 clearfix">
						<div class="shop-menu clearfix pull-right">
							<ul class="nav navbar-nav">
								<li><a href="login.jsp"><i class="fa fa-lock"></i>Giris yap / Uye ol</a></li>
								<li><a href=""><i class="fa fa-user"></i>Hesap</a></li>
								<li><a href="cart.jsp"><i class="fa fa-shopping-cart"></i>Sepetim</a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div><!--/header-middle-->
	
		<div class="header-bottom"><!--header-bottom-->
			<div class="container">
				<div class="row">
					<div class="col-sm-9">
						<div class="navbar-header">
							<button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
								<span class="sr-only">Toggle navigation</span>
								<span class="icon-bar"></span>
								<span class="icon-bar"></span>
								<span class="icon-bar"></span>
							</button>
						</div>
						<div class="mainmenu pull-left">
							<ul class="nav navbar-nav collapse navbar-collapse">
								<li><a href="index.jsp" class="active">Ana Sayfa</a></li>
								<li class="dropdown"><a href="#">Alisveris<i class="fa fa-angle-down"></i></a>
                                    <ul role="menu" class="sub-menu">
										<li><a href="cart.jsp">Sepet</a></li> 
										<li><a href="login.jsp">Giris yap</a></li> 
                                    </ul>
                                </li> 
							

								<li><a href="contact-us.jsp">Iletisim</a></li>
							</ul>
						</div>
					</div>
					<div class="col-sm-3">
						
					</div>
				</div>
			</div>
		</div><!--/header-bottom-->
	</header><!--/header-->

	<section id="cart_items">
		<div class="container">
			<div class="breadcrumbs">
				<ol class="breadcrumb">
				  <li><a href="#">Anasayfa</a></li>
				  <li class="active">Alışveriş Sepeti</li>
				</ol>
			</div>
			<div class="table-responsive cart_info">
				<table class="table table-condensed">
					<thead>
						<tr class="cart_menu">
							<td class="image">Urunler</td>
							<td class="description"></td>
							<td class="price">Fiyat</td>
							<td class="quantity">Miktar</td>
							<td class="total">Toplam</td>
							<td></td>
						</tr>
					</thead>
					<tbody>
				<% 
                String oturum = (String)session.getAttribute("session");

        %>
        
        
        
        
        <%
                String urk=request.getParameter("urunk");
                if(urk!=null){
                    
                    int sepetUrunSil=Integer.valueOf(urk);
                    List<urunModel> sepetim= (List<urunModel>)session.getAttribute("sepet");
                    if(sepetim!=null){
                        
                        for(urunModel u:sepetim){
                            
                            if(u.getUrunKodu()==sepetUrunSil){
                                
                                sepetim.remove(u);
                                break;
                            }
                        }
                        
                        session.setAttribute("sepet", sepetim);
                    }
                }
                
                    
                    List<urunModel> sepetim= (List<urunModel>)session.getAttribute("sepet");
                
                
                
                if(oturum==null){
                    
                    sepetim=null;
                }
        
        %>
        <%int sayac=0; %>
        <%
                if(sepetim==null){
                    %>
                    
                    <div class="alert alert-danger" role="alert">
                          Urun Bulunmamaktadir
                    </div>
                    
                <% }
                else{
                    for(urunModel urun:sepetim){
                             %>
                             <tr>
                            <td class="cart_product">
                                <a href=""><img src="images/cart/two.png" alt=""></a>
                            </td>
                            <td class="cart_description">
                                <h4><a href=""><%=urun.getUrunAdi() %></a></h4>
                                <p>Web ID: 1089772</p>
                            </td>
                            <td class="cart_price">
                                <p>$<%=urun.getUrunFiyat()%> </p>
                            </td>
                            <td class="cart_quantity">
                                <div class="cart_quantity_button">
                                    <a class="cart_quantity_up" href=""> + </a>
                                    <input class="cart_quantity_input" type="text" name="quantity" value="1" autocomplete="off" size="2">
                                    <a class="cart_quantity_down" href=""> - </a>
                                </div>
                            </td>
                            <td class="cart_total">
                                <p class="cart_total_price">$<%=urun.getUrunFiyat()%></p>
                            </td>
                            <td class="cart_delete">
                                <a class="cart_quantity_delete" href="cart.jsp?urunk=<%=urun.getUrunKodu()%>"><i class="fa fa-times"></i></a>
                            </td>
                        </tr>
                        <%
                           sayac=sayac+urun.getUrunFiyat();
                            }
                        session.setAttribute("sayac",sayac);
                        }
            %>
					</tbody>
				</table>
			</div>
		</div>
	</section> <!--/#cart_items-->

	<section id="do_action">
		<div class="container">
			<div class="heading">
				<h3>Siparişinizi Tamamlayın...</h3>
			</div>
			<div class="row">
				<div class="col-sm-6">
					<div class="total_area">
						<ul>
							<li>Sepet Toplamı <span><%=sayac %>TL</span></li>
							<li>Kargo Ücreti <span>Bedava</span></li>
							<li>Toplam <span><%=sayac %>TL</span></li>
						</ul>
							<a class="btn btn-default update" href="">Güncelle</a>
							<a class="btn btn-default check_out" href="">Ödemeyi Tamamla</a>
					</div>
				</div>
				
			</div>
		</div>
	</section><!--/#do_action-->

	<footer id="footer"><!--Footer-->
		<div class="footer-top">
			<div class="container">
				<div class="row">
					<div class="col-sm-2">
						<div class="companyinfo">
							<h2><span>MTM</span>-Market</h2>
							<p>The safest shopping.</p>
						</div>
					</div>
					<div class="col-sm-7">
					</div>
					<div class="col-sm-3">
						<div class="address">
							<img src="images/home/map.png" alt="" />
							<p>Atakum SAMSUN</p>
						</div>
					</div>
				</div>
			</div>
		</div>
		
		
		
	</footer><!--/Footer-->
	


    <script src="js/jquery.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/jquery.scrollUp.min.js"></script>
    <script src="js/jquery.prettyPhoto.js"></script>
    <script src="js/main.js"></script>
</body>
</html>