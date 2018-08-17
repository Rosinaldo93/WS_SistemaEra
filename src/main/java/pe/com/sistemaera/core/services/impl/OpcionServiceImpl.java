/**
 * Resumen.
 * Objeto 			   : OpcionServiceImpl.java.
 * Descripción 		   : Clase que implemeta los métodos de la clase OpcionService.
 * Fecha de Creación   : 31/03/2017.
 * PE de Creación 	   : 
 * Autor 			   : Jimy Monja.
 * --------------------------------------------------------------------------------------------------------------
 * Modificaciones
 * Motivo			Fecha			Nombre			Descripción
 * --------------------------------------------------------------------------------------------------------------
 * 
 */
package pe.com.sistemaera.core.services.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import pe.com.gmd.util.exception.GmdException;
import pe.com.sistemaera.core.dao.OpcionDao;
import pe.com.sistemaera.core.entity.Opcion;
import pe.com.sistemaera.core.services.OpcionService;
import pe.com.sistemaera.core.services.base.BaseServiceImpl;

/**
 * Clase que implemeta los métodos de la clase OpcionService.
 */
@Service
public class OpcionServiceImpl extends BaseServiceImpl<Opcion, Integer> implements OpcionService {

	@Autowired
	OpcionDao opcionDao;

	/**
	 * Metodo que realiza la insercion de una opción
	 * @param Opcion objeto que contiene los datos de una Opción, tipo Opcion.
	 * @return esCorrecto resultado del registro, tipo boolean.
	 */
	@Override
	@Transactional
	public boolean insertarOpcion(Opcion opcion) throws GmdException{
		boolean esCorrecto = true;
		try {
			opcionDao.insertar(opcion);

		} catch (Exception excepcion) {
			throw new GmdException(excepcion);
		}

		return esCorrecto;
	}

	/**
	 * Metodo que obtiene una opción
	 * @param idOpcion identificador para obtener la entidad, tipo Integer
	 * @return Objeto Opcion, tipo Opcion.
	 */
	@Override
	public Opcion obtener(String idOpcion) throws GmdException{
		Opcion opcion = null;
		try {

			opcion = opcionDao.obtener(idOpcion);

		} catch (Exception excepcion) {
			throw new GmdException(excepcion);
		}
		return opcion;
	}

