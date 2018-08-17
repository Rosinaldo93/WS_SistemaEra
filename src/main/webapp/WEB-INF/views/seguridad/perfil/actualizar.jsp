<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="pe.com.sistemaera.core.util.ConstanteServices"%>
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
                                               :: Usted se encuentra en: <span>SEGURIDAD</span><span
                                                      class="nivel-bread">/</span><span>ADMINISTRAR PERFILES</span><span
                                                      class="nivel-bread">/</span><span class="active-view">ACTUALIZAR
                                                      PERFIL</span>
                                        </div>
                                        <div class="main-colum">
                                               <!-- wrap -->
                                               <div class="box-wrap-main">
                                                      <div class="box-wrap-header">
                                                            <div class="pull-left">
                                                                   <div class="title-main">
                                                                          Actualizar <span>Perfil</span>
                                                                   </div>
                                                            </div>
                                                            <div class="pull-right"></div>
                                                      </div>
                                                      <form role="form" id="actualizarPerfilForm"
                                                            name="actualizarPerfilForm" method="post">
                                                            <div class="box-wrap-body">
                                                                   <h3 class="title-form">DATOS DEL PERFIL</h3>
                                                                   <div class="box-form">
                                                                          <div class="row">
                                                                                 <div class="col-sm-4">
                                                                                       <div class="form-group">
                                                                                              <label>Nombre:</label> <span style="color: red;">
                                                                                                     (*)</span> <input type="text" id="txtNombre" name="nombre"  onkeypress="return validarn(event)"
                                                                                                     class="form-control" maxlength="40">
                                                                                       </div>
                                                                                 </div>
                                                                                 <div class="col-sm-2">
                                                                                       <div class="form-group">
                                                                                              <label>Estado: </label> <select  
                                                                                              name="estadoRegistro"  
                                                                                                     id="cbEstado" class="form-control">
                                                                                                     <option value="A">Activo</option>
                                                                                                     <option value="I">Inactivo</option>
                                                                                              </select>
                                                                                       </div>
                                                                                 </div>

                                                                          </div>
                                                                          <div class="row">
                                                                                 <div class="col-sm-8">
                                                                                       <div class="form-group">
                                                                                              <label>Descripción:</label> <span style="color: red;">
                                                                                                     (*)</span> <input type="text" id="txtDescripcion"  onkeypress="return validarLetras(event)"
                                                                                                     name="descripcion"
                                                                                                     class="form-control" maxlength="300">
                                                                                       </div>
                                                                                 </div>
                                                                          </div>
                                                                   </div>

                                                                   <h3 class="title-form">ASIGNACIÓN DE PERMISOS A OPCIONES</h3>

                                                                   <div class="box-form">
                                                                          <div class="row">
                                                                                 <h3>
                                                                                       <a href="#"> </a>
                                                                                 </h3>
                                                                                 <ul id="auto-checkboxes" data-name="opciones[]">
                                                                                 
                                                                                 </ul>
                                                                          </div>
                                                                   </div>
                                                            </div>
                                                            <div class="box-acciones">
                                                                   <div class="pull-left">
                                                                          <div id="divMensajeInformacion" class="alert-custom"></div>
                                                                   </div>
                                                                   <div class="pull-left">
                                                                          <div id="divMensajeInformacion1" class="alert-custom"></div>
                                                                   </div>
                                                                   <div class="pull-right">
                                                                          <button type="button" id="btnGrabar" name="btnGrabar"
                                                                                 class="btn-add">Grabar</button>
                                                                          <button type="button" class="btn-s btn-clean"
                                                                                 id="btnCancelar" name="btnCancelar">Cancelar</button>
                                                                   </div>
                                                                   <input type="hidden" id="txtId" name="idPerfil" value="">
                                                            </div>
                                                      </form>
                                               </div>

                                        </div>
                                        <!-- cierra wrap -->
                                  </div>
                           </div>
                           <footer class="login inter-foot">
                                  <jsp:include page="../../template/footer.jsp" />
                           </footer>

                           <!--</main-content>-->

                           <!--</pull-main-content>-->

                           <!--</wrap-content>-->
                           <div class="up-page upPage">
                                  <span class="glyphicon glyphicon-chevron-up"></span>
                           </div>
       </section>


       <!--JS-->
       <jsp:include page="../../template/libreriasFooter.jsp" />
       <script type="text/javascript">

       
             $(document).ready(function() {
                    inicializarVariables();
                    cargarComponentes();
                    generarMenu();
                    $('#auto-checkboxes').bonsai({
                        checkboxes: true, // depends on jquery.qubit plugin
                        createInputs: 'checkbox' // takes values from data-name and data-value, and data-name is inherited
                    });
             });

             //INICIALIZAR VARIABLES
             var btnGrabar = null;
             var actualizarPerfilForm = null;
             var cbEstado = null;
             var txtId = null;
             var btnCancelar = null;
             var txtDescripcion = null;
             var txtNombre = null;

             // var id = null ;

             function inicializarVariables() {
                    btnGrabar = $('#btnGrabar');
                    btnCancelar = $('#btnCancelar');
                    actualizarPerfilForm = $('#actualizarPerfilForm');
                    txtNombre = $('#txtNombre');
                    txtDescripcion = $('#txtDescripcion');
                    cbEstado = $('#cbEstado');
                    txtId = $('#txtId');
             }

             function cargarComponentes() {
                    var perfil = ${perfil};
                    txtNombre.val(perfil.nombre);
                    txtDescripcion.val(perfil.descripcion);
                    cbEstado.val(perfil.estadoRegistro);
                    txtId.val(perfil.idPerfil);

                    if (cbEstado.val()=='A' ){
                           cbEstado.attr('disabled', 'disabled');
                    }

                    btnGrabar.click(function(event) {
                           if (validarFormulario()) {
                                  var perfilJson = JSON.stringify(actualizarPerfilForm.serializeJSON({checkboxIndeterminateValue: "false"}));
                                     var mensaje = "actualizado-";
                                  $.ajax({
                                        url : "./actualizarPerfil",
                                        type : "POST",
                                        dataType : "json",
                                          data : {
                                          	perfil : perfilJson,
                                          	mensaje : mensaje}}).done( function(paramJson) {
                                            	   window.location.href='./cargarVentanaBuscarPerfil?mensaje='+paramJson + txtNombre.val();   
                                            }).fail(function(jqXHR, textStatus, errorThrown) {
                                            	   validarFinDeSesion(jqXHR, textStatus, errorThrown, '<%= ConstanteServices.MENSAJE_SESION_EXPIRADA %>');
                                            });
                           }
                    });

                    btnCancelar.click(function(event) {
                           window.location.href = './cargarVentanaBuscarPerfil';
                    });

             }

             function validarFormulario() {
                    var textBox1 = document.getElementById("txtNombre");
                    var textLength1 = textBox1.value.length;
                    var textBox2 = document.getElementById("txtDescripcion");
                    var textLength2 = textBox2.value.length;
                 var check=$("input[type='checkbox']:checked").length;
                    var estado = true;
            if ($('#txtNombre').val() == '' && txtDescripcion.val() == '' &&  $('#txtNombre').val().trim() === '' &&  txtDescripcion.val().trim() === '') {
                mostrarMensajeError('Debe ingresar los campos obligatorios.');
                estado = false;            
         } else if ($('#txtNombre').val() == '' && $('#txtNombre').val().trim() === '') {
                mostrarMensajeError('El campo Nombre no puede estar vacío');
                estado = false;
         } else if (txtDescripcion.val() == '' && txtDescripcion.val().trim() === '' ) {
                mostrarMensajeError('El campo Descripción no puede estar vacío');
                estado = false;
         } else if (textLength1 < 3) {
                mostrarMensajeError('El nombre de perfil ingresado debe tener tres(3) caracteres de longitud como mínimo y no contener caracteres especiales');
                estado = false;
         } else if (textLength2 < 3) {
                mostrarMensajeError('La descripción del perfil ingresado debe tener tres(3) caracteres de longitud como mínimo y no contener caracteres especiales');
                estado = false;
      }  else if (check==""){
                 mostrarMensajeError('Seleccione al menos una opción.');
                    return estado=false;
                           }
         return estado;
  }

             function mostrarMensajeError(mensajeError) {
                    var mensajeHTML = '';
                    mensajeHTML = '<div class="alert alert-danger" role="alert" style="height: auto!important;">';
                    mensajeHTML = mensajeHTML + '<i class="fa fa-warning"></i>';
                    mensajeHTML = mensajeHTML + mensajeError;
                    $('#divMensajeInformacion div').remove();
                    $('#divMensajeInformacion').append(mensajeHTML);
             }

             function mostrarMensajeConfirmación(mensajeConf) {
                    $('#divMensajeInformacion div').remove();
                    var mensajeHTML = '';
                    mensajeHTML = '<div class="alert alert-success" role="alert" style="height: auto!important;">';
                    mensajeHTML = mensajeHTML + '<i class="fa fa-warning"></i>';
                    mensajeHTML = mensajeHTML + mensajeConf;
                    $('#divMensajeInformacion1 div').remove();
                    $('#divMensajeInformacion div').remove();
                    $('#divMensajeInformacion1').append(mensajeHTML);
             }

             function validarn(e) {
                    tecla = (document.all) ? e.keyCode : e.which;
                    if (tecla == 8)
                           return true;
                    if (tecla == 9)
                           return true;
                    if (tecla == 11)
                           return true;
                    patron = /[A-Za-zñÑ0-9\s]/;
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

             function generarMenu() {
                    var listaOpciones = ${listaOpciones};
                    var arbolOpciones = $('#auto-checkboxes');
                    var listaIdOpcion = ${listaIdOpcion};
                    $.each(listaOpciones, function(index, value) {
                    	if(value.estaSeleccionado==null){                    	
                            value.estaSeleccionado = '0';
                    	}
                        var txt = '';
                        txt = txt + "<li data-checked='" + value.estaSeleccionado + "' data-value='" + value.idOpcion + "' data-id='" + value.idOpcion + "'>";
                        txt = txt + value.nombreOpcion;
                        txt = txt + "</li>";
                        var parent;
                        if (value.nivel == 0) {
                            parent = arbolOpciones;
                        }else {
                            var $elem = arbolOpciones.find("li[data-id='"+ value.idPadre + "']");
                            if ($elem.find("ul").length == 0) {
                                if (value.nivel == 1) {
                                    $elem.append("<ul>");
                                } else {
                                    $elem.append("<ul>");
                                }
                            }
                            parent = $elem.find("ul:first");
                        }
                        parent.append(txt);
                        /*var idOpcion = value.idOpcion;
                        if (validarIndice(listaIdOpcion, idOpcion) == true) {
                              $("[id*=" + idOpcion + "]").prop('checked',true);
                        }*/
                  });
             }

             function validarIndice(listaIdOpcion, id) {
                 var valor = false;
                 $.each(listaIdOpcion, function(index, value) {
                     if (id == value) {
                         valor = true;
                     }
                 });
                 return valor;
             }

//           cbEstado.change(function(event){ 
//                   estadoRegistro = $( "#cbEstado option:selected").text();
//                  if (perfil.estadoRegistro.val()=='I') {                 
//                  $('#cbEstado').removeAttr('disabled');                
//                  }
//                  else{
//                         $('#cbEstado').attr('disabled','disabled');       
//               }     
//            }); 
             
       </script>
</body>
</html>

