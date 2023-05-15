/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Conexion;
import model.TipoIdentificacion;
import utils.Mensajes;

/**
 *
 * @author Angela
 */
public class TipoIdentificacionDaoImpl implements TipoIdentificacionDao{

    private Conexion conexion;
    private Statement st;
    private ResultSet rS;
    
    @Override
    public List<TipoIdentificacion> findAll() {
        List<TipoIdentificacion> tiposIds = new ArrayList<>();
        try {
            String sql = "SELECT * FROM tipos_identificacion";
            conexion = new Conexion();
            st = conexion.getCon().createStatement();
            rS = st.executeQuery(sql);
            while(rS.next()){
                TipoIdentificacion tipoIdentificacion = new TipoIdentificacion();
                tipoIdentificacion.setId(rS.getInt("id"));
                tipoIdentificacion.setNombre(rS.getString("nombre"));
                tipoIdentificacion.setDescripcion(rS.getString("descripcion"));
                tiposIds.add(tipoIdentificacion);
            }
            st.close();
            rS.close();
            conexion.getCon().close();
        } catch (SQLException ex) {
           Mensajes.mensajeError("Error de BBDD", ex.getMessage());
        }
        return tiposIds;
    }
    
}
