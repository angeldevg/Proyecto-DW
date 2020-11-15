
package gt.edu.umg.desarrollo.proyecto.Controller;

import gt.edu.umg.desarrollo.proyecto.Model.DiagnosticoDao;
import gt.edu.umg.desarrollo.proyecto.Model.DiagnosticoEntity;
import gt.edu.umg.desarrollo.proyecto.Model.IDiagnosticoDao;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class SrvDiagnostico extends HttpServlet {


    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet SrvDiagnostico</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet SrvDiagnostico at " + request.getContextPath() + "</h1>");
            
            DiagnosticoEntity diag = new DiagnosticoEntity();
            IDiagnosticoDao dao = new DiagnosticoDao();
            
            diag.setIdPaciente(Integer.valueOf(request.getParameter("drop_nombres")));
            diag.setDescripcion(request.getParameter("txt_descripcion"));
            diag.setIdMedicina(Integer.valueOf(request.getParameter("drop_medicina")));
            diag.setFecha(request.getParameter("txt_fn"));
            dao.AddDescription(diag);
            
             //Botno Guardar
            if ("agregar".equals(request.getParameter("btn_agregar"))) {

                int contador = dao.AddDescription(diag);
                
                if (contador > 0) {
                    response.sendRedirect("diagnostico.jsp");

                } else {
                    out.println("<h1> xxxxxxx No se Ingreso xxxxxxxxxxxx </h1>");
                    out.println("<a href='index.jsp'>Regresar...</a>");
                }
            }
            
            
            out.println(Integer.valueOf(request.getParameter("drop_nombres")));
            out.println(request.getParameter("txt_descripcion"));
            out.println(Integer.valueOf(request.getParameter("drop_medicina")));
           out.println(request.getParameter("txt_fn"));
            
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
