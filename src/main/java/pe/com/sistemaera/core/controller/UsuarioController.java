package pe.com.sistemaera.core.controller;

import static java.text.MessageFormat.format;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import pe.com.gmd.util.exception.GmdException;
import pe.com.gmd.util.exception.MensajeExceptionUtil;
import pe.com.sistemaera.core.bean.BRespuestaBean;
import pe.com.sistemaera.core.entity.Perfil;
import pe.com.sistemaera.core.entity.Usuario;
import pe.com.sistemaera.core.services.PerfilService;
import pe.com.sistemaera.core.services.UsuarioService;
import pe.com.sistemaera.core.util.ConstanteServices;
import pe.com.sistemaera.core.util.ConstantesParametros;
import pe.com.sistemaera.core.util.JsonUtil;
import pe.com.sistemaera.core.util.WebUtil;

@Controller
@RequestMapping(value="/seguridad/usuario")
public class UsuarioController {
    private static final Logger LOGGER = Logger.getLogger(UsuarioController.class);
    
    @Autowired
    private UsuarioService usuarioService;
        
    @Autowired
    private PerfilService perfilService;
    
    	
	@Autowired
	private GeneralController generalController;
	
	@RequestMapping(value="/cargarVentanaInicioUsuario", method = { RequestMethod.GET, RequestMethod.POST })
    public String cargarVentanaInicioUsuario(HttpServletRequest request, HttpServletResponse response, Model model){
		String flagInvocarMenu =  request.getParameter("flagInvocarMenu");
		model.addAttribute("flagInvocarMenu", !StringUtils.isEmpty(flagInvocarMenu) ? flagInvocarMenu : "");
       // webMessage.getMensaje("generales.insertar", "Usuario");        
        return "/seguridad/usuario/inicio";
    }

