package pe.com.sistemaera.core.services;

import java.util.List;
import java.util.Map;


import pe.com.gmd.util.exception.GmdException;
import pe.com.sistemaera.core.entity.Opcion;
import pe.com.sistemaera.core.entity.Perfil;
import pe.com.sistemaera.core.entity.Usuario;
import pe.com.sistemaera.core.services.base.BaseService;


public interface UsuarioService extends BaseService<Usuario, Long> {
	 /**
     * Descripcion	metodo listarTodos
     * @return		List<Usuario>
     * @throws 		GmdException
     */
    List<Usuario> listarTodos() throws GmdException;
    /**
     * Descripcion	metodo listarUsuariosPorParametrosBusqueda
     * @param 		parametrosBusqueda
     * @return		List<Usuario>
     * @throws 		GmdException
     */
    List<Usuario> listarUsuariosPorParametrosBusqueda(Map<String, Object> parametrosBusqueda) throws GmdException;
    /**
     * Descripcion	metodo obtenerLoginUsuario
     * @param 		login
     * @return		objeto Usuario
     * @throws 		GmdException
     */
    Usuario obtenerLoginUsuario(Usuario objUsuario) throws GmdException;
    /**
     * Descripcion	metodo insertar
     * @param 		usuario
     * @throws 		GmdException
     */
    void insertar(Usuario usuario) throws GmdException;
    
    
    void eliminarUsuario(Integer idUsuario) throws GmdException;
    
    /**
     * Descripcion	metodo actualizar
     * @param 		usuario
     * @throws 		GmdException
     */
    void actualizar(Usuario usuario) throws GmdException;
    /**
     * Descripcion	metodo listarParametros
     * @param 		parametrosBusqueda
     * @return		List<Usuario>
     * @throws 		GmdException
     */
    List<Usuario> listarParametros(Map<String, Object> parametrosBusqueda) throws GmdException;
    
    List<Opcion> listarOpcionesPorPerfil(Integer idPerfil) throws GmdException;
    
    List<Perfil> listarPerfilesPorLoginUsuario(String login) throws GmdException;
    
    boolean existeNombreLoginRegistrado(String login) throws GmdException;
    
    boolean modificarContrasena(Map<String, Object> map) throws GmdException;
    
    List<Usuario> buscarComboUsuario(Usuario usuario) throws GmdException;
       
    Integer validarUsuarioId(int idUsuario) throws GmdException;
    
    Usuario obtenerUsuariobyidUsuario(Integer idUsuario) throws GmdException;
    
}
