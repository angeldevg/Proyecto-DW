<%-- 
    Document   : pacientes
    Created on : Oct 11, 2020, 12:10:52 AM
    Author     : Usuario
--%>

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

    </head>

    <body>

        <div class="contaier mt-5 mx-4">

            <h1>Registro de Pacientes</h1>

            <form action="SrvPaciente" method="post" class="form-group">


                <div class="row my-5"  id="fila1">

                    <div class="col-md-auto col-xl-auto col-sm-auto">

                    </div>

                    <div class="col-md-2 col-xl-2 col-sm-2">

                        <label for="lbl_id" ><b>identificacion</b></label>
                        <input type="text" name="txt_id" id="txt_id" class="form-control" value="0"  readonly> 

                    </div>

                    <div class="col-md-auto col-xl-auto col-sm-auto">

                    </div>

                    <div class="col-md-4 col-xl-4 col-sm-4">

                        <label for="lbl_nombres" ><b>Nombre del Paciente</b></label>
                        <input type="text" name="txt_nombres" id="txt_nombres" class="form-control" placeholder="Ingrese el nombre"  requiere> 

                    </div>

                    <div class="col-md-auto col-xl-auto col-sm-auto">

                    </div>

                    <div class="col-md-3 col-xl-3 col-sm-3">
                        <label for="lbl_dpi" ><b>Documento de identifiacion</b></label>
                        <input type="number" name="txt_dpi" id="txt_dpi" class="form-control" placeholder="CUI"  required>

                    </div>

                    <div class="col-md-2 col-xl-2 col-sm-2">
                        <label for="lbl_nombres" ><b>Fecha de nacimiento</b></label>
                        <input type="date" name="txt_fecha" id="txt_fecha" class="form-control" placeholder="Nombre"  required>

                    </div>

                </div>


                <div class="row">

                    <div class="col-md-auto col-sm-auto col-md-auto">

                    </div>

                    <div class="col-xl-4 col-md-3 col-sm-2">

                        <label for="lbl_direccion" ><b>Direccion</b></label>
                        <input type="text" name="txt_direccion" id="txt_direccion" class="form-control" placeholder="Calle Avenida Municipio Departamento"  required>                

                    </div>


                    <div class="col-xl-3 col-md-3 col-sm-2">

                        <label for="lbl_celpaciente" ><b>Telefono del Paciente</b></label>
                        <input type="number" name="txt_celpaciente" id="txt_celpaciente" class="form-control" placeholder="+(502) 45678903"  required>                

                    </div>


                </div>

                <div class="row">

                    <div class="col-xl-12 col-md-12 col-sm-12">
                        <br><br> <br>
                        <h4>Datos Familiares</h4>
                        <br><br>
                    </div>


                </div>


                <div class="row">

                    <div class="col-xl-auto">

                    </div>


                    <div class="col-xl-3 col-md-3 col-sm-3">
                        <label for="lbl_celfamliar" ><b>Telefono del pariente</b></label>
                        <input type="number" name="txt_celfamiliar" id="txt_celfamiliar" class="form-control" placeholder="+(502) 45678903"  required>                  
                    </div>

                </div>


                <div class="row">

                    <div class="col-xl-12 col-md-12 col-sm-12">
                        <br><br> <br>
                        <h4>Datos Medicos</h4>
                        <br><br>
                    </div>

                </div>

                <div class="row">

                    <div class="col-xl-auto col-md-auto col-sm-auto">

                    </div>

                    <div class="row-lg-3 row-md-3">

                        <label for="lbl_carne" ><b>Carné</b></label>
                        <input type="text" name="txt_carne" id="txt_carne" class="form-control" placeholder="AG42423"  required>                  

                    </div>

                    <div class="col-lg-2 col-xl-2 col-md-2 col-sm-2">

                    </div>


                    <div class="row-lg-3">
                        </div>


                    <div class="col-lg-auto col-xl-auto col-md-auto col-sm-auto">

                    </div>

                    <div class="col-lg-3">
                        <br>
                        <button name="btn_agregar" id="btn_agregar"  value="agregar" class="lg btn btn-success" >Guardar</button>
                        <button name="btn_buscar" id="btn_buscar"  value="buscar" class="lg btn btn-dagger" >Buscar Paciente</button>

                    </div>


                </div>






            </form>





        </div>





        <!-- Optional JavaScript -->
        <!-- jQuery first, then Popper.js, then Bootstrap JS -->
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
    </body>
</html>