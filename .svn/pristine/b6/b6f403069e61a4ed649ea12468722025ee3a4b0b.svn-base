package pe.com.sistemaera.core.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import static java.text.MessageFormat.format;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
import pe.com.sistemaera.core.entity.Opcion;
import pe.com.sistemaera.core.entity.Perfil;
import pe.com.sistemaera.core.services.OpcionService;
import pe.com.sistemaera.core.services.PerfilService;
import pe.com.sistemaera.core.util.ConstanteServices;
import pe.com.sistemaera.core.util.ConstantesParametros;
import pe.com.sistemaera.core.util.JsonUtil;
import pe.com.sistemaera.core.util.WebUtil;

@Controller
@RequestMapping(value = "/seguridad/perfil")
public class PerfilController {

private static final Logger LOGGER = Logger.getLogger(PerfilController.class);
	
	@Autowired
	PerfilService perfilService;

	@Autowired
	OpcionService opcionService;
	
	private Model modelTemp;
	private String mensajeError = "";
	private BRespuestaBean respuestaBean;
	
	/**
	 * Metodo que realiza la carga de la bandeja de administración de perfiles
	 */
	@RequestMapping(value = "/cargarVentanaBuscarPerfil")
	public String cargarVentanaBuscarPerfil(HttpServletRequest request,
			Model model) throws GmdException{
		String mensaje = (String) request.getParameter("mensaje");
		model.addAttribute("listaPerfiles", JsonUtil.convertirObjetoACadenaJson(perfilService.listarTodos()));
		model.addAttribute("mensaje", JsonUtil.convertirObjetoACadenaJson(""));
		model.addAttribute("mensaje", JsonUtil.convertirObjetoACadenaJson(mensaje));
		String nombre = null;
		if (mensaje != null) {
			mensaje = mensaje.trim();
			if (mensaje.equals(".")) {

				model.addAttribute("mensaje",JsonUtil.convertirObjetoACadenaJson("Se Guardo el Cambio con éxito."));
			} else {
				String[] part = mensaje.split("-");
				mensaje = part[0];
				nombre = part[1];
			}
			if (mensaje.equals("registrado") || mensaje.equals("actualizado")) {
				String texto = "";
				texto = "Se "+ (mensaje.equals("registrado") ? "creó el perfil: "
						+ nombre : "actualizó el perfil: " + nombre);
				model.addAttribute("mensaje",
						JsonUtil.convertirObjetoACadenaJson(texto));
			}
		} else {
			model.addAttribute("mensaje",
					JsonUtil.convertirObjetoACadenaJson(""));
		}
		return "seguridad/perfil/administrar";
	}

	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/buscarPerfil")
	public @ResponseBody String buscarPerfil(HttpServletRequest request) throws GmdException{
		String listaPerfiles = request.getParameter("parametrosBusqueda");
		Map<String, Object> parametrosBusqueda = JsonUtil.convertirCadenaJsonAObjetoRequest(listaPerfiles, HashMap.class); 
		return JsonUtil.convertirObjetoACadenaJson(perfilService.listar(parametrosBusqueda));
	}

	/**
	 * Metodo que realiza la carga de la ventana de Registro de perfiles
	 */
	@RequestMapping(value = "/cargarVentanaRegistrarPerfil", method = RequestMethod.GET)
	public String cargarVentanaRegistrarPerfil(HttpServletRequest request, Model model) throws GmdException{
		List<Opcion> lista = opcionService.listarOpcionesActivasPorUsuario();
		model.addAttribute("listaOpciones", JsonUtil.convertirObjetoACadenaJson(lista));
		return "/seguridad/perfil/registrar";
	}
	
	/**
	 * Metodo que realiza el registro de un Perfil
	 */
	@RequestMapping(value = "/registrarPerfil", method = RequestMethod.POST)
	public @ResponseBody String registrarPerfil(HttpServletRequest request,
			Model model) throws GmdException{
		BRespuestaBean respuestaBean = new BRespuestaBean();
		Perfil perfil = JsonUtil.convertirCadenaJsonAObjetoRequest(request.getParameter("perfil"), Perfil.class);

		if (perfil.getIdPerfil() == null) {
			boolean existeNombre = perfilService.existePerfilRegistrado(perfil
					.getNombre());
			if (!existeNombre) {
				perfil.setIdUsuaCrea(WebUtil.obtenerLoginUsuario());
				perfil.setDeTermCrea(WebUtil.obtenerTerminal(request));
				perfil.setEstadoRegistro(ConstantesParametros.ST_REGI_ACTIVO);
				perfilService.insertar(perfil);
				respuestaBean.setEstadoRespuesta(ConstanteServices.OK);
			} else {
				respuestaBean.setEstadoRespuesta(ConstanteServices.ERROR);
				String mensaje = "El nombre del perfil ingresado ya existe.";
				respuestaBean.setMensajeRespuesta(mensaje);
			}
		}
		model.addAttribute("mensaje", JsonUtil.convertirObjetoACadenaJson(""));
		return JsonUtil.convertirObjetoACadenaJson(respuestaBean);
	}
	
