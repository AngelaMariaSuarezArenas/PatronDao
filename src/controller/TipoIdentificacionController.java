/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller;

import dao.TipoIdentificacionDao;
import java.util.List;
import javax.swing.DefaultComboBoxModel;
import model.TipoIdentificacion;

/**
 *
 * @author Angela
 */
public class TipoIdentificacionController {
    
    private TipoIdentificacionDao tipoIdentificacionDao;

    public TipoIdentificacionController(TipoIdentificacionDao tipoIdentificacionDao) {
        this.tipoIdentificacionDao = tipoIdentificacionDao;
    }
    
    public DefaultComboBoxModel llenarCombo(){
        DefaultComboBoxModel modelo = new DefaultComboBoxModel();
        List<TipoIdentificacion> tiposIds = tipoIdentificacionDao.findAll();
        for(TipoIdentificacion t:tiposIds){
            modelo.addElement(t.getDescripcion());
        }
        return modelo;
    }
}
