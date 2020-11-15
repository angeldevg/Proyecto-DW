<%-- 
    Document   : diagnostico
    Created on : Nov 14, 2020, 11:30:47 AM
    Author     : Usuario
--%>

<%@page import="gt.edu.umg.desarrollo.proyecto.Model.MedicineDao"%>
<%@page import="gt.edu.umg.desarrollo.proyecto.Model.IMedicineDao"%>
<%@page import="gt.edu.umg.desarrollo.proyecto.Model.IMedicineDao"%>
<%@page import="gt.edu.umg.desarrollo.proyecto.Model.MenuDao"%>
<%@page import="gt.edu.umg.desarrollo.proyecto.Model.ExamenDao"%>
<%@page import="java.util.HashMap"%>
<%@page import="gt.edu.umg.desarrollo.proyecto.Model.IExamenDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="es">
    <head>
        <title>Disgnosticar</title>
        <link rel="shortcut icon" href="images/portadaexamen.png" />

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
            <nav class="navbar navbar-expand-lg fixed-top navbar-light bg-dark">
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarTogglerDemo03" aria-controls="navbarTogglerDemo03" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>

                <a class="navbar-brand" href="#"> <img src="images/portadaexamen.png" alt="citas" width="80" height="60">  </a>

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



        <div class="container mt-3">

            <div class="row">
                <div class="col-lg-12">
                    <h1 class="title">Diagnosticar</h1>
                    <hr>
                </div>
            </div>

            <div class="row mt-5">

                <div class="col-md-2">

                </div>

                <div class="col-md-8 text-center">

                    <div class="card" style="width:600px">
                        <div class="car-heder  ml-3">

                            <div>
                                <a class="navbar-brand" href="#"> <img src="images/examenes.jpg" alt="examen" width="100" height="100">  </a>
                            </div>


                            <h4 class="title">Diagnostico y Prescripcion</h4>
                        </div>

                        <div class="card-body">

                            <form action="SrvDiagnostico" method="post" class="form-group">

                                <label for="lbl_nombres" class="control-label col-sm-2"><b>Nombre Paciente</b></label>
                                <select name="drop_nombres" id="drop_nombres" class="form-control">
                                    <%                                        IExamenDao paciente = new ExamenDao();

                                        HashMap<String, String> droppaciente = paciente.GetPaciente();

                                        for (String i : droppaciente.keySet()) {
                                            out.println("<option value='" + i + "'>" + droppaciente.get(i) + "</option>");

                                        }
                                    %>

                                </select>

                                <label for="lbl_medicina" class="control-label col-sm-2">Medicamento</label>
                                <select name="drop_medicina" id="drop_medicina" class="form-control">

                                    <%
                                        IMedicineDao medicina = new MedicineDao();

                                        HashMap<String, String> dropm = medicina.Getmedicine();

                                        for (String i : dropm.keySet()) {
                                            out.println("<option value='" + i + "'>" + dropm.get(i) + "</option>");
                                        }
                                    %>

                                </select>


                                <label for="lbl_descripcion" class="control-label col-sm-2 "><b>Descripcion</b></label>
                                <textarea class="form-control" rows="5" name="txt_descripcion" id="txt_descripcion requeride"></textarea>
                                



                                <label for="lbl_fn" class="control-label col-sm-2">Fecha</label>
                                <input type="date" name="txt_fn" id="txt_fn" class="form-control" placeholder="Ingresar fecha" required>

                                <br><br><br><br>

                                <button name="btn_agregar" id="btn_agregar"  value="agregar" class="btn btn-success">Programar Examen</button>


                            </form>


                            <br><br>



                        </div>

                    </div>

                </div>

                <div class="col-md-2">

                    <a class="navbar-brand" href="#">

                        <button type="button" onclick="window.location.href = 'examenesrealizados.jsp'" class="btn btn-danger"><i class="fas fa-undo-alt"></i>Examenes realizados</button>

                    </a>

                    <a class="navbar-brand" href="#">

                        <button type="button" onclick="window.location.href = 'historial.jsp'" class="btn btn-info"><i class="fas fa-undo-alt"></i>Ver historial de Pacientes</button>

                    </a>

                </div>


            </div>


            <div class="row">

                <div class="col-lg-12">
                    <hr>

                </div>
            </div>


        </div>


        <footer></footer>





        <!-- Optional JavaScript -->
        <!-- jQuery first, then Popper.js, then Bootstrap JS -->
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
    </body>
</html>