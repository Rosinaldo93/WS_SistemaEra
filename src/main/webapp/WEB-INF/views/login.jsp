<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE HTML>
<html lang="es">
<head>
	<!-- importamos librerias -->
    <jsp:include page="template/libreriasCabecera.jsp" />    
</head>
<body class="skin-gym bar-white bar-white-login">
  	  	
  	<header class="header-login">
		<div class="logo-data-login"></div>
	</header>
	
	<section class="box-login">
		<div class="wrap-login">
			<div class="logo-solo-login">				
				<img src="<c:url value="/resources/Content/images/system/logo_ER.jpg" />"> 
			</div>
			<div class="form-login">
			  	<form accept-charset="UTF-8" role="form" id="loginForm" method="post">				
			  		<div class="form-login-header">
			  			Autenticaci&oacute;n del usuario
			  		</div>
			        <div class="form-login-body">			        	   
				        <div class="form-group input-group">
				          <span class="input-group-addon ico-log ico-user-login">
				            <i class="">				            	
				            	<img src="<c:url value="/resources/Content/images/system/ico-user-login.png" />">
				            </i>
				          </span>
				          <input class="form-control" placeholder="Nombre de usuario"  type="text"
				          		 required="" autofocus="" id="login" name="login">		          
				        </div>
				    	
				        <div class="input-group">
				          <span class="input-group-addon ico-log ico-pass-login">
				            <i class="">
				            	<img src="<c:url value="/resources/Content/images/system/ico-user-pass.png" />">				            	
				            </i>
				          </span>
				          <input class="form-control" placeholder="Clave de usuario"   id="password" name="password" 
				          		 type="password" value="" required="">				          
				        </div>						        
				    </div>
				    
				    <div class="pull-center">
                       <div id="divMensajeInformacion" class="alert-custom">
                       </div>
                    </div>
                    <div class="col-xs-12" style="height:10px;"></div>
                    
			        <div class="form-login-footer">
			           <button type="button" class="btn-add" id="btnAceptar" name="btnAceptar">
			            Aceptar
			           </button>
			        </div>		 
			             
			    </form>
			</div>
		</div>		
	</section>
	
	<!-- footer -->  
    <footer class="login">
        <jsp:include page="template/footerlogin.jsp" />
    </footer>    
        
    <!--JS-->
    <script type="text/javascript" src="<c:url value="/resources/Scripts/modernizr/modernizr.custom.js" />"></script>
    <script type="text/javascript" src="<c:url value="/resources/Scripts/jquery/jquery-1.11.1.js" />"></script>
    <script type="text/javascript" src="<c:url value="/resources/Scripts/bootstrap-jquery-ui/js/bootstrap.js" />"></script>
    <script type="text/javascript" src="<c:url value="/resources/Scripts/app/common.js" />"></script>
    <script type="text/javascript" src="<c:url value="/resources/Scripts/jquery/jquery.serializejson.min.js" />"></script>
    <script type="text/javascript" src="<c:url value="/resources/Scripts/jquery-plugin/jquery-redirect-get-post/jquery.redirect.js" />"></script>
        <!--  PARA ALERTIFY -->
	<!-- JavaScript -->
    <script type="text/javascript">
        $(document).ready(function() {
            inicializarVariables();
            cargarComponentes();
        });

        var btnAceptar = null;
        var loginForm = null;
        var divCaptcha = null;
        var captchaActivado = false;
        var contraseniaPorVencer = false;
        var login = null;
        var password = null;
        
        function inicializarVariables(){
            btnAceptar = $('#btnAceptar');
            loginForm = $('#loginForm');
            divCaptcha = $('#divCaptcha');
            login = $('#login');
            password = $('#password'); 
        }

        function cargarComponentes(){
        
            btnAceptar.click(function(event){
              if(validarFormulario()){                 
                	  autenticarUsuario();                 
              }
              
            });

            function validarFormulario(){
                estado = true;
                if($.trim($('#login').val())==''){
                    mostrarMensajeError("Debe ingresar un login");
                    estado = false;
                } else if ($.trim($('#password').val())==''){
                    mostrarMensajeError('Debe ingresar un password');
                    estado = false;
                }
                return estado;
            }

            login.keypress(function(e) {
                if(e.which == 13) {
                  btnAceptar.click();
                }
              });

            password.keypress(function(e) {
              if(e.which == 13) {
                btnAceptar.click();
              }
            });
        }

        

        function autenticarUsuario(){
            var usuarioJson = JSON.stringify(loginForm.serializeJSON());
            $.ajax({
                url: "./autenticarUsuario",
                type: "POST",
                dataType: "json",
                data : {
                    usuario: usuarioJson
                }
            }).done(function(paramJson) {
                if(paramJson.estadoRespuesta=='OK'){
                	window.location.href = './cargarVentanaInicio'; 
                }else{
                    mostrarMensajeError(paramJson.mensajeRespuesta);                    
                }
            }).fail(function( jqXHR, textStatus, errorThrown ) {
                alert( "error"+errorThrown +", "+jqXHR+","+textStatus);
            });
        }
        
        function mostrarMensajeError(mensajeError){
            var mensajeHTML = '';
            mensajeHTML = '<div class="alert alert-danger" role="alert" style="height: auto!important;">';
            mensajeHTML = mensajeHTML + '<i class="fa fa-warning"></i>';
            mensajeHTML = mensajeHTML + mensajeError;
            $('#divMensajeInformacion div').remove();
            $('#divMensajeInformacion').append(mensajeHTML);
        }

    </script>
</body>
</html>