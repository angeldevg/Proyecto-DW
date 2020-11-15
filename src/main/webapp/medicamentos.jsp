<%-- 
    Document   : medicamentos
    Created on : Nov 8, 2020, 11:44:09 PM
    Author     : Usuario
--%>

<%@page import="javax.swing.table.DefaultTableModel"%>
<%@page import="gt.edu.umg.desarrollo.proyecto.Model.IInventoryDao"%>
<%@page import="gt.edu.umg.desarrollo.proyecto.Model.InventoryDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="es">
      <head>
    <title>Medicamentos</title>
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
        
        
    <heder>
        <nav class="navbar navbar-light sticky-top bg-dark">
  <a class="navbar-brand" href="#">
      
      <button type="button" onclick="window.location.href='inventario.jsp'" class="btn btn-success"><i class="fas fa-undo-alt"></i>Regresar</button>
       
  </a>
</nav>
    </heder>

        <div class="container">
            <div class="table-responsive">
                <div class="table-wrapper">
                    <div class="table-title">
                        <div class="row">
                            <div class="col-sm-6">
                                <h2> <b>Medicamentos en Stock</b></h2>
                            </div>

                            <div class="col-sm-6">
                                                          </div>
                        </div>

                    </div>
                </div>
            </div>
        </div>

        <div class="container">

            <%

                IInventoryDao medicina = new InventoryDao();
                DefaultTableModel tabla = new DefaultTableModel();

                tabla = medicina.GetInventory();
                
                
                
                
                if(tabla.getRowCount() == 0){
                
                    out.println("<h5>No hay Medicamentos en Stock</h5>");
                }
                

                for (int t = 0; t < tabla.getRowCount(); t++) {
                    


                    out.println("<div class='row'>");
                    
                    out.println("<div class='col-xl-3' class='table-wrapper table-responsive table-title'>");
                    out.println("</div>");
                    
                    out.println("<div class='col-xl-6'>");
                    out.println("<div class='card' style='width:100%'>");
                    out.println("<div class='card-body'>");
                    out.println("<h4 class='card-title'><b>" + tabla.getValueAt(t, 1) + "</b></h4>");
                    
                    out.println("<h5><span class='badge badge-warning'>Proveedor</span></h5>");
                    out.println("<h6><span class='card-title'>" + tabla.getValueAt(t, 2) + "</span></h6>");
                    
                    out.print("<br> <br>");
                    
                    out.println("<h5><span class='badge badge-success'>Fecha de Vencimiento</span></h5>");
                    out.println("<h6><span class='card-title'>" + tabla.getValueAt(t, 3) + "</span></h6>");
                    
                    out.print("<br> <br>");
                    
                    out.println("<h5><span class='badge badge-info'>Existencias</span></h5>");
                    out.println("<h6><span class='card-title'>" + tabla.getValueAt(t, 4) + "</span></h6>");
                    
                    
                    out.println("<img src="+tabla.getValueAt(t, 5)+" class='rounded' alt='medicina'  width='200' height='200''>");
                      

                    out.print("</div>");
                    out.print("</div>");
                    out.print("</div>");
                    
                    out.println("<div class='col-xl-3'>");
                    out.println("</div>");
                    
                  
                    out.print("</div>");
                    out.print("<br> <br>");
                    
                    

                   

                }


            %>



        </div>







        <!-- Optional JavaScript -->
        <!-- jQuery first, then Popper.js, then Bootstrap JS -->
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
    </body>
</html>