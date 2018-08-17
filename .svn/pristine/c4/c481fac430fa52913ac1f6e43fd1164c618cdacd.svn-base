/**
 * Resumen.
 * Objeto 			   : PerfilServiceImpl.java.
 * Descripción 		   : Clase que implementa los métodos de la clase PerfilService.
 * Fecha de Creación   : 04/04/2017.
 * PE de Creación 	   : 
 * Autor 			   : Jimy Monja
 * --------------------------------------------------------------------------------------------------------------
 * Modificaciones
 * Motivo			Fecha			Nombre			Descripción
 * --------------------------------------------------------------------------------------------------------------
 * 
 */
package pe.com.sistemaera.core.services.impl;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import pe.com.gmd.util.exception.GmdException;
import pe.com.sistemaera.core.dao.PerfilDao;
import pe.com.sistemaera.core.entity.Opcion;
import pe.com.sistemaera.core.entity.Perfil;
import pe.com.sistemaera.core.services.PerfilService;

/**
 * Clase que implementa los métodos de la clase PerfilService.
 */
@Service
public class PerfilServiceImpl implements PerfilService {

	@Autowired
	PerfilDao perfilDao;

	public List<Map<String, Object>> listarComboPerfiles() {
		return perfilDao.listarComboPerfiles();
	}

	public List<Map<String, Object>> listarComboPerfilesNoAsignados(
			Integer idUsuario) {
		return perfilDao.listarComboPerfilesNoAsignados(idUsuario);
	}

	public List<Map<String, Object>> listarComboPerfilesAsignados(
			Integer idUsuario) {
		return perfilDao.listarComboPerfilesAsignados(idUsuario);
	}

	/**
	 * Metodo que obtiene un perfil
	 * @param id identificador para obtener la entidad, tipo Integer
	 * @return Objeto Perfil, tipo Perfil.
	 */
	@Override
	public Perfil obtenerPerfil(int id) throws GmdException {
		Perfil perfil = new Perfil();
		try {
			perfil = perfilDao.obtenerPerfil(id);
		} catch (Exception excepcion) {
			throw new GmdException(excepcion);
		}
		return perfil;
	}

	/**
	 * Metodo que realiza la insercion de un Perfil
	 * @param Perfil objeto que contiene los datos de un Perfil, tipo Perfil.
	 * @return esCorrecto resultado del registro, tipo boolean.
	 */
	@Override
	@Transactional
	public boolean insertar(Perfil perfil) throws GmdException{
		boolean esCorrecto = true;
		try {
			perfilDao.insertar(perfil);
			perfilDao.eliminarOpcionPerfil(perfil.getIdPerfil());
			for (Integer idOpcion : perfil.getOpciones()) {
				Map<String, Object> datosOpcionPerfil = new HashMap<String, Object>();
				datosOpcionPerfil.put("idPerfil", perfil.getIdPerfil());
				datosOpcionPerfil.put("idOpcion", idOpcion);
				//
				datosOpcionPerfil.put("idUsuarioCreacion", perfil.getIdUsuaCrea());
				datosOpcionPerfil.put("fechaUsuarioCreacion", perfil.getFeUsuaCrea());
				datosOpcionPerfil.put("terminalCreacion", perfil.getDeTermCrea());
				datosOpcionPerfil.put("estadoRegistro", perfil.getEstadoRegistro());
				perfilDao.insertarOpcionPerfil(datosOpcionPerfil);
			}
		} catch (Exception excepcion) {
			esCorrecto = false;
			throw new GmdException(excepcion);
		}
		return esCorrecto;
	}

	@Override
	public List<Perfil> listar(Map<String, Object> parametrosBusqueda) throws GmdException{
		List<Perfil> listaPerfil = null;
		try {
			listaPerfil = perfilDao.listar(parametrosBusqueda);
		} catch (Exception excepcion) {
			throw new GmdException(excepcion);
		}
		return listaPerfil;
	}

	/**
	 * Metodo que realiza la actualización de un Perfil
	 * @param Perfil objeto que contiene los datos de un Perfil, tipo Perfil.
	 * @return esCorrecto resultado de la actualización, tipo boolean.
	 */
	public boolean actualizar(Perfil perfil) throws GmdException{
		boolean esCorrecto = true;
		try {
			perfilDao.actualizar(perfil);
			int idPerfil = perfil.getIdPerfil();
			perfilDao.eliminarOpcionPerfil(idPerfil);
			for (Integer idOpcion : perfil.getOpciones()) {
				Map<String, Object> datosOpcionPerfil = new HashMap<String, Object>();
				datosOpcionPerfil.put("idPerfil", idPerfil);
				datosOpcionPerfil.put("idOpcion", idOpcion);
				//
				datosOpcionPerfil.put("idUsuarioCreacion", perfil.getIdUsuaModi());
				datosOpcionPerfil.put("terminalCreacion", perfil.getDeTermModi());
				datosOpcionPerfil.put("estadoRegistro", 'A');
				perfilDao.insertarOpcionPerfil(datosOpcionPerfil);
			}
		} catch (Exception excepcion) {
			esCorrecto = false;
			throw new GmdException(excepcion);
		}
		return esCorrecto;
	}

	@Override
	public List<Perfil> listarTodos() {
		return perfilDao.listarTodos();
	}
	
	@Override
	public List<Perfil> listarTodosActivos() {
		return perfilDao.listarTodosActivos();
	}
	

	/**
	 * Metodo que elimina un perfil
	 * @param id identificador para obtener la entidad, tipo Integer
	 * @return Objeto Perfil, tipo Perfil.
	 */
	@Override
	public boolean eliminar(int idPerfil) throws GmdException{
		boolean esCorrecto = true;
		try {
			perfilDao.eliminar(idPerfil);

		} catch (Exception excepcion) {
			esCorrecto = false;
			throw new GmdException(excepcion);
		}
		return esCorrecto;
	}

	/**
	 * Metodo que confirma la existencia de un perfil
	 * @param nombre identificador para obtener la entidad, tipo String
	 * @return Objeto Perfil, tipo Perfil.
	 */
	public boolean existePerfilRegistrado(String nombre) {
		boolean resultado = false;
		Integer idPerfil = perfilDao.existePerfilRegistrado(nombre);
		if (idPerfil != null && idPerfil == 1) {
			resultado = true;
		}
		return resultado;
	}

	public List<Opcion> listarOpcionesPorPerfil(Integer id) throws GmdException{
		try {
			return perfilDao.listarOpcionesPorPerfil(id);
		} catch (Exception excepcion) {
			throw new GmdException(excepcion);
		}
		
	}

	@Override
	public List<Map<String, Object>> reporteAsigPerfil(
			Map<String, Object> parametros) {
		// TODO Auto-generated method stub
		return perfilDao.reporteAsigPerfil(parametros);
	}

//    @Override
//    public List<UsuarioWS> reporteAsigPerfilWS(Map<String, Object> parametros) {
//        return perfilDao.reporteAsigPerfilWS(parametros);
//    }
	
	

}
