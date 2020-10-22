<%-- 
    Document   : Empleados
    Created on : Oct 9, 2020, 11:35:42 PM
    Author     : Usuario
--%>

<%@page import="gt.edu.umg.desarrollo.proyecto.Model.MenuDao"%>
<%@page import="gt.edu.umg.desarrollo.proyecto.Model.PuestoDao"%>
<%@page import="java.util.HashMap"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="es">
    <head>
        <title>Pacientes</title>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

        <!-- Estilos CSS -->
        <link rel="stylesheet" href="css/main.css">

        <!--font Awesom-->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">

        
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
        
        
        <div id="header">
			<nav> <!-- Aqui estamos iniciando la nueva etiqueta nav -->
				<ul class="nav">
                                    
                              <%
                                  
                                  MenuDao menu = new MenuDao();
                                  
                                  HashMap<String, String> menudrop = menu.ReadMEnu();
                                  
                                  for(String i : menudrop.keySet()){
                                      
                                      out.println("<li> <a href=" + i +">" + menudrop.get(i) + "</a> </li>");
                                  }
                                  
                              %>  
                              
                                  
					
				</ul>
			</nav><!-- Aqui estamos cerrando la nueva etiqueta nav -->
		</div>
        
        
        
        
        <font face="Tw Cen MT" size="5" color="black">
        <h4 align="center">Clinica Medica</h4>
        <h1 align="center"><strong>NUEVO EMPLEADO</strong></h1>
        </font>
        <br/>
        
        <div class="container">
            <div class="row">
                <div class="col-md-4">
                    <div class="thumbnail">
                       <img src="https://us.123rf.com/450wm/dolgachov/dolgachov1712/dolgachov171201323/92019175-doctor-feliz-con-el-sujetapapeles-en-la-cl%C3%ADnica.jpg?ver=6" alt="Lights" style="width:100%"> 
                    </div>
                </div>    
                <div class="col-md-4">
                    <div class="thumbnail">
                       <img src="https://s3.amazonaws.com/storage.wobiz.com/44/44902/images/Large/1480112612_a1bdae5f3bfc403db0cddbf1cef388b1.44902.jpeg" alt="Lights" style="width:100%"> 
                    </div>
                </div>    
                <div class="col-md-4">
                    <div class="thumbnail">
                       <img src="https://www.soy502.com/sites/default/files/styles/full_node/public/2020/Mar/02/conserje_senalado_violar_joven_centro_comercial_zona_1_guatemala_soy502.jpg" alt="Lights" style="width:100%"> 
                    </div>
                </div>    
            </div>
            
               
            
            
            
            
            
            <form action="SrEmpleado" method="post" class="form-horizontal">
                <div class="form-group">
                  <label for="lbl_nombres" class="control-label col-sm-2">Nombres:</label>
                  <div class="col-sm-10">
                     <input type="text" name="txt_nombres" id="txt_nombres" class="form-control" placeholder="Ingresar nombres" required>
                  </div>
                </div>
                
                <!--
                <div class="form-group">
                  <label for="lbl_apellidos" class="control-label col-sm-2">Apellidos:</label>
                  <div class="col-sm-10">
                     <input type="text" name="txt_apellidos" id="txt_apellidos" class="form-control" placeholder="Ingresar apellidos" required>
                  </div> 
                </div> -->
                  
                
                <div class="form-group">
                  <label for="lbl_direccion" class="control-label col-sm-2">Direccion:</label>
                  <div class="col-sm-10">
                     <input type="text" name="txt_direccion" id="txt_direccion" class="form-control" placeholder="Ingresar direccion" required>
                  </div>
                </div>
        
                <div class="form-group">
                  <label for="lbl_telefono" class="control-label col-sm-2">Telefono:</label>
                  <div class="col-sm-10">
                     <input type="number" name="txt_telefono" id="txt_telefono" class="form-control" placeholder="Ingresar telefono" required>
                  </div>
                </div>
                
                <div class="form-group">
                  <label for="lbl_fn" class="control-label col-sm-2">Fecha nacimiento:</label>
                  <div class="col-sm-10">
                     <input type="date" name="txt_fn" id="txt_fn" class="form-control" placeholder="Ingresar fecha" required>
                  </div>
                </div>
                
                <div class="form-group">
                  <label for="lbl_cui" class="control-label col-sm-2">CUI:</label>
                  <div class="col-sm-10">
                     <input type="number" name="txt_cui" id="txt_cui" class="form-control" placeholder="Ingresar CUI" required>
                  </div>
                </div>
                
                <div class="form-group">
                  <label for="lbl_puesto" class="control-label col-sm-2">Puesto:</label>
                  <div class="col-sm-10">
                      <select name="drop_puesto" id="drop_marca" class="form-control">
                          <%
                              PuestoDao puesto =  new PuestoDao();
                              
                              HashMap<String, String> drop = puesto.ReadPuesto();
                              
                              for (String i:drop.keySet()){
                                  out.println("<option value='" + i + "'>" + drop.get(i) + "</option>");
                              }
                     %>
                      </select>
                  </div>
                </div>
                      
                <div class="form-group">        
                  <div class="col-sm-offset-2 col-sm-10">
                      <button name="btn_agregar" id="btn_agregar"  value="agregar" class="btn btn-primary actives" >Ingresar</button>
                  </div>
               </div> 
                      
            </form>
        </div>
        
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
        
    </body>
</html>