package gt.edu.umg.desarrollo.proyecto.Controller;

import gt.edu.umg.desarrollo.proyecto.Model.IPacienteDao;
import gt.edu.umg.desarrollo.proyecto.Model.PacienteDao;
import gt.edu.umg.desarrollo.proyecto.Model.PacienteEntity;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class SrvPaciente extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet SrvPaciente</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Pacientes Controller " + request.getContextPath() + "</h1>");

            PacienteEntity paciente = new PacienteEntity();

            IPacienteDao dao = new PacienteDao();

            paciente.setIdPaciente(Integer.valueOf(request.getParameter("txt_id")));
            paciente.setCarne(request.getParameter("txt_carne"));
            paciente.setNombre(request.getParameter("txt_nombres"));
            paciente.setDpi(Long.valueOf(request.getParameter("txt_dpi")));
            paciente.setTelefono(Integer.valueOf(request.getParameter("txt_celpaciente")));
            paciente.setTlefonoFamiliar(Integer.valueOf(request.getParameter("txt_celfamiliar")));
            paciente.setDireccion(request.getParameter("txt_direccion"));
            paciente.setFechaNacimiento(request.getParameter("txt_fecha"));

            //Botno Guardar
            if ("agregar".equals(request.getParameter("btn_agregar"))) {

                int contador = dao.AddPaciente(paciente);

                if (contador > 0) {
                    response.sendRedirect("pacientes.jsp");

                } else {
                    out.println("<h1> xxxxxxx No se Ingreso xxxxxxxxxxxx </h1>");
                    out.println("<a href='index.jsp'>Regresar...</a>");
                }
            }

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
