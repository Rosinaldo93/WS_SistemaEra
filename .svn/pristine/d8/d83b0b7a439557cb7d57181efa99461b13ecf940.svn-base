/**
 * Resumen.
 * Objeto 			   : OpcionService.java.
 * Descripción 		   : Interfaz del Servicio la clase Opcion.
 * Fecha de Creación   : 31/03/2017.
 * PE de Creación 	   : 
 * Autor 			   : Jimy Monja.
 * --------------------------------------------------------------------------------------------------------------
 * Modificaciones
 * Motivo			Fecha			Nombre			Descripción
 * --------------------------------------------------------------------------------------------------------------
 * 
 */
package pe.com.sistemaera.core.services;

import java.util.List;

import pe.com.gmd.util.exception.GmdException;
import pe.com.sistemaera.core.entity.Opcion;
import pe.com.sistemaera.core.services.base.BaseService;

/**
 * Interfaz del Servicio la clase Opcion.
 */
public interface OpcionService extends BaseService<Opcion, Integer>{

	/**
	* Metodo que realiza la insercion de una opción
	* @param Opcion objeto que contiene los datos de una Opción, tipo Opcion.
	* @return esCorrecto resultado del registro, tipo boolean.
	*/
	boolean insertarOpcion(Opcion opcion) throws GmdException;
	
	/**
	* Metodo que obtiene una opción
	* @param idOpcion identificador para obtener la entidad, tipo Integer
	* @return Objeto Opcion, tipo Opcion.
	*/
	Opcion obtener(String idOpcion) throws GmdException;
	
	/**
	* Metodo que realiza la actualización de una opción
	* @param Opcion objeto que contiene los datos modificados de una Opción, tipo Opcion.
	*/
	void actualizar(Opcion opcion) throws GmdException;
	/**
	* Metodo que lista las opciones por Usuario
	* @param Opcion objeto que contiene los datos de una Opción, tipo Opcion.
	*/
	List<Opcion> listarOpcionesPorUsuario() throws GmdException;
	/**
	* Metodo que lista las opciones activas
	*/
	List<Opcion> listarOpcionesActivasPorUsuario() throws GmdException;
   /**
    * Método que lista todas las opciones del sistema con el indicador seleccionado si el perfil lo tiene registrado
    * @param idPerfil identificador del perfil, tipo Opcion.
    */
	List<Opcion> listarOpcionesSeleccionadasPorPerfil(Integer idPerfil) throws GmdException;
	/**
	* Metodo que obtiene el nombre del padre de una opcion
	* @param idPadre, identificador del padre la opcion, tipo String
	*/
	String obtenerNombrePadre(String idPadre) throws GmdException;
	/**
	* Metodo que obtiene el id de la opcion siguiente
	* @param Opcion, objeto que contiene los datos de la opcion, tipo Opcion
	*/
	String obtenerIdOpcionSgte(Opcion opcion) throws GmdException;
	/**
	* Metodo que da de baja una opcion
	* @param Opcion, objeto que contiene los datos de la opcion, tipo Opcion
	*/
	void darBajaOpcion(Opcion opcion) throws GmdException;
	/**
	* Metodo que obtiene el nivel del padre
	* @param idPadre, identificador del padre de una opcion, tipo String
	*/
	int obtenerNivelPadre(String idPadre) throws GmdException;
	/**
	* Metodo que obtiene la cantidad de opciones de nivel 0
	*/
	int obtenerCantOpcionNivelCero() throws GmdException;

}
