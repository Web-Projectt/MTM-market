package Controller;

import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import Controller.databaseConnection;
import Model.siparisModel;

public class siparisController extends databaseConnection{

	public List<siparisModel> readingData(){
	   	 
	 	   try {
	 		   String sorgu="SELECT * FROM siparis";
	 		   Class.forName("com.mysql.jdbc.Driver");
	 		    con=DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/mtm-market?useUnicode=true&characterEncoding=UTF-8&zeroDateTimeBehavior=CONVERT_TO_NULL&serverTimezone=GMT","root","mel4066");
	            ps=con.prepareStatement(sorgu);
	            ResultSet rs=ps.executeQuery();
	            List<siparisModel> liste=new ArrayList<>();
	            while(rs.next())
	            {
	            	siparisModel siparis=new siparisModel(rs.getInt("siparisKodu"),rs.getString("uyekullaniciAdi"),rs.getString("siparisTarihi"),rs.getString("isleme"),
	            							rs.getString("hazirlanma"),rs.getString("kargolama"),rs.getString("teslim"));
	            		
	            	liste.add(siparis);
	            }
	            return liste;
	        } 
	        catch (ClassNotFoundException | SQLException exception) {
	            System.out.println("Bir hata meydana geldi:"+exception);
	            return null;
	        }
	 	   finally{ 
	            try {
	                if(con!=null){ 
	                    con.close();
	                }
	                if(ps!=null){ 
	                    ps.close();
	                }
	            } catch (SQLException sqlException) {
	                System.out.println("Bir hata meydana geldi:"+sqlException);
	            }
	        }
	 	   
	     }
		
		
		public void Add(siparisModel siparis){
		   	  
			
		 	   try {
		 		   String sorgu="INSERT INTO siparis(uyeKullaniciAdi,siparisTarihi,isleme,hazirlanma,kargolama,teslim) VALUES(?,?,?,?,?,?)";
		 		   Class.forName("com.mysql.jdbc.Driver");
		 		    con=DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/mtm-market?useUnicode=true&characterEncoding=UTF-8&zeroDateTimeBehavior=CONVERT_TO_NULL&serverTimezone=GMT","root","mel4066");
		            ps=con.prepareStatement(sorgu);
		            
		            
		            ps.setString(1, siparis.getUyekullaniciAdi());
		            ps.setString(2, siparis.getSiparisTarihi());
		            ps.setString(3, siparis.getIsleme());
		            ps.setString(4, siparis.getHazirlanma());
		            ps.setString(5, siparis.getKargolama());
		            ps.setString(6, siparis.getTeslim());
		           

		          
		            ps.executeUpdate();
		 	   }
		           
		            catch(ClassNotFoundException | SQLException exception)
		            {
		                System.out.println(exception);
		                setErrorMessage(exception.toString());
		            }
		            finally 
		            {
		                try {
		                    if(con!=null){
		                        con.close();
		                    }
		                    if(ps!=null){
		                        ps.close();
		                    }
		                }
		                catch(SQLException sqlException)
		                {
		                    System.out.println(sqlException);
		                }
		            }
		            
		        }


				private void setErrorMessage(String string) {
						// TODO Auto-generated method stub
			
				}
		

			public void Remove(siparisModel siparis){
	 	  
				int i=0;
				try {
					String sorgu="DELETE FROM siparis WHERE siparisKodu=?";
					Class.forName("com.mysql.jdbc.Driver");
					con=DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/mtm-market?useUnicode=true&characterEncoding=UTF-8&zeroDateTimeBehavior=CONVERT_TO_NULL&serverTimezone=GMT","root","mel4066");
					ps=con.prepareStatement(sorgu);	    
		            ps.setInt(1, siparis.getSiparisKodu());
		            i=ps.executeUpdate();
		 	   }
		           
		            catch(ClassNotFoundException | SQLException exception)
		            {
		                System.out.println(exception);
		                setErrorMessage(exception.toString());
		            }
		            finally 
		            {
		                try {
		                    if(con!=null){
		                        con.close();
		                    }
		                    if(ps!=null){
		                        ps.close();
		                    }
		                }
		                catch(SQLException sqlException)
		                {
		                    System.out.println(sqlException);
		                }
		            }
		            if(i>0) 
		            {
		                 System.out.println("kayit silindi");
		            }
		            else 
		            {
		            	System.out.println("kayit silinmedi");
		            }
				}
			


		
			public void Update(siparisModel siparis){
		  
				int i=0;
				try {
					String sorgu="UPDATE siparis SET siparisTarihi=?,isleme=?,hazirlanma=?,kargolanma=?,teslim=?,odemeTipi=? WHERE siparisKodu=?";
					Class.forName("com.mysql.jdbc.Driver");
					con=DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/mtm-market?useUnicode=true&characterEncoding=UTF-8&zeroDateTimeBehavior=CONVERT_TO_NULL&serverTimezone=GMT","root","mel4066");
					ps=con.prepareStatement(sorgu);	    
			        
		            ps.setString(1, siparis.getSiparisTarihi());
		            ps.setString(2, siparis.getIsleme());
		            ps.setString(3, siparis.getHazirlanma());
		            ps.setString(4, siparis.getKargolama());
		            ps.setString(5, siparis.getTeslim());
		          
		            ps.setInt(7, siparis.getSiparisKodu());
		            
			        i=ps.executeUpdate();
				   }
			       
			        catch(ClassNotFoundException | SQLException exception)
			        {
			            System.out.println(exception);
			            setErrorMessage(exception.toString());
			        }
			        finally 
			        {
			            try {
			                if(con!=null){
			                    con.close();
			                }
			                if(ps!=null){
			                    ps.close();
			                }
			            }
			            catch(SQLException sqlException)
			            {
			                System.out.println(sqlException);
			            }
			        }
			        if(i>0) 
			        {
			             System.out.println("guncelleme yapildi");
			        }
			        else 
			        {
			        	System.out.println("guncelleme yapilmadi");
			        }
				}
}

