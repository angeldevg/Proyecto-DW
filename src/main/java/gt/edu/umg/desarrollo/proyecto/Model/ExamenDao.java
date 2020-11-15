package gt.edu.umg.desarrollo.proyecto.Model;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import javax.swing.table.DefaultTableModel;

public class ExamenDao implements IExamenDao {

    Conexion conexion;
    ResultSet consulta;
    PreparedStatement parametro;

    @Override
    public HashMap GetEmployee() {

        HashMap<String, String> drop = new HashMap();

        try {
            conexion = new Conexion();

            String query = "select id_empleado id, nombre from empleados where id_tipo_empleado = 3;";

            conexion.OpenConnection();

            consulta = conexion.conexionBD.createStatement().executeQuery(query);

            while (consulta.next()) {

                drop.put(consulta.getString("id"), consulta.getString("nombre"));
                System.out.println(consulta.getString("id"));
                System.out.println(consulta.getString("nombre"));

            }

        } catch (SQLException ex) {
            System.out.println("Errro: " + ex.getMessage());
        } finally {
            conexion.Closeconnection();
        }

        return drop;

    }

    //obtener tipo de examen
    @Override
    public HashMap GetExament() {

        HashMap<String, String> drop = new HashMap();

        try {
            conexion = new Conexion();

            String query = "select id_tipo_examen id, tipo_examen from tipo_examenes;";

            conexion.OpenConnection();

            consulta = conexion.conexionBD.createStatement().executeQuery(query);

            while (consulta.next()) {

                drop.put(consulta.getString("id"), consulta.getString("tipo_examen"));
                System.out.println(consulta.getString("id"));
                System.out.println(consulta.getString("tipo_examen"));
            }

        } catch (SQLException ex) {
            System.out.println("Errro: " + ex.getMessage());
        } finally {
            conexion.Closeconnection();
        }

        return drop;

    }

    @Override
    public HashMap GetClinic() {

        HashMap<String, String> drop = new HashMap();

        try {
            conexion = new Conexion();

            String query = "select id_clinica id, nombre from clinica;";

            conexion.OpenConnection();

            consulta = conexion.conexionBD.createStatement().executeQuery(query);

            while (consulta.next()) {

                drop.put(consulta.getString("id"), consulta.getString("nombre"));
                System.out.println(consulta.getString("id"));
                System.out.println(consulta.getString("nombre"));
            }

        } catch (SQLException ex) {
            System.out.println("Errro: " + ex.getMessage());
        } finally {
            conexion.Closeconnection();
        }

        return drop;

    }

    @Override
    public int SaveExamen(ExamenEntity examen) {

        int retorno = 0;

        conexion = new Conexion();

        try {
            String query = "insert into examen(id_paciente, id_tipo_examen, id_empleado, id_clinica, fecha_examen) values (?, ?, ?, ?, ?);";

            conexion.OpenConnection();

            parametro = conexion.conexionBD.prepareStatement(query);

            parametro.setInt(1, examen.getIdPaciente());
            parametro.setInt(2, examen.getIdTipoExamen());
            parametro.setInt(3, examen.getIdEmpleado());
            parametro.setInt(4, examen.getIdClinica());
            parametro.setString(5, examen.getFecha());
            retorno = parametro.executeUpdate();

        } catch (SQLException e) {
            System.out.println("Error: " + e.getMessage());
        } finally {
            conexion.Closeconnection();
        }

        return retorno;

    }

    @Override
    public HashMap GetPaciente() {

        HashMap<String, String> drop = new HashMap();

        try {
            conexion = new Conexion();

            String query = "select id_paciente id, nombre_paciente from pacientes;";

            conexion.OpenConnection();

            consulta = conexion.conexionBD.createStatement().executeQuery(query);

            while (consulta.next()) {

                drop.put(consulta.getString("id"), consulta.getString("nombre_paciente"));
                System.out.println(consulta.getString("id"));
                System.out.println(consulta.getString("nombre_paciente"));
            }

        } catch (SQLException ex) {
            System.out.println("Errro: " + ex.getMessage());
        } finally {
            conexion.Closeconnection();
        }

        return drop;
    }

    @Override
    public DefaultTableModel GetPrescripcion() {

        DefaultTableModel table = new DefaultTableModel();

        try {
            conexion = new Conexion();
            conexion.OpenConnection();

            String query = "select e.id_orden_medica id, p.nombre_paciente, t.tipo_examen,  em.nombre, cl.nombre clinica, date_format(e.fecha_examen, \"%d, %M, %Y\")fecha from pacientes p, tipo_examenes t, tipo_empleados te, empleados em, examen e, clinica cl where  e.id_paciente =  p.id_paciente and e.id_tipo_examen = t.id_tipo_examen and e.id_empleado =  em.id_empleado and em.id_tipo_empleado = te.id_tipo_empleado and e.id_clinica = cl.id_clinica;";

            consulta = conexion.conexionBD.createStatement().executeQuery(query);

            String header[] = {"id", "nombre_paciente", "tipo_examen", "nombre", "clinica", "fecha"};

            table.setColumnIdentifiers(header);

            String datos[] = new String[6];

            while (consulta.next()) {
                datos[0] = consulta.getString("id");
                datos[1] = consulta.getString("nombre_paciente");
                datos[2] = consulta.getString("tipo_examen");
                datos[3] = consulta.getString("nombre");
                datos[4] = consulta.getString("clinica");
                datos[5] = consulta.getString("fecha");

                table.addRow(datos);

            }

        } catch (SQLException e) {
            System.out.println("Error!!:" + e.getMessage());
        } finally {
            conexion.Closeconnection();
        }

        return table;

    }

}