	@RequestMapping(value="/cargarVentanaAdministrarUsuario", method= { RequestMethod.GET, RequestMethod.POST })
	public String cargarVentanaAdministrarUsuario(HttpServletRequest request, Model model) throws GmdException{
		String mensaje = (String)request.getParameter("mensaje");
		String texto;
		model.addAttribute("mensaje",JsonUtil.convertirObjetoACadenaJson(mensaje));   
		String loginUsuario = null;
		
		model.addAttribute("listaPerfiles", JsonUtil.convertirObjetoACadenaJson(perfilService.listarTodosActivos()));
		model.addAttribute("listaTipoDocumento", JsonUtil.convertirObjetoACadenaJson(generalController.obtenerListaDetalleParametro(ConstantesParametros.NS_PARAMETRO_TIPO_DOCUMENTO_PERSONA)));
		model.addAttribute("mensaje",JsonUtil.convertirObjetoACadenaJson(mensaje)); 

		if(mensaje!=null)
		{
			mensaje=mensaje.trim();
			if(mensaje.equals(".")){             
				model.addAttribute("mensaje", JsonUtil.convertirObjetoACadenaJson("Se elimin&oacute el perfil con &eacutexito."));
			}else{
				String[] part = mensaje.split("-");
				mensaje = part[0];
				loginUsuario = part[1];
			}
			if(mensaje.equals("registrado") || mensaje.equals("actualizado") || mensaje.equals("contrasena"))
			{
				if (mensaje.equals("registrado")){
					texto="Se cre&oacute el usuario con c&oacutedigo de login: "+ loginUsuario;  
				}else if (mensaje.equals("actualizado")){
					texto="Se actualizo el usuario con c&oacutedigo de login: "+ loginUsuario;    
				}else{
					texto="Se actualizo la contrasen&ntildea del usuario con c&oacutedigo de login: "+ loginUsuario;    
				}
				model.addAttribute("mensaje",JsonUtil.convertirObjetoACadenaJson(texto));
			}
		}else{
			model.addAttribute("mensaje",JsonUtil.convertirObjetoACadenaJson(""));

		}     
		return "/seguridad/usuario/administrarUsuario";
	}
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value="/accionEliminarUsuario")
	public @ResponseBody String accionEliminarUsuario(HttpServletRequest request, Model model){
		String listaUsuarios = null;
		try{
			Integer idUsuario = Integer.parseInt((request.getParameter("idUsuario")));
			usuarioService.eliminarUsuario(idUsuario);            
			Map<String, Object> parametrosBusqueda = JsonUtil.convertirCadenaJsonAObjetoRequest(request.getParameter("parametrosBusqueda"), HashMap.class);
			listaUsuarios = JsonUtil.convertirObjetoACadenaJson(usuarioService.listarUsuariosPorParametrosBusqueda(parametrosBusqueda));
		}catch(Exception excepcion){
		}
		return listaUsuarios;
	}
	
    @SuppressWarnings("unchecked")
    @RequestMapping(value="/accionBuscarUsuario", method=RequestMethod.POST)
    public @ResponseBody String accionBuscarUsuario(HttpServletRequest request) throws GmdException{
        Map<String, Object> parametrosBusqueda = JsonUtil.convertirCadenaJsonAObjetoRequest(request.getParameter("parametrosBusqueda"), HashMap.class);
        String CadenaJson=null;
        try {
            CadenaJson=JsonUtil.convertirObjetoACadenaJson(usuarioService.listarUsuariosPorParametrosBusqueda(parametrosBusqueda));
        } catch (Exception exception) {
			String[] error = MensajeExceptionUtil.obtenerMensajeError(exception);
			LOGGER.error(error[1], exception);
            throw new GmdException(exception);
        }
       
        return CadenaJson;
    }
    
    @RequestMapping(value="/cargarVentanaCambiarContrasena", method = { RequestMethod.GET, RequestMethod.POST })
    public String cargarVentanaCambiarContrasena(HttpServletRequest request, Model model) throws GmdException{

    	Usuario usuarioEntidad = null;
    	Usuario usuarioLogin = new Usuario();
    	
    	try {
    		/** Si viene de la Administración de usuarios */
    		if (request.getParameter("idUsuario")!=null){
    			Integer idUsuario = Integer.parseInt((request.getParameter("idUsuario")));
    			usuarioEntidad = usuarioService.obtenerUsuariobyidUsuario(idUsuario);
    			model.addAttribute("origen", "adm");
    		}
    		else {
    			/** Si viene del menú de opciones */   
    			usuarioLogin = (Usuario)request.getSession().getAttribute("usuarioBean");
    			usuarioEntidad = usuarioService.obtenerUsuariobyidUsuario(usuarioLogin.getIdUsuario());
    			model.addAttribute("origen", "menu");
    		}

    		model.addAttribute("usuario", usuarioEntidad); 
    	} catch (Exception exception) {
    		throw new  GmdException(exception);
    	}

    	return "/seguridad/usuario/cambiarContrasena";
    }
    
    @RequestMapping(value="/accionCambiarContrasena", method = RequestMethod.POST)
    public @ResponseBody String accionCambiarContrasena(HttpServletRequest request, Model model)throws GmdException{
    	BRespuestaBean respuestaBean = new BRespuestaBean();
    	String mensajeError = "";
        String contrasenaNueva = request.getParameter("contrasenaNueva");
        Integer idUsuario = Integer.parseInt(request.getParameter("idUsuario"));
        try {
        	
        	Map<String, Object> map = new HashMap<String, Object>();
        	map.put("password", contrasenaNueva);
        	map.put("idUsuario", idUsuario);
        	map.put("idUsuarioModificacion", WebUtil.obtenerLoginUsuario());
        	map.put("terminalModificacion", WebUtil.obtenerTerminal(request));        	
            usuarioService.modificarContrasena(map); 
            respuestaBean.setEstadoRespuesta(ConstanteServices.OK);
        } catch (Exception exception) {
        	String[] error = MensajeExceptionUtil.obtenerMensajeError(exception);
            mensajeError = format(ConstanteServices.MENSAJE_ERROR, error[0]);
            respuestaBean.setMensajeRespuesta(mensajeError);
            LOGGER.error(error[1], exception);
        }
        
        return JsonUtil.convertirObjetoACadenaJson(respuestaBean);
    }
    
    @RequestMapping(value="/cargarVentanaRegistrarUsuario", method=RequestMethod.GET)
    public String cargarVentanaRegistrarUsuario(HttpServletRequest request, Model model) throws GmdException{
        BRespuestaBean respuestaBean = new BRespuestaBean();
        String mensajeError ="";
        try{
            Map<String, Object> parametro = new HashMap<String, Object>();
            parametro.put("stRegi",ConstanteServices.IND_ESTADO_REGISTRO_ACTIVO);
            model.addAttribute("listaTipoDocumento", JsonUtil.convertirObjetoACadenaJson(generalController.obtenerListaDetalleParametro(ConstantesParametros.NS_PARAMETRO_TIPO_DOCUMENTO_PERSONA)));
    		model.addAttribute("listaPerfiles", JsonUtil.convertirObjetoACadenaJson(perfilService.listarTodosActivos()));
    		
        }catch(Exception excepcion){
            String[] error = MensajeExceptionUtil.obtenerMensajeError(excepcion);
            mensajeError = format(ConstanteServices.MENSAJE_ERROR, error[0]);
            respuestaBean.setMensajeRespuesta(mensajeError);
            model.addAttribute("respuesta", respuestaBean);
            LOGGER.error(error[1], excepcion);
        }
        return "/seguridad/usuario/registrar";
    }
    
    @RequestMapping(value="/accionRegistrarUsuario", method=RequestMethod.POST)
    public @ResponseBody String accionRegistrarUsuario(HttpServletRequest request) throws GmdException{
        BRespuestaBean respuestaBean = new BRespuestaBean();
        String mensajeError ="";
        try {
            Usuario usuario = JsonUtil.convertirCadenaJsonAObjetoRequest(request.getParameter("usuario"), Usuario.class);
	        if(usuario.getEstadoRegistro() != null){
	            if(usuario.getEstadoRegistro().equals("Activo")){
	            	usuario.setEstadoRegistro(ConstantesParametros.ST_REGI_ACTIVO);
	            } else if(usuario.getEstadoRegistro().equals("Inactivo")){
	            	usuario.setEstadoRegistro(ConstantesParametros.ST_REGI_INACTIVO);
	            }
	        }
            if(usuario.getIdUsuario() == null){
                boolean existeLogin = usuarioService.existeNombreLoginRegistrado(usuario.getLogin());
                if(!existeLogin){                	
                    usuario.setIdUsuaCrea(WebUtil.obtenerLoginUsuario());
                    usuario.setDeTermCrea(WebUtil.obtenerTerminal(request));
                    usuarioService.insertar(usuario);
                    respuestaBean.setEstadoRespuesta(ConstanteServices.OK);
                 }else{
                     respuestaBean.setEstadoRespuesta(ConstanteServices.ERROR);
                     respuestaBean.setMensajeRespuesta("Ya esiste usuario con el mismo c&oacutedigo de login");
                 }
             }else{            	 
                 usuario.setIdUsuaModi(WebUtil.obtenerLoginUsuario());
                 usuario.setDeTermModi(WebUtil.obtenerTerminal(request));
                 usuario.setStRegi(ConstanteServices.IND_ESTADO_REGISTRO_ACTIVO);
                 usuarioService.actualizar(usuario);
                 respuestaBean.setEstadoRespuesta(ConstanteServices.OK);
             }
             return JsonUtil.convertirObjetoACadenaJson(respuestaBean); 
        } catch (Exception exception) {
            String[] error = MensajeExceptionUtil.obtenerMensajeError(exception);
            mensajeError = format(ConstanteServices.MENSAJE_ERROR, error[0]);
            respuestaBean.setMensajeRespuesta(mensajeError);
            LOGGER.error(error[1], exception);
            return JsonUtil.convertirObjetoACadenaJson(respuestaBean);
        }
    }
    
    
    @RequestMapping(value="/cargarVentanaActualizarUsuario", method=RequestMethod.POST)
    public String cargarVentanaActualizarUsuario(HttpServletRequest request, Model model) throws GmdException{
        Integer idUsuario = request.getParameter("idUsuario")==null?null:(Integer.valueOf((String)request.getParameter("idUsuario")));
        try {
            Map<String, Object> parametro = new HashMap<String, Object>(); 
            parametro.put("stRegi",ConstanteServices.IND_ESTADO_REGISTRO_ACTIVO);
            Usuario usuarioEntidad = usuarioService.obtenerUsuariobyidUsuario(Integer.parseInt(String.valueOf(idUsuario)));
            
            model.addAttribute("listaTipoDocumentos", JsonUtil.convertirObjetoACadenaJson(generalController.obtenerListaDetalleParametro(ConstantesParametros.NS_PARAMETRO_TIPO_DOCUMENTO_PERSONA)));
            model.addAttribute("listaPerfiles", JsonUtil.convertirObjetoACadenaJson(perfilService.listarTodosActivos()));
            model.addAttribute("usuario", usuarioEntidad);    
        } catch (Exception exception) {
            throw new GmdException(exception);
        }
        
        return "/seguridad/usuario/actualizar";
    }
}
