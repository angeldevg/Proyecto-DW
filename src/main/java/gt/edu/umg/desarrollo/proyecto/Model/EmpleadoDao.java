package gt.edu.umg.desarrollo.proyecto.Model;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.swing.table.DefaultTableModel;

public class EmpleadoDao implements IEmpleadoDao {

    PreparedStatement parametro;
    ResultSet consulta;
    Conexion conexion;

    @Override
    public int AddEmpleado(EmpleadoEntity empleado) {

        int retorno = 0;

        conexion = new Conexion();

        try {
            String query = "insert into empleados(nombre, direccion, telefono, fecha_nacimiento, cui, id_tipo_empleado) values (?, ?, ?, ?, ?, ?);";

            conexion.OpenConnection();

            parametro = conexion.conexionBD.prepareStatement(query);

            parametro.setString(1, empleado.getNombre());
            parametro.setString(2, empleado.getDireccion());
            parametro.setInt(3, empleado.getTelefono());
            parametro.setString(4, empleado.getFechaNacimiento());
            parametro.setLong(5, empleado.getDpi());
            parametro.setInt(6, empleado.getIdTipoEmpleado());

            retorno = parametro.executeUpdate();

        } catch (SQLException e) {
            System.out.println("Error: " + e.getMessage());
        } finally {
            conexion.Closeconnection();
        }

        return retorno;
    }

    @Override
    public DefaultTableModel GetEmployee() {
        DefaultTableModel table = new DefaultTableModel();

        try {
            conexion = new Conexion();
            conexion.OpenConnection();

            String query = "select e.id_empleado as id, e.nombre, e.cui, e.direccion, e.telefono, e.fecha_nacimiento, p.puesto, p.id_tipo_empleado from empleados as e inner join tipo_empleados as p on e.id_tipo_empleado = p.id_tipo_empleado order by id_empleado asc;";

            consulta = conexion.conexionBD.createStatement().executeQuery(query);

            String header[] = {"id", "nombre", "cui", "direccion", "telefono", "fecha_nacimineto", "puesto", "id_tipo_empleado"};

            table.setColumnIdentifiers(header);

            String datos[] = new String[8];

            while (consulta.next()) {
                datos[0] = consulta.getString("id");
                datos[1] = consulta.getString("nombre");
                datos[2] = consulta.getString("cui");
                datos[3] = consulta.getString("direccion");
                datos[4] = consulta.getString("telefono");
                datos[5] = consulta.getString("fecha_nacimiento");
                datos[6] = consulta.getString("puesto");
                datos[7] = consulta.getString("id_tipo_empleado");

                table.addRow(datos);

                System.out.println(consulta.getString("id"));

            }

        } catch (SQLException e) {
            System.out.println("Error!!:" + e.getMessage());
        } finally {
            conexion.Closeconnection();
        }

        return table;

    }

    @Override
    public int UpdateEmployee(EmpleadoEntity empleado) {

        int retorno = 0;

        conexion = new Conexion();

        System.out.println(empleado.getIdEmpleado());
        System.out.println("ese fue el id");

        try {

            String query = "update empleados set nombre = ?, direccion = ?, telefono = ?, fecha_nacimiento = ?, cui = ?, id_tipo_empleado = ? where id_empleado = ?;";

            conexion.OpenConnection();

            parametro = (PreparedStatement) conexion.conexionBD.prepareStatement(query);

            parametro.setString(1, empleado.getNombre());
            parametro.setString(2, empleado.getDireccion());
            parametro.setInt(3, empleado.getTelefono());
            parametro.setString(4, empleado.getFechaNacimiento());
            parametro.setLong(5, empleado.getDpi());
            parametro.setInt(6, empleado.getIdTipoEmpleado());
            parametro.setInt(7, empleado.getIdEmpleado());

            //-----------------------------------------------
            //Debuggin
            retorno = parametro.executeUpdate();

            System.out.println(retorno);
            System.out.println(empleado.getNombre());
            System.out.println(empleado.getDireccion());
            System.out.println(empleado.getTelefono());
            System.out.println(empleado.getFechaNacimiento());
            System.out.println(empleado.getDpi());
            System.out.println(empleado.getIdTipoEmpleado());
            System.out.println(empleado.getIdEmpleado());

            //----------------------------------------------------------
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        } finally {
            conexion.Closeconnection();
        }

        return retorno;
    }

    @Override
    public int DeleteEmployee(int idEmpleado) {
        
        int retorno = 0;

        try {
            conexion = new Conexion();
            
            String query = "delete from empleados where id_empleado = ? ;";
            
            conexion.OpenConnection();
            
            parametro = (PreparedStatement)conexion.conexionBD.prepareStatement(query);
            
            parametro.setInt(1, idEmpleado);
            
            retorno = parametro.executeUpdate();

            System.out.println(retorno);

        } catch (SQLException e) {
            System.out.println("Error!!!: " + e.getMessage());
        }finally{
            conexion.Closeconnection();
        }
        
        return retorno;

    }

}