	/**
	 * Metodo que realiza la actualización de una opción
	 * @param Opcion objeto que contiene los datos modificados de una Opción, tipo Opcion.
	 */
	public void actualizar(Opcion opcion) throws GmdException{
		try {

			opcionDao.actualizar(opcion);

		} catch (Exception excepcion) {
			throw new GmdException(excepcion);
		}
	}
	/**
	* Metodo que lista las opciones por Usuario
	* @param Opcion objeto que contiene los datos de una Opción, tipo Opcion.
	*/
	public List<Opcion> listarOpcionesPorUsuario() throws GmdException{
		List<Opcion> lista = null;
		try {

			lista = opcionDao.listarOpcionesPorUsuario();

		} catch (Exception excepcion) {
			throw new GmdException(excepcion);
		}
		return lista;
	}
	/**
	* Metodo que obtiene el nombre del padre de una opcion
	* @param idPadre, identificador del padre la opcion, tipo String
	*/
	public String obtenerNombrePadre(String idPadre) throws GmdException{
		String nombrePadre ="";
		try {

			nombrePadre = opcionDao.obtenerNombrePadre(idPadre);

		} catch (Exception excepcion) {
			throw new GmdException(excepcion);
		}
		return nombrePadre;
	}
	/**
	* Metodo que obtiene el id de la opcion siguiente
	* @param Opcion, objeto que contiene los datos de la opcion, tipo Opcion
	*/
	@Override
	public String obtenerIdOpcionSgte(Opcion opcion) throws GmdException{
		String nodoSig="";
    	String nodoMax="";
    	
		try {
			int cantOpcion ;
			int nivel = opcion.getNivel();
			
			if(nivel == 0)
				{
				cantOpcion = opcionDao.obtenerCantOpcionNivelCero();
					if(cantOpcion<10){
						nodoSig= "10"+cantOpcion+"000000000000000000";
					}
					else
						
						nodoSig = "1"+cantOpcion+"000000000000000000";
				}
			else
			{
				cantOpcion = opcionDao.obtenerCantOpcion(opcion);
				if(cantOpcion == 0)
					   nodoMax = opcion.getIdPadre();
					else
						nodoMax = opcionDao.obtenerIdOpcionSgte(opcion);
					
		    		if (nodoMax == null  || nodoMax.equals("")){
		    			while (nodoSig.length() < 18)
		    				nodoSig = nodoSig.concat("000");
		    			nodoSig = "100".concat(nodoSig);
		    		}
		    		else{
		    			int nivel1 = opcion.getNivel()*3;
		    			String codNivel = nodoMax.substring(nivel1, nivel1+3);
		    			int nuevoCod = Integer.parseInt( codNivel ) +1;
		    			if(nuevoCod>999)
		    				return "0";
		    			else {
							if (nuevoCod > 9)
								codNivel = "0".concat(Integer.toString(nuevoCod));
							else
								codNivel = "00".concat(Integer.toString(nuevoCod));	
		    			}
		    			nodoSig = nodoMax.substring(0,nivel1).concat( codNivel)  ;
		    			int diferencia =nodoMax.length() - nodoSig.length();
		    			if(diferencia>0)
		    				nodoSig = nodoSig.concat(nodoMax.substring(nivel1+3, nodoMax.length()));
		    		}
			}
				

		}catch (Exception excepcion) {
			throw new GmdException(excepcion);
		}
		return nodoSig;
	}
	/**
	* Metodo que da de baja una opcion
	* @param Opcion, objeto que contiene los datos de la opcion, tipo Opcion
	*/
	@Override
	public void darBajaOpcion(Opcion opcion) throws GmdException{
		try {

			opcionDao.darBajaOpcion(opcion);


		} catch (Exception excepcion) {
			throw new GmdException(excepcion);
		}
	}
	/**
	* Metodo que obtiene el nivel del padre
	* @param idPadre, identificador del padre de una opcion, tipo String
	*/
	@Override
	public int obtenerNivelPadre(String idPadre) throws GmdException{
		int nivelPadre =0;
		try {
			nivelPadre = opcionDao.obtenerNivelPadre(idPadre);
		} catch (Exception excepcion) {
			throw new GmdException(excepcion);
		}
		return nivelPadre;
	}
	/**
	* Metodo que obtiene la cantidad de opciones de nivel 0
	*/
	@Override
	public int obtenerCantOpcionNivelCero() throws GmdException{
		int cantidad =0;
		try {
			cantidad = opcionDao.obtenerCantOpcionNivelCero();
		} catch (Exception excepcion) {
			throw new GmdException(excepcion);
		}
		return cantidad;
	}
	/**
	* Metodo que lista las opciones activas
	*/
	@Override
	public List<Opcion> listarOpcionesActivasPorUsuario() throws GmdException{
		List<Opcion> lista = null;
		try {
			lista = opcionDao.listarOpcionesActivasPorUsuario();

		} catch (Exception excepcion) {
			throw new GmdException(excepcion);
		}
		return lista;		
	}
   /**
    * Método que lista todas las opciones del sistema con el indicador seleccionado si el perfil lo tiene registrado
    * @param idPerfil identificador del perfil, tipo Opcion.
    */	
	@Override
    public List<Opcion> listarOpcionesSeleccionadasPorPerfil(Integer idPerfil) throws GmdException {
        List<Opcion> lista = null;
        try {
            lista = opcionDao.listarOpcionesSeleccionadasPorPerfil(idPerfil);
        } catch (Exception excepcion) {
            throw new GmdException(excepcion);
        }
        return lista;
    }

}
