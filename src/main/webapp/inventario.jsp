<%-- 
    Document   : inventarios
    Created on : Oct 21, 2020, 10:30:39 PM
    Author     : Usuario
--%>

<%@page import="java.util.HashMap"%>
<%@page import="gt.edu.umg.desarrollo.proyecto.Model.MenuDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Inventarios</title>
        
        
                <style type="text/css">
			
			* {
				margin:0px;
				padding:0px;
			}
			
			#header {
				margin:auto;
				width:500px;
				font-family:Arial, Helvetica, sans-serif;
			}
			
			ul, ol {
				list-style:none;
			}
			
			.nav > li {
				float:left;
			}
			
			.nav li a {
				background-color:#000;
				color:#fff;
				text-decoration:none;
				padding:10px 12px;
				display:block;
			}
			
			.nav li a:hover {
				background-color:#434343;
			}
			
			.nav li ul {
				display:none;
				position:absolute;
				min-width:140px;
			}
			
			.nav li:hover > ul {
				display:block;
			}
			
			.nav li ul li {
				position:relative;
			}
			
			.nav li ul li ul {
				right:-140px;
				top:0px;
			}
			
		</style>
        
        
        
    </head>
    <body>
        <h1>inventarios</h1>
        
        
        <div id="header">
			<nav> <!-- Aqui estamos iniciando la nueva etiqueta nav -->
				<ul class="nav">
                                    
                              <%
                                  
                                  MenuDao menu = new MenuDao();
                                  
                                  HashMap<String, String> drop = menu.ReadMEnu();
                                  
                                  for(String i : drop.keySet()){
                                      
                                      out.println("<li> <a href=" + i +">" + drop.get(i) + "</a> </li>");
                                  }
                                  
                              %>  
                              
                                  
					
				</ul>
			</nav><!-- Aqui estamos cerrando la nueva etiqueta nav -->
		</div>
        
        
        
        
    </body>
</html>
