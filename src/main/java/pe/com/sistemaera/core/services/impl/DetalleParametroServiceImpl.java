package pe.com.sistemaera.core.services.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.annotation.PostConstruct;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import pe.com.gmd.util.exception.GmdException;
import pe.com.sistemaera.core.dao.DetalleParametroDao;
import pe.com.sistemaera.core.entity.DetalleParametro;
import pe.com.sistemaera.core.services.DetalleParametroService;
import pe.com.sistemaera.core.services.base.BaseServiceImpl;



@Service
public class DetalleParametroServiceImpl extends BaseServiceImpl<DetalleParametro,Long> implements DetalleParametroService{

	private static final Logger LOGGER = Logger.getLogger(DetalleParametroServiceImpl.class);
	
	@Autowired
    DetalleParametroDao detalleParametroDao;
    
	
    @PostConstruct
    public void inicializar(){
        super.setBase(detalleParametroDao);
    }
    
    @Override
    public List<DetalleParametro> listarTodos(String nsParametro) throws GmdException{
        List<DetalleParametro>listaDetalleParametro = new ArrayList<DetalleParametro>();
        try {
        	HashMap<String, String> a = new HashMap<String, String>();
        	a.put("nsParametro", nsParametro);
        	
        	listaDetalleParametro = detalleParametroDao.listarTodos(a);    
        } catch (Exception excepcion) {
            throw new GmdException(excepcion);
        }        
        return listaDetalleParametro;
    }
    
    @Override
    public List<DetalleParametro> obtenerDetalleParametro(String nsDetalleParametro) throws GmdException{
        List<DetalleParametro>listaDetalleParametro = new ArrayList<DetalleParametro>();
        try {
        	HashMap<String, String> a = new HashMap<String, String>();
        	a.put("nsDetalleParametro", nsDetalleParametro);
        	
        	listaDetalleParametro = detalleParametroDao.listarTodos(a);    
        } catch (Exception excepcion) {
            throw new GmdException(excepcion);
        }        
        return listaDetalleParametro;
    }
    
    @Override
    public List<DetalleParametro> obtenerDetalleParametrobyNsParametro(String nsParametro,String nsDetalleParametro) throws GmdException{
        List<DetalleParametro>listaDetalleParametro = new ArrayList<DetalleParametro>();
        try {
        	HashMap<String, String> a = new HashMap<String, String>();
        	a.put("nsDetalleParametro", nsDetalleParametro);
        	a.put("nsParametro", nsParametro);
        	listaDetalleParametro = detalleParametroDao.listarTodos(a);    
        } catch (Exception excepcion) {
            throw new GmdException(excepcion);
        }        
        return listaDetalleParametro;
    }
    
    @Override
    public List<DetalleParametro> listarTipoServicio() throws GmdException{
        List<DetalleParametro>listaDetalleParametro = new ArrayList<DetalleParametro>();
        try {        	        	
        	listaDetalleParametro = detalleParametroDao.listarTipoServicio();
        	
        } catch (Exception excepcion) {
            throw new GmdException(excepcion);
        }
        
        return listaDetalleParametro;
    }
    
}
