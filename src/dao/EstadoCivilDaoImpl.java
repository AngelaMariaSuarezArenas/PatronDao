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
import model.Conexion;
import model.EstadoCivil;
import utils.Mensajes;

/**
 *
 * @author Angela
 */
public class EstadoCivilDaoImpl implements EstadoCivilDao{
    
    private Conexion conexion;
    private Statement st;
    private ResultSet rS;

    @Override
    public List<EstadoCivil> findAll() {
        List<EstadoCivil> estadoCivils = new ArrayList<>();
        try {
            String sql = "SELECT * FROM estados_civil";
            conexion = new Conexion();
            st = conexion.getCon().createStatement();
            rS = st.executeQuery(sql);
            while(rS.next()){
                EstadoCivil estadoCivil = new EstadoCivil();
                estadoCivil.setId(rS.getInt("id"));
                estadoCivil.setNombre(rS.getString("nombre"));
                estadoCivil.setDescripcion(rS.getString("descripcion"));
                estadoCivils.add(estadoCivil);
            }
            st.close();
            rS.close();
            conexion.getCon().close();
        } catch (SQLException ex) {
           Mensajes.mensajeError("Error de BBDD", ex.getMessage());
        }
        return estadoCivils;
    }
}
