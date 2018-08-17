<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
                            :: Usted se encuentra en: 
                            <span class="active-view">CAMBIAR CONTRASEÑA</span>
                        </div>
                        <div class="main-colum">
                            <!-- wrap -->
                            <div class="box-wrap-main">
                                <div class="box-wrap-header">
                                    <div class="pull-left">
                                        <div class="title-main">
                                            Cambiar <span>Contraseña</span>
                                        </div>
                                    </div>
                                    <div class="pull-right">
                                        <div class="botonera">
                                            <button id="btnExportar" type="button" class="btn-update" data-toggle="tooltip" data-placement="top" data-original-title="Exportar">
                                                <i></i>
                                            </button>
                                        </div>
                                    </div>
                                </div>
								<div class="box-wrap-body">
									<div class="box-form">
										<form id="formUsuarioContrasena">
										   <label>Ingrese los datos de la nueva contraseña:</label> 										   
										   <div class="row row-centered">
										     <div class="col-xs-4 col-centered col-fixed">													
											 </div>										     
										     <div class="col-xs-2 col-centered col-fixed">
													<div class="form-group">
														<label>Contraseña Actual :</label> 
														<input type="password"  id="txtContrasenaActual" name="contrasenaActual" class="form-control" readonly="readonly">
													</div>
													<div class="form-group">
														<label>Nueva Contraseña: <font color="red">(*)</font></label> 
														<input type="password"  id="txtContrasenaNueva" name="contrasenaNueva" class="form-control">
													</div>
													<div class="form-group">
														<label>Confirmacion: <font color="red">(*)</font></label> 
														<input type="password"  id="txtContrasenaConfirmacion" name="contrasenaConfirmacion" class="form-control">
													</div>
											  </div>
										   </div>
										   <input type="hidden"  id="txtIdUsuario" value="">										    
										</form>
									</div>
								</div>

								<!--FOOTER -->
                                    <div class="box-acciones">
                                        <div class="pull-left">
                                            	<div class="alert-custom">
				                                	<div id="divMensajeInformacion" class="alert-custom">
				                                    </div>
				                                </div>
                                        </div>
                                        <div class="pull-right">                                            
                                            <button type="button" id="btnGrabar" class="btn-s btn-add">Grabar</button>
                                            <button type="button" id="btnCancelar" class="btn-s btn-clean">Cancelar</button>                                          
                                        </div>
                                    </div>
                                    <div class="table-responsive">
                                    </div>    
                            </div>
                        </div>
                    </div>
                    <footer class="login inter-foot">
                        <jsp:include page="../../template/footer.jsp" />
                    </footer>
                </div>
                <!--</main-content>-->
            </div>
            <!--</pull-main-content>-->
        </div>
        <!--</wrap-content>-->
        <div class="up-page upPage">
            <span class="glyphicon glyphicon-chevron-up"></span>
        </div>
        
    </section>
    
    <!-- Modal -->        
    <div class="modal fade" id="mdlEliminar" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel">
      <div class="modal-dialog" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
            <h4 class="modal-title" id="exampleModalLabel">Anular</h4>
          </div>
          <div class="modal-body">
            ¿Desea Anular el regitro?
          </div>
          <div class="modal-footer">
            <button type="button" id="btnSiModal" class="btn-s btn-add">SI</button>
            <button type="button" id="btnNoModal" class="btn-s btn-clean" data-dismiss="modal">NO</button>
          </div>
        </div>
       </div>
     </div>
     
    <!--JS-->
    <jsp:include page="../../template/libreriasFooter.jsp" />
    <script type="text/javascript">
        $(document).ready(function() {
            inicializarVariables();
            cargarComponentes();            
        });

        //INICIALIZAR VARIABLES
        var formUsuarioContrasena = null;
        var txtLogin = null;
        var txtCorreoElectronico = null;
        var txtNombres = null;
        var txtApellidoPaterno = null;
        var txtApellidoMaterno = null;
        var txtIdUsuario = null;
        var btnGrabar = null;
        var btnCancelar = null;
        var txtContrasenaNueva = null;
        var txtContrasenaConfirmacion = null;

        var selTipoUsuario = null;
        var selPudo = null;
        var selProveedor = null;
        var selTipoDocumentoIdentidad = null;        

        function inicializarVariables(){
        	 formUsuarioContrasena = $('#formUsuarioContrasena');
        	 txtLogin = $('#txtLogin');
             txtCorreoElectronico = $('#txtCorreoElectronico');
             txtNombres = $('#txtNombres');
             txtApellidoPaterno = $('#txtApellidoPaterno');
             txtApellidoMaterno = $('#txtApellidoMaterno');             
             txtIdUsuario = $('#txtIdUsuario'); 
             txtContrasenaNueva = $('#txtContrasenaNueva');
             txtContrasenaConfirmacion = $('#txtContrasenaConfirmacion'); 
             
             btnGrabar = $('#btnGrabar');
             btnCancelar = $('#btnCancelar');   

             selTipoUsuario = $('#selTipoUsuario');
             selPudo = $('#selPudo');
             selProveedor = $('#selProveedor');
             selHub = $('#selHub');
             selTipoDocumentoIdentidad = $('#selTipoDocumentoIdentidad');
                        
        }

        function cargarComponentes(){
			 var idUsuario = ${usuario.idUsuario};
			 var origen = null;
			 var origen = '${origen}';
			 //var idTipoDocumentoIdentidad = '${usuario.idTipoDocumentoIdentidad}';
			 
             txtIdUsuario.val(idUsuario);
             
             $("#txtContrasenaActual").val('${usuario.password}')                     
         
			 $('#txtContrasenaConfirmacion').bind("cut copy paste",function(e) {
          		e.preventDefault();
      		 });
            
			function validarFormulario(){
			     var regex = /^(?=.*\d).{6,20}$/;       
			     var estado = true;         
                 if(txtContrasenaNueva.val().trim()==''){
                     mostrarMensajeError('Debe ingresar una contraseña');
                     estado = false;
                 }else if(txtContrasenaConfirmacion.val()==''){
                     mostrarMensajeError('Debe ingresar la confirmación de contraseña');
                     estado = false;
                 }else if(!regex.test(txtContrasenaNueva.val().trim())){
                    mostrarMensajeError('La contraseña debe contener entre 6 y 20 caracteres.');
                    estado = false;                         
                 }else if(txtContrasenaNueva.val() != txtContrasenaConfirmacion.val()){
                     mostrarMensajeError('La confirmación de contraseña no coincide con la contraseña ingresada');
                     estado = false; 
                 }                               
                 return estado;
             }

             function mostrarMensajeError(mensajeError){
                 var mensajeHTML = '';
                 mensajeHTML = '<div class="alert alert-danger" role="alert" style="height: auto!important;">';
                 mensajeHTML = mensajeHTML + '<i class="fa fa-warning"></i>';
                 mensajeHTML = mensajeHTML + mensajeError;
                 $('#divMensajeInformacion div').remove();
                 $('#divMensajeInformacion').append(mensajeHTML);
             }

            
        	btnGrabar.click(function(event){
        	  if(validarFormulario()){	            
			    var contrasenaNueva = txtContrasenaNueva.val();
			    var idUsuario = txtIdUsuario.val();
			    var mensaje = "contrasena-";
			    $.ajax({
				  url:"./accionCambiarContrasena",
				  type:"POST",
				  dataType : "json",
	              cache: false,
	              data : {
	            	contrasenaNueva : contrasenaNueva,
	            	idUsuario: idUsuario
	              }
			    }).done(function(respuestaBean) {
			      if(respuestaBean.estadoRespuesta == '<%=ConstantesParametros.OK%>'){
			      		mostrarMensajeConfirmacion("Contraseña Guardada Correctamente.")
			      }else{
			      		mostrarMensajeError('Ocurrio un Error al Guardar la Nueva Contraseña.');
			      }
                }).fail(function( jqXHR, textStatus, errorThrown ) {
                	validarFinDeSesion(jqXHR, textStatus, errorThrown, '<%= ConstanteServices.MENSAJE_SESION_EXPIRADA %>');
                });
        	  }
			});
			
			function mostrarMensajeConfirmacion(mensaje){
                var mensajeHTML = '';
                mensajeHTML = '<div class="alert alert-success" role="alert" style="height: auto!important;">';
                mensajeHTML = mensajeHTML + '<i class="fa fa-check"></i>';
                mensajeHTML = mensajeHTML + mensaje;
                $('#divMensajeInformacion div').remove();
                $('#divMensajeInformacion').append(mensajeHTML);
            }
      		

        	btnCancelar.click(function(event){
        		window.location.href = '${pageContext.request.contextPath}/cargarVentanaInicio';
        	});	   
                      
        }
 
    </script>
</body>
</html>