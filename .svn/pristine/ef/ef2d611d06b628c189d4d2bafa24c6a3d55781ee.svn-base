package pe.com.sistemaera.core.dao;

import java.util.List;
import java.util.Map;

import pe.com.sistemaera.core.entity.Opcion;
import pe.com.sistemaera.core.entity.Perfil;

public interface PerfilDao {
	 /**
		* Metodo que realiza la insercion de un perfil
		* @param Perfil objeto que contiene los datos de un perfil.
		* @return esCorrecto resultado del registro, tipo boolean.
		*/
	    Perfil obtenerPerfil(int id);
	    
		/**
		* Metodo que realiza la insercion de un perfil
		* @param Perfil objeto que contiene los datos de un perfil.
		* @return esCorrecto resultado del registro, tipo boolean.
		*/
	    boolean insertar(Perfil perfil);
	   
	    /**
		* Metodo que realiza la confirmación de existencia de un perfil
		* @param nombre identificador para obtener la entidad, tipo String.
		*/ 
	    boolean actualizar(Perfil perfil);
	    
	    /**
		* Metodo que realiza la eliminación de un perfil
		* @param id identificador para obtener la entidad, tipo Integer.
		*/  
	    boolean eliminar(int id);
	    
	    /**
		* Metodo que realiza la confirmación de existencia de un perfil
		* @param nombre identificador para obtener la entidad, tipo String.
		*/ 
	    Integer existePerfilRegistrado(String nombre);
	    
	    boolean eliminarOpcionPerfil(Integer idPefil);
	    
	    boolean insertarOpcionPerfil(Map<String, Object> datosOpcionPerfil);
	    
	    List<Perfil> listarTodos();
	    
	    List<Perfil> listarTodosActivos();
	    
	    List<Map<String, Object>> listarComboPerfiles();
	    
	    List<Map<String, Object>> listarComboPerfilesNoAsignados(Integer idUsuario);
	    
	    List<Map<String, Object>> listarComboPerfilesAsignados(Integer idUsuario);
	    
	    List<Opcion> listarOpcionesPorPerfil(Integer id);

	    List<Perfil> listar(Map<String, Object> parametrosBusqueda);

		List<Map<String, Object>> reporteAsigPerfil(Map<String, Object> parametros);
		
//		List<UsuarioWS> reporteAsigPerfilWS(Map<String, Object> parametros);
}
