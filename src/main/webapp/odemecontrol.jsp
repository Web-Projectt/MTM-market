

<%@page import ="Controller.siparisController,Model.siparisModel,java.util.*" %>

<%
		siparisController siparisdb=new siparisController();
		 Date simdikiZaman = new Date();
		 String cookieName = "username";
			Cookie cookies [] = request.getCookies();
			Cookie myCookie = null;
			if (cookies != null){
				
				for (int i = 0; i < cookies.length; i++){
					
					if (cookies [i].getName().equals(cookieName)){
							
						myCookie = cookies[i];
						break;
					}
				}
			
		siparisModel siparis=new siparisModel(myCookie.getValue(),simdikiZaman.toString(),"false","false","false","false");
		
		siparisdb.Add(siparis);
		session.setAttribute("sepet",null);
		session.setAttribute("onay","true");
		session.getMaxInactiveInterval();
		response.sendRedirect("cart.jsp");
	}

%>