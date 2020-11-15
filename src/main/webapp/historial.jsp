<%-- 
    Document   : historial
    Created on : Nov 13, 2020, 1:50:02 AM
    Author     : Usuario
--%>

<%@page import="gt.edu.umg.desarrollo.proyecto.Model.HistorialDao"%>
<%@page import="gt.edu.umg.desarrollo.proyecto.Model.IHistorialDao"%>
<%@page import="java.util.HashMap"%>
<%@page import="gt.edu.umg.desarrollo.proyecto.Model.MenuDao"%>
<%@page import="gt.edu.umg.desarrollo.proyecto.Model.InventoryDao"%>
<%@page import="javax.swing.table.DefaultTableModel"%>
<%@page import="gt.edu.umg.desarrollo.proyecto.Model.IInventoryDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="es">
      <head>
    <title>Historial</title>
    <link rel="shortcut icon" href="images/medicamentos.png" />

    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">


    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    
    <!--stilo-->
    <link rel="stylesheet" href="css/style.css">

    <link rel="stylesheet" href="css/pacientes.css">

    <!--Iconos-->
    <link href = "https://unpkg.com/ionicons@4.5.10-0/dist/css/ionicons.min.css"  rel = "stylesheet" >


    <!--Google fonts-->

    <link href = "https://fonts.googleapis.com/css2? family = Roboto: wght @ 100 & display = swap" rel = "stylesheet">

    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">




</head>
    <body>
        
       
        <!--Header-->
        <header>

            <!--NavBar-->
            <nav class="navbar navbar-expand-lg navbar-light bg-dark">
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarTogglerDemo03" aria-controls="navbarTogglerDemo03" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>

                <a class="navbar-brand" href="#"> <img src="images/pacientes.png" alt="citas" width="70" height="60">  </a>

                <div class="collapse navbar-collapse" id="navbarTogglerDemo03">
                    <ul class="navbar-nav mr-auto mt-2 mt-lg-0">

                        <li class="nav-item active">

                            <%

                                MenuDao menu = new MenuDao();

                                HashMap<String, String> drop = menu.ReadMEnu();

                                for (String i : drop.keySet()) {

                                    out.println("<button class='btnmenu btn btn-info btn-sm' type='submit'><a href=" + i + ">" + drop.get(i) + "</a></button>");
                                }

                            %>  

                        </li>

                    </ul>

                    <form class="form-inline my-2 my-lg-0">
                        <input class="form-control mr-sm-4" type="search" placeholder="Buscar" aria-label="Search">
                        <button class="btn btn-success my-2 my-sm-0" type="submit"><a></a> <strong>Buscar</strong></button>
                    </form>

                </div>
            </nav>
        </header>


        <div class="container">
            <div class="table-responsive">
                <div class="table-wrapper">
                    <div class="table-title">
                        <div class="row">
                            <div class="col-sm-6">
                                <h2> <b>Historial de pacientes</b></h2>
                            </div>
                            <div class="col-sm-6">

                               


                            </div>
                        </div>
                    </div>


                    <table class="table table-striped table-hover text-center">
                        <thead>
                            <tr>
                                <th>Paciente</th>
                                <th>Tipos de examen</th>
                                <th>Descripcion</th>
                                <th>medicina</th>
                                
                            </tr>
                        </thead>
                        <tbody id="tbl_pacientes">
                            
                             <%                     
                                 IHistorialDao historial = new HistorialDao();
                                DefaultTableModel tabla = new DefaultTableModel();

                                tabla = historial.GetHistorial();

                                for (int t = 0; t < tabla.getRowCount(); t++) {

                                    out.println("<tr data-id=" + tabla.getValueAt(t, 0) + ">");
                                    out.println("<td>" + tabla.getValueAt(t, 1) + "</td>");
                                    out.println("<td>" + tabla.getValueAt(t, 2) + "</td>");
                                    out.println("<td>" + tabla.getValueAt(t, 3) + "</td>");
                                    out.println("<td>" + tabla.getValueAt(t, 4) + "</td>");
                                   
                                   
                                    out.println("</tr>");

                                }
                            %>



                           
                        </tbody>
                    </table>


                </div>
            </div>
        </div>




        <!-- Optional JavaScript -->
        <!-- jQuery first, then Popper.js, then Bootstrap JS -->
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
    </body>
</html>