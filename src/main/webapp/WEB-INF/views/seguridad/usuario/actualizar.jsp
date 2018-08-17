<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="pe.com.sistemaera.core.util.ConstanteServices"%>
<%@page import="pe.com.sistemaera.core.util.ConstantesParametros"%>
<!DOCTYPE HTML>
<html lang="es">
<head>
    <jsp:include page="../../template/libreriasCabecera.jsp" />
</head>
<body class="skin-gym bar-white">
    <section class="wrap-ui">
        <!--<header>-->
        <header class="header">
            <jsp:include page="../../template/header.jsp" />
        </header>
        <!--</header>-->
        <!-- nav -->
        <div class="menu">
            <jsp:include page="../../template/menu.jsp" />
        </div>
        <!-- cierra nav -->
        <!--<wrap-content>-->
        <div class="wrap-content">
            <!--</main-aside>-->
            <!--<pull-main-content>-->
            <div class="pull-main-content">
                <!--<main-content>-->
                <div class="main-content view-wrap">
                    <div class="content-body">
                        <div class="breadcrumbs">
                            :: Usted se encuentra en: <span>SEGURIDAD</span> <span
								class="nivel-bread">/</span> <span class="active-view">ACTUALIZAR
								USUARIO</span>
                        </div>
                        <div class="main-colum">
                            <!-- wrap -->
                            <div class="box-wrap-main">
                                <div class="box-wrap-header">
                                    <div class="pull-left">
                                        <div class="title-main">
                                            Actualizar <span>Usuario</span>
                                        </div>
                                    </div>
                                </div>
                                <!-- inicia form -->
                                <form id="formRegistrarUsuario">
                                	<input type="hidden" id="txtIdUsuario" name="idUsuario:null"
										value="${usuario.idUsuario}" class="form-control" />
                                    <div class="box-wrap-body">
                                        <h3 class="title-form">DATOS DE USUARIO</h3>
                                        <div class="box-form">
                                            <div class="row">
                                                <div class="col-sm-4">
                                                    <div class="form-group">
                                                        <label>Login Usuario:<font color="red">(*)</font></label>
                                                        <div class="row">
                                                            <div class="col-sm-6">
                                                                <input type="text" id="txtLogin" name="login"
																	value="${usuario.login}" class="form-control"
																	readonly="readonly" tabindex="1" maxlength="20" />
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="form-group">
														<label>Nombres:<font color="red">(*)</font></label> <input
															type="text" id="txtNombres" name="nombre"
															value="${usuario.nombre}" class="form-control" onkeypress="return validarLetras(event)" tabindex="5" maxlength="40">
													</div>
													<div class="form-group">
                                                        <label>Contrase&ntilde;a :<font color="red">(*)</font></label>
                                                        <div class="row">
                                                        <div class = "col-sm-11">
                                                        	<input type="password" id="txtPasswordInicial" name="password"
                                                            class="form-control" tabindex="12" maxlength="20">
                                                        </div>
                                                        	<button title="ver Contraseña" style="min-width: 30px !important;" type="button" id="btnVerClave" class="btn-s btn-search">
																 <i class="fa fa-eye"></i>
															</button>
															<button title="Ocultar Contraseña" style="min-width: 30px !important;display: none;" type="button" id="btnOcultarClave" class="btn-s btn-search">
																 <i class="fa fa-eye-slash"></i>
															</button>
                                                        </div>                                                        
                                                    </div>
                                                </div>

                                                <div class="col-sm-4">
                                                    <div class="form-group">
                                                        <label>Número de Documento:</label>
                                                        <div class="row">
                                                            <div class="col-sm-6">
                                                                <select id="selTipoDocumentoIdentidad"
                                                                    name="idTipoDocumentoIdentidad" class="form-control" tabindex="2">
                                                                </select>
                                                            </div>
                                                            <div class="col-sm-6">
                                                                <input type="text" id="txtNumeroDocumento"
                                                                    name="numeroDocumentoIdentidad" 
                                                                    class="form-control" tabindex="3">
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="form-group">
														<label>Apellido Paterno:<font color="red">(*)</font></label>
														<input type="text" id="txtApellidoPaterno"
															name="apellidoPaterno" value="${usuario.apellidoPaterno}"
															class="form-control" onkeypress="return validarLetras(event)" tabindex="6" maxlength="40">
													</div>
													<div class="form-group">
                                                        <label>Estado:</label> 
                                                        <select id="selEstadoRegistro" name="estadoRegistro" class="form-control" tabindex="11">
                                                            <option value="Activo">ACTIVO</option>
                                                            <option value="Inactivo">INACTIVO</option>
                                                        </select>
                                                    </div>                                                    
                                                </div>
                                                <div class="col-sm-4">
                                                    <div class="form-group">
														<label>Correo Electrónico:<font color="red">(*)</font></label>
														<input type="text" id="txtCorreoElectronico"
															name="correoElectronico"
															value="${usuario.correoElectronico}" class="form-control" tabindex="4" maxlength="100">
													</div>
                                                    <div class="form-group">
														<label>Apellido Materno:</label>
														<input type="text" id="txtApellidoMaterno"
															name="apellidoMaterno" value="${usuario.apellidoMaterno}"
															class="form-control" onkeypress="return validarLetras(event)" tabindex="7" maxlength="40">
													</div>
													<div class="form-group">
                                                        <label>Perfil:</label> <select id="selPerfil"
                                                            name="idPerfil:null" class="form-control"
                                                             tabindex="10">
                                                        </select>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </form>
                                <div class="box-acciones">
                                    <div class="pull-left">
                                        <div id="divMensajeInformacion" class="pull-left alert-custom">
                                                                                                      
                                        </div>
                                    </div>
                                    <div class="pull-right">
                                        <button type="button" id="btnGrabar" class="btn-s btn-add">Grabar</button>
                                        <button type="button" id="btnCancelar" class="btn-s btn-clean">Cancelar</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <footer class="login inter-foot">
                             <jsp:include page="../../template/footer.jsp" />
                    </footer>
                </div>
            </div>
        </div>
        <div class="up-page upPage"><span class="glyphicon glyphicon-chevron-up"></span></div>
    </section>

    <!--JS-->
    <jsp:include page="../../template/libreriasFooter.jsp" />
    <script type="text/javascript">
        $(document).ready(function() {
            inicializarVariables();
            cargarComponentes();
        });

        var btnCancelar = null;
        var btnGrabar = null;       
        var selTipoDocumentoIdentidad = null;
		var selPerfil = null;
        var selEstadoRegistro = null;
        var txtLogin = null;
        var txtCorreoElectronico = null;
        var txtNombres = null;
        var txtApellidoPaterno = null;
        var txtApellidoMaterno = null;
        var txtIdUsuario = null;
        var txtNumeroDocumento = null;
        var formRegistrarUsuario = null;
        var tipoDocumento=null;
        var tamanio = 0;
        var txtPasswordInicial = null;
        function inicializarVariables(){
            btnGrabar = $('#btnGrabar');
            btnCancelar = $('#btnCancelar');
            selTipoDocumentoIdentidad = $('#selTipoDocumentoIdentidad');
			selPerfil = $('#selPerfil');
            selEstadoRegistro = $('#selEstadoRegistro');
            txtLogin = $('#txtLogin');
            txtCorreoElectronico = $('#txtCorreoElectronico');
            txtNombres = $('#txtNombres');
            txtApellidoPaterno = $('#txtApellidoPaterno');
            txtApellidoMaterno = $('#txtApellidoMaterno');
            txtIdUsuario = $('#txtIdUsuario');
            txtNumeroDocumento = $('#txtNumeroDocumento');
			txtPasswordInicial = $('#txtPasswordInicial');
            formRegistrarUsuario = $('#formRegistrarUsuario');
        }

        function cargarComponentes(){
            var listaTipoDocumentos = ${listaTipoDocumentos};
            selTipoDocumentoIdentidad.append($("<option/>").attr("value","-1").text("Seleccionar"));
            $.each(listaTipoDocumentos, function(i, item) {
                selTipoDocumentoIdentidad.append($("<option/>").attr("value",listaTipoDocumentos[i].idDetalleParametro).text(listaTipoDocumentos[i].descripcionCorta));
            });
			
			
			var listaPerfiles = ${listaPerfiles};
            agregarItem(selPerfil);
            agregarListaItem(selPerfil, listaPerfiles, "idPerfil", "nombre");
            $("#txtPasswordInicial").val('${usuario.password}')
            
            $( "#selTipoDocumentoIdentidad" ).change(function() {
                if(selTipoDocumentoIdentidad.val() == '<%=ConstantesParametros.idOpcionSeleccione%>'){
                    txtNumeroDocumento.val("");
                    txtNumeroDocumento.prop("readonly",true);
                }else{
                	txtNumeroDocumento.prop("readonly", false);
                    changeTipoDocu("#selTipoDocumentoIdentidad", "#txtNumeroDocumento", "#formRegistrarUsuario");
                }
            });
            
            selPerfil.val('${usuario.idPerfil}')
            
            if('${usuario.idTipoDocumentoIdentidad}'!=null){
               selTipoDocumentoIdentidad.val(retornarValueCombo('${usuario.idTipoDocumentoIdentidad}'));
               selTipoDocumentoIdentidad.change();
            }
            txtNumeroDocumento.val('${usuario.numeroDocumentoIdentidad}');
            selEstadoRegistro.val('${usuario.estadoRegistro}');

            btnGrabar.click(function(event){
                if(validarFormulario() && validarDocumento()){
	                var usuarioJson = JSON.stringify(formRegistrarUsuario.serializeJSON());
	                var mensaje = "actualizado-";
	                $.ajax({
	                    url: "./accionRegistrarUsuario",
	                    type: "POST",
	                    dataType: "json",
	                    data : {
	                        usuario: usuarioJson
	                    }
	                }).done(function(paramJson) {
		                if(paramJson.estadoRespuesta=='OK')
	                        window.location.href = './cargarVentanaAdministrarUsuario?mensaje='+ mensaje + txtLogin.val();
		                else
		                	mostrarMensajeError('danger','fa fa-warning',paramJson.mensajeRespuesta);
	                }).fail(function( jqXHR, textStatus, errorThrown ) {
	                	validarFinDeSesion(jqXHR, textStatus, errorThrown, '<%= ConstanteServices.MENSAJE_SESION_EXPIRADA %>');
	                });
                }
            });

            btnCancelar.click(function(event){
                window.location.href = './cargarVentanaAdministrarUsuario';
            });
            
            $("#btnVerClave").click(function(event){
            	document.getElementById('txtPasswordInicial').type = 'text' ;
                $("#btnVerClave").css("display","none");
                $("#btnOcultarClave").css("display","block");
            });
            
            $("#btnOcultarClave").click(function(event){
            	document.getElementById('txtPasswordInicial').type = 'password' ;
                $("#btnOcultarClave").css("display","none");
                $("#btnVerClave").css("display","block");
            });
            
        }

		function retornarValueCombo(valor){
			var retorno = "-1";
			if(!(valor == "-1" || valor == "")){
				retorno = valor;
			}
			return retorno;
		}
		
        function validarFormulario(){
            var estado = true;
            var regex = /[\w-\.]{2,}@([\w-]{2,}\.)*([\w-]{2,}\.)[\w-]{2,4}/;            
            var login = txtLogin.val();                       
            var Longitudlogin = login.length;
            var contrasena = txtPasswordInicial.val();
            var Longitudcontrasena = contrasena.length;
             
            if($('#txtLogin').val().trim()==''){
                mostrarMensajeError('danger','fa fa-warning','Debe ingresar un login para el usuario');
                estado = false;
            } else if (login.length < 4) {
                mostrarMensajeError('danger','fa fa-warning','El  login ingresado debe tener al menos 4 caracteres de longitud');
                estado = false;     
//             }else if(selTipoDocumentoIdentidad.val()=='-1'){
//                 mostrarMensajeError('danger','fa fa-warning','Debe seleccionar un tipo y número de documento de identidad');
//                 estado = false;
//             }else if(txtNumeroDocumento.val().trim()==''){
//                 mostrarMensajeError('danger','fa fa-warning','La longitud del numero de documento es inválida para el tipo seleccionado');
//                 estado = false;
            }else if(!regex.test(txtCorreoElectronico.val().trim())){
                mostrarMensajeError('danger','fa fa-warning','El Correo ingresado no es válido');
                estado = false;
            }else if(txtNombres.val().trim()==''){
                mostrarMensajeError('danger','fa fa-warning','Debe ingresar los nombres del usuario');
                estado = false;
            }else if(txtApellidoPaterno.val().trim()==''){
                mostrarMensajeError('danger','fa fa-warning','Debe ingresar el apellido paterno del usuario');
                estado = false;
            }else if(txtPasswordInicial.val().trim()==''){
                mostrarMensajeError('danger','fa fa-warning','Debe ingresar una contraseña para el usuario');
                estado = false;
            } else if (Longitudcontrasena < 4) {
                mostrarMensajeError('danger','fa fa-warning','La contraseña ingresada debe tener al menos 4 caracteres de longitud');
                estado = false;
            }else if(selPerfil.val() == '' || selPerfil.val() == '-1' ){
                mostrarMensajeError('danger','fa fa-warning','Debe seleccionar un Perfil');
                estado = false;
            }
            
            return estado;
        }

        function validarDocumento()
        {
            var correcto=true;
            var lenNroDocumento = txtNumeroDocumento.val().length;
            if(lenNroDocumento<tamanio && lenNroDocumento>0)
            {
                mostrarMensajeError('danger','fa fa-warning','El formato del No. de Documento no corresponde al tipo de documento ' + selTipoDocumentoIdentidad.find('option:selected').text());
                correcto=false;
            }
            return correcto;
        }

        function validarLogin(e) {
			tecla = (document.all) ? e.keyCode : e.which;
			if (tecla == 8)
				return true;
			if (tecla == 9)
				return true;
			if (tecla == 11)
				return true;
			patron = /[A-Za-zÃ±Ã0-9\s]/;
			te = String.fromCharCode(tecla);
			return patron.test(te);
		}

        function validarNumeros(e) {
			tecla = (document.all) ? e.keyCode : e.which;
			if (tecla == 8)
				return true;
			if (tecla == 9)
				return true;
			if (tecla == 11)
				return true;
			patron = /[0-9\s]/;
			te = String.fromCharCode(tecla);
			return patron.test(te);
		}
        function validarLetras(e) {
			tecla = (document.all) ? e.keyCode : e.which;
			if (tecla == 8)
				return true;
			if (tecla == 9)
				return true;
			if (tecla == 11)
				return true;
			patron = /[A-Za-zÃ±Ã\s]/;
			letras_latinas = /^[a-zA-ZáéíóúàèìòùÀÈÌÒÙÁÉÍÓÚñÑüÜ_\s]+$/;
			te = String.fromCharCode(tecla);
			return letras_latinas.test(te);
		}

        function mostrarMensajeError(type,icon,mensajeError){
            var mensajeHTML = '';
            mensajeHTML = '<div class="alert alert-'+type+'" role="alert" style="height: auto!important;">';
            mensajeHTML = mensajeHTML + '<i class="'+icon+'"></i>';
            mensajeHTML = mensajeHTML + mensajeError;
            $('#divMensajeInformacion div').remove();
            $('#divMensajeInformacion').append(mensajeHTML);
        }

        

        $('#txtNumeroDocumento').keydown(function (e) {
            if (tipoDocumento=='DNI' || tipoDocumento=='RUC' ){    
            if ($.inArray(e.keyCode, [46, 8, 9, 27, 13, 116]) !== -1 || (e.keyCode == 65 && e.ctrlKey === true) || (e.keyCode >= 35 && e.keyCode <= 39)) {
                     return;
            }
     
            if ((e.shiftKey || (e.keyCode < 48) || (e.keyCode > 57)) && ((e.keyCode < 96) || (e.keyCode > 105))) {
                e.preventDefault();
            }
          }  
        });
       
    </script>  
</body>
</html>
