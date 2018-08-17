/**
 * Resumen.
 * Objeto 			   : PerfilService.java.
 * Descripción 		   : Interfaz del Servicio la clase Perfil.
 * Fecha de Creación   : 04/04/2017.
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
import java.util.Map;

import pe.com.gmd.util.exception.GmdException;
import pe.com.sistemaera.core.entity.Opcion;
import pe.com.sistemaera.core.entity.Perfil;

/**
 * Interfaz del Servicio la clase Perfil.
 */
public interface PerfilService {
   
	/**
	* Metodo que obtiene un Perfil
	* @param id identificador para obtener la entidad, tipo Integer
	* @return Objeto Perfil, tipo Perfil.
	*/
	Perfil obtenerPerfil(int id) throws GmdException;
	
	/**
	* Metodo que realiza la insercion de un perfil
	* @param Perfil objeto que contiene los datos de un perfil.
	* @return esCorrecto resultado del registro, tipo boolean.
	*/
    boolean insertar(Perfil perfil) throws GmdException;

    /**
	* Metodo que realiza la eliminación de un perfil
	* @param id identificador para obtener la entidad, tipo Integer.
	*/  
    boolean eliminar(int id) throws GmdException;
    
    /**
	* Metodo que realiza la actualización de un perfil
	* @param Perfil objeto que contiene los datos modificados de un Perfil, tipo Perfil.
	*/
    boolean actualizar(Perfil perfil) throws GmdException;
 
    /**
	* Metodo que realiza la confirmación de existencia de un perfil
	* @param nombre identificador para obtener la entidad, tipo String.
	*/ 
    boolean existePerfilRegistrado(String nombre) throws GmdException;
    
    List<Opcion> listarOpcionesPorPerfil(Integer id) throws GmdException; 
    
    List<Map<String, Object>> listarComboPerfiles() throws GmdException;
    
    List<Map<String, Object>> listarComboPerfilesNoAsignados(Integer idUsuario) throws GmdException;
        
    List<Perfil> listar(Map<String, Object> parametrosBusqueda) throws GmdException;
  
    List<Perfil> listarTodos() throws GmdException;
    
    List<Perfil> listarTodosActivos() throws GmdException;

    List<Map<String, Object>> listarComboPerfilesAsignados(Integer idUsuario) throws GmdException;

	List<Map<String, Object>> reporteAsigPerfil(Map<String, Object> parametros);

//	List<UsuarioWS> reporteAsigPerfilWS(Map<String, Object> parametros);
	
    
}

