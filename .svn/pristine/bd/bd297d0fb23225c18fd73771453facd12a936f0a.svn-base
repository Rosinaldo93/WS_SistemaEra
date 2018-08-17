package pe.com.sistemaera.core.controller;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.apache.commons.codec.binary.Base64;

import org.apache.log4j.Logger;
import pe.com.gmd.util.exception.GmdException;
import pe.com.sistemaera.core.bean.BOpcionBean;
import pe.com.sistemaera.core.bean.BRespuestaBean;
import pe.com.sistemaera.core.bean.BUsuarioBean;
import pe.com.sistemaera.core.entity.Opcion;
import pe.com.sistemaera.core.entity.Perfil;
import pe.com.sistemaera.core.entity.Usuario;
import pe.com.sistemaera.core.services.PerfilService;
import pe.com.sistemaera.core.services.UsuarioService;
import pe.com.sistemaera.core.util.ConstanteServices;
import pe.com.sistemaera.core.util.JsonUtil;
import pe.com.sistemaera.core.util.WebUtil;

@Controller
public class LoginController {
	
	private static final Logger LOGGER = Logger.getLogger(LoginController.class);
	
	
	@Autowired
    private BUsuarioBean usuarioBean;
	
	@Autowired
	private UsuarioService usuarioService;
	
	@Autowired
	private PerfilService perfilService;
	
	
	@RequestMapping(value="/cargarVentanaInicioSesion")
    public String cargarVentanaInicioSesion(HttpServletRequest request, Model model) throws GmdException{
        String mensaje = request.getParameter("mensaje")==null?"":request.getParameter("mensaje");
        model.addAttribute("mensaje", mensaje);
        //List<Perfil> lista = perfilService.listarTodos();
		return "login";
    }
	
	@RequestMapping(value="/accionCerrarSesion", method=RequestMethod.GET)
    public String accionCerrarSesion(HttpServletRequest request)throws GmdException{ 
		request.getSession().invalidate();
		request.getSession().isNew();
        return "login";
    }
	
	@RequestMapping(value="/login")
    public String cargarVentanaLogin(HttpServletRequest request, Model model) throws GmdException{
        String mensaje = request.getParameter("mensaje")==null?"":request.getParameter("mensaje");
        model.addAttribute("mensaje", mensaje);
        //List<Perfil> lista = perfilService.listarTodos();
		return "login";
    }
	
	@SuppressWarnings("deprecation")
	@RequestMapping(value="/autenticarUsuario", method=RequestMethod.POST)
    public @ResponseBody String autenticarUsuario(HttpServletRequest request, Model model) throws GmdException{
        BRespuestaBean beanRespuesta = new BRespuestaBean();
        Usuario objUsuario = new Usuario();
        Usuario entidadUsuarioPantalla = JsonUtil.convertirCadenaJsonAObjetoRequest(request.getParameter("usuario"), Usuario.class);
        objUsuario.setLogin(entidadUsuarioPantalla.getLogin());
        objUsuario.setStRegi(ConstanteServices.IND_ESTADO_REGISTRO_ACTIVO);
        Usuario entidadUsuarioBaseDatos = usuarioService.obtenerLoginUsuario(objUsuario);

        String contrasena=null;      
        Map<String,Object> parametros=new HashMap<String,Object>();
        try{	        
	        if(entidadUsuarioBaseDatos!=null){
	            contrasena = entidadUsuarioBaseDatos.getPassword();
	        }
            
	        if(entidadUsuarioPantalla.getPassword().equals(contrasena)){
		                beanRespuesta.setMensajeRespuesta(null);
                        beanRespuesta.setEstadoRespuesta(ConstanteServices.OK);
                        WebUtil.setSessionAttribute(request, "usuarioBean", entidadUsuarioBaseDatos);
                        request.getSession().removeAttribute("cantidadSesionesFallidas");
	        	
           }else{
	            Integer cantidadSesionesFallidas = request.getSession().getAttribute("cantidadSesionesFallidas")==null?0:(Integer)request.getSession().getAttribute("cantidadSesionesFallidas");
	            request.getSession().setAttribute("cantidadSesionesFallidas", ++cantidadSesionesFallidas);
	            parametros.put("cantidadSesionesFallidas", cantidadSesionesFallidas);
	            beanRespuesta.setEstadoRespuesta(ConstanteServices.LOGIN_CODIGO_ERROR);
	            beanRespuesta.setMensajeRespuesta(ConstanteServices.LOGIN_MENSAJE_ERROR);
	            beanRespuesta.setParametros(parametros);
           }
        }catch(Exception exception){
        	LOGGER.info("ERROR : "+ exception.getMessage());
            Integer cantidadSesionesFallidas = request.getSession().getAttribute("cantidadSesionesFallidas")==null?0:(Integer)request.getSession().getAttribute("cantidadSesionesFallidas");
            request.getSession().setAttribute("cantidadSesionesFallidas", ++cantidadSesionesFallidas);
            parametros.put("cantidadSesionesFallidas", cantidadSesionesFallidas);
            beanRespuesta.setEstadoRespuesta(ConstanteServices.LOGIN_CODIGO_ERROR);
            beanRespuesta.setMensajeRespuesta(ConstanteServices.LOGIN_MENSAJE_ERROR);
            beanRespuesta.setParametros(parametros);
        }
        return JsonUtil.convertirObjetoACadenaJson(beanRespuesta);
    }
	
