package pe.com.sistemaera.core.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import static java.text.MessageFormat.format;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import pe.com.gmd.util.exception.GmdException;
import pe.com.gmd.util.exception.MensajeExceptionUtil;
import pe.com.sistemaera.core.bean.BRespuestaBean;
import pe.com.sistemaera.core.entity.Opcion;
import pe.com.sistemaera.core.services.OpcionService;
import pe.com.sistemaera.core.util.ConstanteServices;
import pe.com.sistemaera.core.util.JsonUtil;
import pe.com.sistemaera.core.util.WebUtil;

@Controller
@RequestMapping(value = "/seguridad/opcion")
public class OpcionController {
	
	private static final Logger LOGGER = Logger.getLogger(OpcionController.class);
	Date date =  new Date();
	@Autowired
	private OpcionService opcionService;
	
	@Autowired
	private GeneralController generalController;
	
	public OpcionController() {
	
	}
	
	/**
	 * Metodo que realiza la carga de la bandeja de administración de opciones
	 */
	@RequestMapping(value = "/cargarVentanaAdministrarOpcion")
	public String cargarVentanaAdministrarOpcion(Model model) throws GmdException{
		List<Opcion> lista = opcionService.listarOpcionesPorUsuario();

		model.addAttribute("listaTipoOpcion", JsonUtil.convertirObjetoACadenaJson(generalController.obtenerListaTipoOpcion())); //genericoService.cargarListaDetalleGenerico(33)
		model.addAttribute("listaOpciones", JsonUtil.convertirObjetoACadenaJson(lista));	
		
		return "seguridad/opcion/administrarOpciones";
		
	}
	
	/**
	 * Metodo que realiza la insercion de un registro de Opción
	 */
	@RequestMapping(value = "/grabarOpcion")
	public @ResponseBody String grabarOpcion(HttpServletRequest request,
			Model model) throws GmdException{
		String cadenaRespuesta="";
		boolean esRaiz= false;
		Opcion opcion = new Opcion();
		BRespuestaBean respuestaBean = new BRespuestaBean();
		
		String opcionJson = request.getParameter("opcion") == null ? "": request.getParameter("opcion");
		Map<String, Object> mapaRespuesta = new HashMap<String, Object>();
		
		if (!opcionJson.equals("")) {
			opcion = JsonUtil.convertirCadenaJsonAObjetoRequest(opcionJson,Opcion.class); 
			
			if (opcion != null) {
				if(opcion.getIdOpcion() ==null || opcion.getIdOpcion().equals("")){
					int nivel = 0;
					if(opcion.getIdPadre().equals("")){
						nivel = 0;
						esRaiz = true;
					}
					else{
						nivel = opcionService.obtenerNivelPadre(opcion.getIdPadre() );
					}
					opcion.setNivel(nivel);
					respuestaBean = insertar(opcion,esRaiz, request);
					cadenaRespuesta="Se creo la opcion con codigo: "+ opcion.getIdOpcion()+".";
				}
				else{
					
					respuestaBean = actualizar(opcion, request);
					cadenaRespuesta = "Se actualizo la opcion con codigo: "+ opcion.getIdOpcion()+".";
				}
			}
			
			mapaRespuesta.put("cadenaRespuesta", cadenaRespuesta);
			mapaRespuesta.put("respuestaBean", respuestaBean);
			
			
		}

		return JsonUtil.convertirObjetoACadenaJson(mapaRespuesta);
	}

	/**
	 * Metodo que realiza carga de datos en la ventana de insercion de nueva Opción
	 */
	@RequestMapping(value = "/nuevaOpcion")
	public  @ResponseBody String nuevaOpcion(HttpServletRequest request,
			Model model) throws GmdException{
		String idOpcion = request.getParameter("idOpcion");
		String idPadreConsulta = null;
		String nombrePadre = null;
		String idPadre = "";
		if(idOpcion.equals("0")){
			idPadreConsulta = "Raiz";
			nombrePadre = "Raiz";
		}
		else{

			Opcion opcion = opcionService.obtener(idOpcion);

			
			idPadreConsulta = opcion.getIdPadre();
			if( idPadreConsulta == null ){
				nombrePadre= opcionService.obtenerNombrePadre(opcion.getIdOpcion());//.getid.getCodigoOpcion());
			}
			else{
				 nombrePadre = opcionService.obtenerNombrePadre(opcion.getIdPadre());
				 
			}
			idPadre = opcion.getIdOpcion();
			if(idPadre == null){
				idPadre = "";
			}

		}
		
		Map<String, String> mapaRespuesta = new HashMap<String, String>();
		mapaRespuesta.put("nombrePadre", nombrePadre);	
		mapaRespuesta.put("idPadre", idPadre);

		return JsonUtil.convertirObjetoACadenaJson(mapaRespuesta);
	}
	
