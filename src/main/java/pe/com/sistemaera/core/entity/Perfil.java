package pe.com.sistemaera.core.entity;
import java.io.Serializable;
import java.util.List;

import pe.com.sistemaera.core.entity.base.Base;

public class Perfil extends Base implements Serializable {
	private static final long serialVersionUID = 1L;
	private Integer idPerfil;
	private String nombre;
	private String descripcion;
	private String estadoRegistro;
	private List<Integer> opciones;
	private List<Opcion> lstOpciones;

	public Integer getIdPerfil() {
		return idPerfil;
	}

	public void setId(Integer id) {
		this.idPerfil = id;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public String getNombre() {
		return nombre;
	}

	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}

	public String getDescripcion() {
		return descripcion;
	}

	public String getEstadoRegistro() {
		return estadoRegistro;
	}

	public void setEstadoRegistro(String estadoRegistro) {
		this.estadoRegistro = estadoRegistro;
	}

	public List<Integer> getOpciones() {
		return opciones;
	}

	public void setOpciones(List<Integer> opciones) {
		this.opciones = opciones;
	}

	public List<Opcion> getLstOpciones() {
		return lstOpciones;
	}

	public void setLstOpciones(List<Opcion> lstOpciones) {
		this.lstOpciones = lstOpciones;
	}
}
