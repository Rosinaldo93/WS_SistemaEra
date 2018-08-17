package pe.com.sistemaera.core.controller;

import static java.text.MessageFormat.format;
import java.util.ArrayList;
import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.CollectionUtils;
import org.springframework.web.bind.annotation.RequestMapping;

import pe.com.gmd.util.exception.GmdException;
import pe.com.gmd.util.exception.MensajeExceptionUtil;
import pe.com.sistemaera.core.bean.BDetalleParametroBean;
import pe.com.sistemaera.core.bean.BRespuestaBean;
import pe.com.sistemaera.core.entity.DetalleParametro;
import pe.com.sistemaera.core.services.DetalleParametroService;
import pe.com.sistemaera.core.util.ConstanteServices;

@Controller
@RequestMapping(value = "/general")
public class GeneralController {
	
	
	private static final Logger LOGGER = Logger.getLogger(GeneralController.class);
	private String mensaje = "";
	private BRespuestaBean respuestaBean = new BRespuestaBean();
	
	@Autowired
	private DetalleParametroService detalleParametroService;
	
	
	public List<BDetalleParametroBean> obtenerListaTipoOpcion(){
		//TODO borrar cuando se defina la tabla parametro
		List<BDetalleParametroBean> listaDetalleParametro = new ArrayList<BDetalleParametroBean>();
		
		BDetalleParametroBean detalleParametro = new BDetalleParametroBean();
		detalleParametro.setIdDetalleParametro(177);
		detalleParametro.setDescripcion("PÁGINA");
		listaDetalleParametro.add(detalleParametro);
		
		detalleParametro = new BDetalleParametroBean();
		detalleParametro.setIdDetalleParametro(178);
		detalleParametro.setDescripcion("TAB");
		listaDetalleParametro.add(detalleParametro);
		
		detalleParametro = new BDetalleParametroBean();
		detalleParametro.setIdDetalleParametro(179);
		detalleParametro.setDescripcion("BOTÓN");
		listaDetalleParametro.add(detalleParametro);
		
		detalleParametro = new BDetalleParametroBean();
		detalleParametro.setIdDetalleParametro(180);
		detalleParametro.setDescripcion("DASHBOARD");
		listaDetalleParametro.add(detalleParametro);
		
		return listaDetalleParametro;
	}
	
	public List<BDetalleParametroBean> obtenerListaDetalleParametro(String nsParametro) throws GmdException{
		List<BDetalleParametroBean> listaDetalleParametroBean = new ArrayList<BDetalleParametroBean>();
		try {
			List<DetalleParametro> listaDetalleParametro = detalleParametroService.listarTodos(nsParametro);
			if(!CollectionUtils.isEmpty(listaDetalleParametro)) {
				for (DetalleParametro detalleParametro : listaDetalleParametro) {
					BDetalleParametroBean detalleParametroBean = new BDetalleParametroBean();
					detalleParametroBean.setIdDetalleParametro(detalleParametro.getNsDetalleParametro());
					detalleParametroBean.setDescripcion(detalleParametro.getDescripcionDetalleParametro());
					detalleParametroBean.setDescripcionCorta(detalleParametro.getDescripcionCorta());
					detalleParametroBean.setVlDato01(detalleParametro.getValorDato01());
					detalleParametroBean.setVlDato02(detalleParametro.getValorDato02());
					detalleParametroBean.setVlDato03(detalleParametro.getValorDato03());
					detalleParametroBean.setVlDato04(detalleParametro.getValorDato04());
					detalleParametroBean.setVlDato05(detalleParametro.getValorDato05());
					detalleParametroBean.setVlDato06(detalleParametro.getValorDato06());
					detalleParametroBean.setVlDato07(detalleParametro.getValorDato07());
					detalleParametroBean.setVlDato08(detalleParametro.getValorDato08());
					detalleParametroBean.setVlDato09(detalleParametro.getValorDato09());
					detalleParametroBean.setVlDato10(detalleParametro.getValorDato10());
					listaDetalleParametroBean.add(detalleParametroBean);
				}
			}
		} catch (GmdException excepcion) {
			String[] error = MensajeExceptionUtil.obtenerMensajeError(excepcion);
			mensaje = format(ConstanteServices.MENSAJE_ERROR, error[0]);
			respuestaBean.setMensajeRespuesta(mensaje);
			respuestaBean.setEstadoRespuesta(ConstanteServices.ERROR);
			LOGGER.error(error[1], excepcion);
		}
		return listaDetalleParametroBean;
	}
}
