<%-- 
    Document   : inventarios
    Created on : Oct 21, 2020, 10:30:39 PM
    Author     : Usuario
--%>

<%@page import="gt.edu.umg.desarrollo.proyecto.Model.IMedicineDao"%>
<%@page import="gt.edu.umg.desarrollo.proyecto.Model.MedicineDao"%>
<%@page import="javax.swing.table.DefaultTableModel"%>
<%@page import="gt.edu.umg.desarrollo.proyecto.Model.InventoryDao"%>
<%@page import="gt.edu.umg.desarrollo.proyecto.Model.IInventoryDao"%>
<%@page import="java.util.HashMap"%>
<%@page import="gt.edu.umg.desarrollo.proyecto.Model.MenuDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="es">
    <head>
    <title>Inventario</title>
    <link rel="shortcut icon" href="images/medicamentos.png" />

    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">


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

            <a class="navbar-brand" href="#"> <img src="images/medicamentos.png" alt="citas" width="70" height="60">  </a>

            <div class="collapse navbar-collapse" id="navbarTogglerDemo03">
                <ul class="navbar-nav mr-auto mt-2 mt-lg-0">

                    <li class="nav-item active">
                        <%

                            MenuDao menu = new MenuDao();

                            HashMap<String, String> drop1 = menu.ReadMEnu();

                            for (String i : drop1.keySet()) {

                                out.println("<button class='btnmenu btn btn-info btn-sm' type='submit'><a href=" + i + ">" + drop1.get(i) + "</a></button>");
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
                            <h2> <b>Administracion de Medicina</b></h2>
                        </div>
                        <div class="col-sm-6">
                            <a href="#addEmployeeModal" class="btn btn-success" data-toggle="modal"><i class="material-icons">&#xE147;</i> <span>Agregar Medicamento</span></a>

                            <a onclick="window.location.href='medicamentos.jsp'" class="btn btn-info" data-toggle="modal"><i class="material-icons"></i> <span>Ver Inventario</span></a>


                        </div>
                    </div>
                </div>


                <table class="table table-striped table-hover">
                    <thead>
                        <tr>
                            <th>Medicamento</th>
                            <th>Proveedor</th>
                            <th>cantidad</th>
                            <th>Fecha de vencimiento</th>
                            <th>Fecha de ingreso</th>


                        </tr>
                    </thead>
                    <tbody id="tbl_productos">
                        
                        <% IInventoryDao inventario = new InventoryDao();
                                DefaultTableModel tabla = new DefaultTableModel();

                                tabla = inventario.GetMedicine();

                                for (int t = 0; t < tabla.getRowCount(); t++) {

                                    out.println("<tr data-id=" + tabla.getValueAt(t, 0) + " data-id_medicina=" + tabla.getValueAt(t, 6) + ">");
                                    out.println("<td>" + tabla.getValueAt(t, 1) + "</td>");
                                    out.println("<td>" + tabla.getValueAt(t, 2) + "</td>");
                                    out.println("<td>" + tabla.getValueAt(t, 3) + "</td>");
                                    out.println("<td>" + tabla.getValueAt(t, 4) + "</td>");
                                    out.println("<td>" + tabla.getValueAt(t, 5) + "</td>");
                                    out.println("</tr>");
                                    
                                    System.out.println(tabla.getValueAt(t, 5));

                                }

                            %>




                    </tbody>
                </table>



            </div>
        </div>
    </div>






    <!-- Edit Modal HTML -->
    <div id="addEmployeeModal" class="modal fade">
        <div class="modal-dialog">
            <div class="modal-content">


                <form action="SrvInventario" method="post" class="form-group">
                    <div class="modal-header">

                        <div>
                            <a class="navbar-brand" href="#"> <img src="images/medicamentos.png" alt="citas" width="70" height="60">  </a>
                        </div>

                        <h4 class="modal-title">Gestion de medicamentos</h4>

                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true" onclick="limpiar()">&times</button>
                    </div>

                    <div class="modal-body">

                        <label for="lbl_id" ><b>identificacion</b></label>
                        <input type="text" name="txt_id" id="txt_id" class="form-control" value="0"  readonly> 

                        <label for="lbl_medicina" class="control-label col-sm-2">Medicamento</label>
                        <select name="drop_medicina" id="drop_medicina" class="form-control">
                            
                            <%                                    
                                    IMedicineDao medicina = new MedicineDao();

                                    HashMap<String, String> drop = medicina.Getmedicine();

                                    for (String i : drop.keySet()) {
                                        out.println("<option value='" + i + "'>" + drop.get(i) + "</option>");
                                    }
                                %>

                        </select>

                        <label for="lbl_proveedor" class="control-label col-sm-2">Proveedor</label>
                        <input type="text" name="txt_proveedor" id="txt_proveedor" class="form-control" placeholder="Ingresar nombres" required>


                        <label for="lbl_existencias" class="control-label col-sm-2">Cantidad</label>
                        <input type="number" name="txt_existencias" id="txt_existencias" class="form-control" placeholder="Cantidad" required>


                        <label for="lbl_fn" class="control-label col-sm-2">Fecha  vencimiento</label>
                        <input type="date" name="txt_fn" id="txt_fn" class="form-control" placeholder="Ingresar fecha" required>

                        <label for="lbl_ingreso" ><b>Fecha Ingreso</b></label>
                        <input type="date" name="txt_fn1" id="txt_fn1" class="form-control" placeholder="fecha" readonly>


                    </div>

                    <div class="modal-footer">



                        <button name="btn_agregar" id="btn_agregar"  value="agregar" class="btn btn-primary">Agregar</button>

                        <button name="btn_modificar" id="btn_modificar"  value="modificar" class="btn btn-success">Modificar</button>

                        <button name="btn_eliminar" id="btn_eliminar"  value="eliminar" class="btn btn-danger" onclick="javascript:if (!confirm('¿Desea Eliminar?'))
                                return false" >Eliminar</button>

                    </div>

                </form>

            </div>
        </div>
    </div>



    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>

    
    <script type="text/javascript">
            
            
            
          $('#tbl_productos').on('click', 'tr td', function(evt){
              var target, id, idMedicina,medicina, proveedor, cantidad, fecha, fechaIngreso;
              
              target = $(event.target);
              
              id = target.parent().data("id");
              idMedicina = target.parent().data("id_medicina")
              medicina = target.parent("tr").find("td").eq(0).html();
              proveedor = target.parent("tr").find("td").eq(1).html();
              cantidad = target.parent("tr").find("td").eq(2).html();
              fecha = target.parent("tr").find("td").eq(3).html();
              fechaIngreso = target.parent("tr").find("td").eq(4).html();
        
              $("#txt_id").val(id);
              $("#txt_proveedor").val(proveedor);
              $("#txt_existencias").val(cantidad);
              $("#txt_fn").val(fecha);
              $("#txt_fn1").val(fechaIngreso);
              $("#drop_medicina").val(idMedicina);
              
              $("#addEmployeeModal").modal('show');            
              
         })
         
         
         function limpiar(){
       $("#txt_id").val(0);
       $("#txt_nombres").val('');
       $("#txt_direccion").val('');
       $("#txt_telefono").val('');
       $("#txt_fn").val('');
       $("#txt_cui").val('');
       $("#drop_puesto").val(1);
        }
        
        
        </script>




</body>
</html>