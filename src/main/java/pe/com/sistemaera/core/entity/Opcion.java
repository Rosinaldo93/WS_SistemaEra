package pe.com.sistemaera.core.entity;

import java.io.Serializable;
import java.util.Date;

import pe.com.sistemaera.core.entity.base.Base;

public class Opcion extends Base implements Serializable {
	private static final long serialVersionUID = 1L;

	/** Idenfificador de Opción. */
	private String idOpcion;

	/** Nombre de Opción. */
	private String nombreOpcion;

	/** Valor de Opción. */
	private String valorAccion;

	/** Idenfificador del padre de la Opción. */
	private String idPadre;

	/** Tipo de Opción. */
	private Integer tipoOpcion;

	/** Código único de la Opción. */
	private String codigoOpcion;

	/** Estado del registro. */
	private String estadoRegistro;

	/** Identificador del nivel de la opción. */
	private Integer nivel;
	
	private Integer estaSeleccionado;

	Opcion opcionPadre;

	public String getIdOpcion() {
		return idOpcion;
	}

	public void setIdOpcion(String idOpcion) {
		this.idOpcion = idOpcion;
	}

	public String getNombreOpcion() {
		return nombreOpcion;
	}

	public void setNombreOpcion(String nombreOpcion) {
		this.nombreOpcion = nombreOpcion;
	}

	public String getValorAccion() {
		return valorAccion;
	}

	public void setValorAccion(String valorAccion) {
		this.valorAccion = valorAccion;
	}

	public String getIdPadre() {
		return idPadre;
	}

	public void setIdPadre(String idPadre) {
		this.idPadre = idPadre;
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

	public String getEstadoRegistro() {
		return estadoRegistro;
	}

	public void setEstadoRegistro(String estadoRegistro) {
		this.estadoRegistro = estadoRegistro;
	}

	public Integer getNivel() {
		return nivel;
	}

	public void setNivel(Integer nivel) {
		this.nivel = nivel;
	}

	public Integer getEstaSeleccionado() {
		return estaSeleccionado;
	}

	public void setEstaSeleccionado(Integer estaSeleccionado) {
		this.estaSeleccionado = estaSeleccionado;
	}

	public Opcion getOpcionPadre() {
		return opcionPadre;
	}

	public void setOpcionPadre(Opcion opcionPadre) {
		this.opcionPadre = opcionPadre;
	}

}