	/**
	 * Metodo que realiza la carga de la ventana de Actualización de perfiles
	 */
	@RequestMapping(value = "/obtenerVentanaActualizarPerfil", method = RequestMethod.POST)
	public @ResponseBody String obtenerVentanaActualizarPerfil(HttpServletRequest request,
			   HttpServletResponse response, Model model) throws GmdException{
		
		modelTemp = model;
		modelTemp.addAttribute("idPerfil", request.getParameter("idPerfil"));
		return JsonUtil.convertirObjetoACadenaJson("correcto"); //"redirect:./obtenerVentanaActualizarPerfil"; //
	}

	@RequestMapping(value = "/cargarVentanaActualizarPerfil", method = RequestMethod.GET)
	public String cargarVentanaActualizarPerfil(HttpServletRequest request, Model model) throws GmdException{
		
		Map<String,Object> modelMap = modelTemp.asMap();
		try
		{
			int idPerfil = Integer.parseInt(modelMap.get("idPerfil").toString());
			Perfil perfil = new Perfil();
			perfil = perfilService.obtenerPerfil(idPerfil);

			List<Opcion> listaOpciones = opcionService.listarOpcionesSeleccionadasPorPerfil(idPerfil);
			List<Opcion> listaOpcion = perfilService.listarOpcionesPorPerfil(idPerfil);
			List<Integer> listaIdOpcion = new ArrayList<>();

			for (int i = 0; i < listaOpcion.size(); i++) {
				listaIdOpcion.add(Integer.parseInt(listaOpcion.get(i).getIdOpcion()));
			}

			model.addAttribute("listaOpciones", JsonUtil.convertirObjetoACadenaJson(listaOpciones));
			model.addAttribute("perfil", JsonUtil.convertirObjetoACadenaJson(perfil));
			model.addAttribute("listaIdOpcion", JsonUtil.convertirObjetoACadenaJson(listaIdOpcion));

		}catch (Exception excepcion) {
			// TODO: handle exception
			String[] error = MensajeExceptionUtil.obtenerMensajeError(excepcion);
			mensajeError = format(ConstanteServices.MENSAJE_ERROR, error[0]);
			respuestaBean.setMensajeRespuesta(mensajeError);
			model.addAttribute("respuesta", respuestaBean);
			LOGGER.error(error[1], excepcion);
		}

		return "seguridad/perfil/actualizar";
	}
	
	/**
	 * Metodo que realiza la actualización de un registro de Perfil
	 */
	@RequestMapping(value = "/actualizarPerfil")
	public @ResponseBody String actualizarPerfil(HttpServletRequest request,
			Model model) {
		// public @ResponseBody String actualizarPerfil(HttpServletRequest
		// request, Model model, int id ){
		String mensaje = request.getParameter("mensaje");
		BRespuestaBean respuestaBean = new BRespuestaBean();
		String mensajeError ="";
		// String resultado = "1";
		try {
			Perfil perfil = new Perfil();
			String perfilJson = request.getParameter("perfil") == null ? "": request.getParameter("perfil");
			if (!perfilJson.equals("")) {
				perfil = JsonUtil.convertirCadenaJsonAObjetoRequest(perfilJson, Perfil.class);
				if (perfil != null) {
					perfil.setIdUsuaModi(WebUtil.obtenerLoginUsuario());
					perfil.setDeTermModi(WebUtil.obtenerTerminal(request));
					perfilService.actualizar(perfil);
				}
			}
		} catch (Exception excepcion) {
			// TODO: handle exception
			String[] error = MensajeExceptionUtil.obtenerMensajeError(excepcion);
			mensajeError = format(ConstanteServices.MENSAJE_ERROR, error[0]);
			respuestaBean.setMensajeRespuesta(mensajeError);
			model.addAttribute("respuesta", respuestaBean);
			LOGGER.error(error[1], excepcion);
		}
		
		model.addAttribute("mensaje", JsonUtil.convertirObjetoACadenaJson(""));
		return JsonUtil.convertirObjetoACadenaJson(mensaje);
	}


	/**
	 * Metodo que realiza la eliminación de un registro de Perfil.
	 */
	@RequestMapping(value = "/eliminarPerfil")
	public String eliminarPerfil(HttpServletRequest request, Model model) throws GmdException{
		try {
			int id = Integer.parseInt((request.getParameter("idPerfil")));
			perfilService.eliminar(id);
		} catch (Exception excepcion) {
		}
		model.addAttribute("listaPerfiles", JsonUtil.convertirObjetoACadenaJson(perfilService.listarTodos()));
		return "seguridad/perfil/administrar";
	}
}
