package pe.com.sistemaera.core.bean;

import java.io.Serializable;
import java.util.List;

public class BOpcionBean implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String nombre;
	private String accion;
	private Integer nivel;
	private Integer tipoOpcion;
	private String codigoOpcion;
	private String codigoOpcionPadre;
	private String rutaCompleta;
	private List<BOpcionBean> listaOpciones;

	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public Integer getNivel() {
		return nivel;
	}

	public void setNivel(Integer nivel) {
		this.nivel = nivel;
	}

	public Integer getTipoOpcion() {
		return tipoOpcion;
	}

	public void setTipoOpcion(Integer tipoOpcion) {
		this.tipoOpcion = tipoOpcion;
	}

	public String getCodigoOpcion() {
		return codigoOpcion;
	}

	public void setCodigoOpcion(String codigoOpcion) {
		this.codigoOpcion = codigoOpcion;
	}

	public String getCodigoOpcionPadre() {
		return codigoOpcionPadre;
	}

	public void setCodigoOpcionPadre(String codigoOpcionPadre) {
		this.codigoOpcionPadre = codigoOpcionPadre;
	}
	
	public String getRutaCompleta() {
		return rutaCompleta;
	}

	public void setRutaCompleta(String rutaCompleta) {
		this.rutaCompleta = rutaCompleta;
	}

	public List<BOpcionBean> getListaOpciones() {
		return listaOpciones;
	}

	public void setListaOpciones(List<BOpcionBean> listaOpciones) {
		this.listaOpciones = listaOpciones;
	}

	public String getAccion() {
		return accion;
	}

	public void setAccion(String accion) {
		this.accion = accion;
	}

}