	@RequestMapping(value="/inicioUsuario")
    public String inicioUsuario(HttpServletRequest request, Model model) throws GmdException{ 
        return "seguridad/usuario/inicio";
    }
	
	
	@RequestMapping(value="/cargarVentanaInicio")
    public String cargarVentanaInicio(HttpServletRequest request, Model model)throws GmdException{
        String login = ((Usuario)request.getSession().getAttribute("usuarioBean")).getLogin();
        String paginaRetorno = null;
        
        try {        	
             List<Perfil> listaPerfil = usuarioService.listarPerfilesPorLoginUsuario(login);
             if(listaPerfil.size() > 0){
         		 WebUtil.setSessionAttribute(request, "perfilBean", listaPerfil.get(0));            	 
                 cargarOpcionesMenu(request, listaPerfil.get(0).getIdPerfil());
                 paginaRetorno = "seguridad/usuario/inicio";
             }else{
                 paginaRetorno = "seguridad/usuario/sinPerfil";
             }  
        } catch (Exception exception) {
            throw new GmdException(exception);
        }
       
        return paginaRetorno;
    }
	
	
	 private void cargarOpcionesMenu(HttpServletRequest request, Integer idPerfil)throws GmdException{
	        try {
	            List<Opcion> listaOpciones = usuarioService.listarOpcionesPorPerfil(idPerfil);
	            request.getSession().setAttribute("listaOpciones", JsonUtil.convertirObjetoACadenaJson(listaOpciones));
	            
	            BOpcionBean opcionBean = null;
	            usuarioBean.setListaOpciones(new ArrayList<BOpcionBean>());
	            for (Opcion opcion : listaOpciones) {
	                opcionBean = new BOpcionBean();
	                opcionBean.setNombre(opcion.getNombreOpcion());
	                opcionBean.setAccion(opcion.getValorAccion());
	                opcionBean.setNivel(opcion.getNivel());
	                opcionBean.setCodigoOpcion(opcion.getIdOpcion());
	                opcionBean.setCodigoOpcionPadre(opcion.getIdPadre());
	                opcionBean.setTipoOpcion(opcion.getTipoOpcion());
	                opcionBean.setRutaCompleta(obtenerRutaCompleta(opcion));
	                usuarioBean.getListaOpciones().add(opcionBean);
	            }
	            request.getSession().setAttribute("listaOpciones", JsonUtil.convertirObjetoACadenaJson(usuarioBean.getListaOpciones()));
	            request.getSession().setAttribute("menuHtml", this.generarMenu(request.getContextPath(),usuarioBean.getListaOpciones()));
	            request.getSession().setAttribute("idPerfil", idPerfil);
	        } catch (Exception exception) {
	          throw new GmdException(exception);
	        }
	        
	    }
	 private String generarMenu(String contextoWeb,List<BOpcionBean> listaOpciones){
	        List<BOpcionBean> nuevaListaOpciones = new ArrayList<BOpcionBean>();
	        BOpcionBean opcionPadre = null;
	        for(int indice=0; indice < listaOpciones.size(); indice++){
	        	BOpcionBean opcionBean = listaOpciones.get(indice);
	            if(opcionBean.getTipoOpcion().intValue() == ConstanteServices.ID_TIPO_PAGINA.intValue()){
	                if(opcionBean.getNivel().intValue()==0){
	                    nuevaListaOpciones.add(opcionBean);
	                    opcionPadre = opcionBean;
	                }else {
	                    if(opcionPadre!=null){
	                        if(!opcionPadre.getCodigoOpcion().equals(opcionBean.getCodigoOpcion())){
	                            opcionPadre = obtenerPadre(opcionBean.getCodigoOpcionPadre(), listaOpciones);	                        	
	                        }
	                        if(opcionPadre != null && opcionPadre.getListaOpciones()==null ){
	                        	 opcionPadre.setListaOpciones(new ArrayList<BOpcionBean>());
	                        }	      
	                        if(opcionPadre != null){
	                        	opcionPadre.getListaOpciones().add(opcionBean);
	                        }
	                    }
	                }
	            }
	        }
	        StringBuffer menuHTML = new StringBuffer();
	        for (BOpcionBean opcionBean : nuevaListaOpciones) {
	            menuHTML.append("<li class='nav-01'>");
	            menuHTML.append("<span class='list-collapse'>" + opcionBean.getNombre() + " <i class='ico-collapse'></i></span>");
	            if(opcionBean.getListaOpciones()!=null && opcionBean.getListaOpciones().size()>0){
	                menuHTML.append("<ul class='nav-collapse'>");
	                for (BOpcionBean subMenu : opcionBean.getListaOpciones()) {
	                    menuHTML.append("<li class='nav-02'>");
	                    if(subMenu.getListaOpciones()!=null && opcionBean.getListaOpciones().size() > 0 ){
	                        menuHTML.append("<a href='#' class>" + subMenu.getNombre() + "</a>");
	                        menuHTML.append("<ul class='nav-collapse-sub'>");
	                        for(BOpcionBean subMenu2: subMenu.getListaOpciones()){
	                            menuHTML.append("<li class='nav-03'><a href='" + contextoWeb + subMenu2.getAccion() + "' class='nav-ajx'>" + subMenu2.getNombre() + "</a></li>");
	                        }
	                        menuHTML.append("</ul>");
	                    }else{
	                        menuHTML.append("<a href='" + contextoWeb + subMenu.getAccion() + "' onclick='optionClick(\"" + subMenu.getRutaCompleta() + "\")'>" + subMenu.getNombre() + "</a>");
	                    }
	                    menuHTML.append("</li>");
	                }
	                menuHTML.append("</ul>");
	            }
	            menuHTML.append("</li>");
	        }
	        return menuHTML.toString();
	    }
	    
	    public BOpcionBean obtenerPadre(String codigo, List<BOpcionBean> lista){
	        for (BOpcionBean opcionBean : lista) {
	            if(opcionBean.getCodigoOpcion().equals(codigo)){
	                return opcionBean;
	            }
	        }
	        return null;
	    }
	 private String obtenerRutaCompleta(Opcion opcion){
	    	
	    	String rutaCompleta = opcion.getNombreOpcion();
	    	Opcion test = opcion.getOpcionPadre();
	    	
	    	while(test != null){
	    		rutaCompleta = test.getNombreOpcion() + "\\" + rutaCompleta;
	    		test = opcion.getOpcionPadre();
	    	}
	    	
	    	return rutaCompleta;
	    }
}