	@RequestMapping(value = "/actualizarOpcion")
	public  @ResponseBody String actualizarOpcion(HttpServletRequest request,
			Model model) throws GmdException{
		String idOpcion = request.getParameter("idOpcion");
		Opcion opcion = opcionService.obtener(idOpcion);
		String idPadreConsulta = null;
		String nombrePadre = null;
		
		idPadreConsulta = opcion.getIdPadre();
		
		if( idPadreConsulta == null ){
			nombrePadre= opcion.getNombreOpcion();//opcionService.obtenerNombrePadre(opcion.getCodigoOpcion());
		}
		else{
			 nombrePadre = opcion.getNombreOpcion();// opcionService.obtenerNombrePadre(opcion.getIdPadre());
		}
		
		
		String idPadre = opcion.getIdPadre();
		
		Map<String, Object> mapaRespuesta = new HashMap<String, Object>();
		mapaRespuesta.put("nombrePadre", nombrePadre);
		mapaRespuesta.put("opcion", opcion);
		mapaRespuesta.put("idPadre", idPadre);
		
		
		return JsonUtil.convertirObjetoACadenaJson(mapaRespuesta);
	}
	
	/**
	 * Metodo que permite dar de baja a la opcion
	 */
	@RequestMapping(value = "/darBajaOpcion")
	public @ResponseBody String darBajaOpcion(HttpServletRequest request,
			Model model) throws GmdException{
		List<Opcion> lista = opcionService.listarOpcionesPorUsuario();

		model.addAttribute("listaOpciones", JsonUtil.convertirObjetoACadenaJson(lista));
		
		
		String idOpcion = request.getParameter("idOpcion");
		Opcion opcion = opcionService.obtener(idOpcion);
		opcionService.darBajaOpcion(opcion);
		Opcion opcionBaja = opcionService.obtener(idOpcion);
		return JsonUtil.convertirObjetoACadenaJson(opcionBaja);
		
	}
	
	/**
	 * Metodo que permite insertar la opcion
	 */
	public BRespuestaBean insertar(Opcion opcion, boolean esRaiz, HttpServletRequest request) throws GmdException{
		String mensajeError ="";
		BRespuestaBean respuestaBean = new BRespuestaBean();
		try {
			if (opcion != null) {
				opcion.setIdUsuaCrea(WebUtil.obtenerLoginUsuario());
				//opcion.setFeUsuaCrea(date);
				opcion.setDeTermCrea(WebUtil.obtenerTerminal(request));

				if(!esRaiz)
				{
					int nivel = opcion.getNivel();
					nivel++;
					opcion.setNivel(nivel);
				}	
				boolean esCorrecto = opcionService.insertarOpcion(opcion);

			}
			
		} catch (Exception excepcion) {
			String[] error = MensajeExceptionUtil.obtenerMensajeError(excepcion);
			mensajeError = format(ConstanteServices.MENSAJE_ERROR, error[0]);
			respuestaBean.setMensajeRespuesta(mensajeError);
		
			LOGGER.error(error[1], excepcion);
			return respuestaBean;
		}
		return respuestaBean;
	}

	public BRespuestaBean actualizar(Opcion opcion, HttpServletRequest request){
		String mensajeError ="";
		BRespuestaBean respuestaBean = new BRespuestaBean();
		try {
			Integer nivel = 0;
			if (opcion != null) {

				opcion.setIdUsuaModi(WebUtil.obtenerLoginUsuario());
				//opcion.setFechaUsuarioModificacion(date);
				opcion.setDeTermModi(WebUtil. obtenerTerminal(request));
				
				if (opcion.getNivel() ==null){
					nivel=0;
				}
				else{
					nivel=opcion.getNivel();
				}
				opcion.setNivel(nivel+1 );
				opcionService.actualizar(opcion);
				
			}
			
		} catch (Exception excepcion) {
            String[] error = MensajeExceptionUtil.obtenerMensajeError(excepcion);
			mensajeError = format(ConstanteServices.MENSAJE_ERROR, error[0]);
			respuestaBean.setMensajeRespuesta(mensajeError);
			LOGGER.error(error[1], excepcion);
			return respuestaBean;
		}

		return respuestaBean;
		
	}
	
}
