<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="pe.com.sistemaera.core.util.ConstanteServices"%>
<!DOCTYPE HTML>
<html lang="es">
<head>
    <jsp:include page="../../template/libreriasCabecera.jsp" />
</head>
<body class="skin-gym bar-white">
<section>
        <header class="header">
            <jsp:include page="../../template/header.jsp" />
        </header>
        <!--</header>-->
        <!-- nav -->
        <div class="menu">
            <jsp:include page="../../template/menu.jsp" />
        </div>

        <!--<wrap-content>-->
    <div class="wrap-content">
        <!--<pull-main-content>-->
        <div class="pull-main-content">
            <!--<main-content>-->
            <div class="main-content view-wrap">
                <!--<Body>-->
                <div class="content-body">
                    <div class="breadcrumbs">
                        :: Usted se encuentra en: <span>SEGURIDAD</span><span
                            class="nivel-bread"></span><span class="nivel-bread">/</span><span
                            class="active-view">ADMINISTRAR OPCIONES</span>
                    </div>
                    <div class="main-colum">
                        <div class="box-wrap-main">
                            <div class="box-wrap-header">
                                <div class="pull-left">
                                    <div class="title-main">
                                        Administrar <span>Opciones</span>
                                    </div>
                                </div>                                
                            </div>
                            <div class="box-wrap-body">
                                <h3 class="title-form">ARBOL DE OPCIONES</h3>
                                <!-- contenedor de arbol -->
                                <ul id="auto-checkboxes" data-name="rbOpcion">
                                </ul>


                                <!--FOOTER -->
                                <div class="box-acciones">
                                    <div class="pull-right">
                                        <button id="btnNuevo" name="btnNuevo" class="btn-s btn-add"
                                            data-toggle="modal" data-target="#nuevaOpcionModal">Nuevo</button>
                                        <button id="btnActualizar" name="btnActualizar" class="btn-s btn-clean">Actualizar</button>
                                        <button id="btnAnular" name="btnAnular" class="btn-s btn-clean">Anular</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- INICIO POP UP 1-->
                    <form accept-charset="UTF-8" role="form" id="nuevaOpcionForm"
                        method="post"  data-toggle="validator">

                        <div class="modal fade" id="nuevaOpcionModal" tabindex="-1"
                            role="dialog" aria-labelledby="myModalLabel">
                            <div class="modal-dialog" role="document">
                                <div class="modal-content">
                                    <div>
                                        </br>
                                        </br>
                                        <div class="row">
                                            <div class="col-sm-4">
                                                <div class="form-group">
                                                    <h3 class="title-form">NUEVA OPCIÓN</h3>
                                                </div>
                                            </div>
                                        </div>

                                    </div>
                                    <div class="modal-body">
                                        <div class="box-form modal-content ">
                                            <div class="row">
                                                <div class="col-sm-4">
                                                    <div class="form-group">
                                                        <label id="lblPermiso">Permiso Padre:</label>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="row">
                                                <div class="form-group">
                                                    <div class="col-sm-6">
                                                        <label id="lblPermisoPadre" name="lblIdPadre">0</label>
                                                        <input id="txtIdOpcion" name="idOpcion" type="hidden" value="" >
                                                        <input id="txtIdPadre" name="idPadre" type="hidden" value="" >
                                                        
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="row">
                                                <div class="form-group">
                                                    <div class="col-sm-4">
                                                        <label>Nombre: <span style="color: red;">(*)</span></label>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="row">
                                                <div class="form-group">                                                    
                                                    <div class="col-sm-12">
                                                        <input type="text" id="txtNombreOpcion"    name="nombreOpcion" class="form-control" maxlength="100">
                                                    </div>
                                                    <div class="col-sm-4">
                                                        <input type="hidden" id="txtCodigoOpcion"
                                                            name="codigoOpcion" class="form-control" >
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="row">
                                                <div class="form-group">
                                                    <div class="col-sm-4">
                                                        <label>Tipo Opción : <span style="color: red;">(*)
                                                        </span></label>
                                                    </div>
                                                    <div class="col-sm-4">
                                                        <label>Estado Opción: <span style="color: red;">(*)
                                                        </span></label>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="row">
                                                <div class="form-group">
                                                    <div class="col-sm-4">
                                                        <select id="ddl-tipoOpcion" name="tipoOpcion"
                                                            class="form-control">
                                                        </select>
                                                    </div>
                                                    <div class="col-sm-4">
                                                    <select id="ddl-estadoOpcion" name="estadoRegistro"
                                                            class="form-control" >
<!--                                                         <select id="ddl-estadoOpcion" name="estadoRegistro" -->
<!--                                                             class="form-control" disabled> -->
                                                            <option name="estadoRegistro" value="A">Activo</option>
                                                            <option name="estadoRegistro" value="I" >Inactivo</option>
                                                        </select>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="row">
                                                <div class="form-group">
                                                    <div class="col-sm-4">
                                                        <label>Accion (opcional) :</label>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="row">
                                                <div class="form-group">
                                                    <div class="col-sm-12">
                                                        <input type="text" id="txtAccionOpcion"
                                                            name="valorAccion" class="form-control" maxlength="100">
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="modal-footer">
                                    <div id="mensajeInformacion" class="pull-left alert-custom"></div>
                                        <div class="pull-right">
                                            <button type="button" id="btnGrabar" name="btnGrabar" class="btn-s btn-add" >Grabar</button>
                                            <button id="btnCancelar" name="btnCancelar" class="btn-s btn-clean" >Cancelar</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        
                        <!--POPUP CONFIRMACION -->
                        <div id="modalAnular" class="modal fade">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                      <div class="modal-body">
                                        <p>¿Desea anular la opcion seleccionada y todas sus opciones dependientes?</p>
                                      </div>
                                      <div class="modal-footer">                                        
                                        <button type="button" id="btnSi" class="btn-s btn-add">SI</button>
                                        <button type="button" id="btnNo" class="btn-s btn-clean" data-dismiss="modal">NO</button>
                                  </div>
                                </div>
                            </div>
                        
                        </div>
                        <!--POPUP CONFIRMACION -->
                        
                        <!-- Modal Actualizar-->
                            <div class="modal fade" id="mdlAlertaActualizar" tabindex="-1"
                                role="dialog" aria-labelledby="exampleModalLabel">
                                <div class="modal-dialog" role="document">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <button type="button" class="close" data-dismiss="modal"
                                                aria-label="Close">
                                                <span aria-hidden="true">&times;</span>
                                            </button>
                                            <h4 class="modal-title" id="exampleModalLabel">Actualizar</h4>
                                        </div>
                                        <div class="modal-body">Debe seleccionar una opción</div>
                                        <div class="modal-footer">                                                                                        
                                        </div>
                                    </div>
                                </div>
                            </div>
                            
                            <!-- Modal Anular-->
                            <div class="modal fade" id="mdlAlertaAnular" tabindex="-1"
                                role="dialog" aria-labelledby="exampleModalLabel">
                                <div class="modal-dialog" role="document">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <button type="button" class="close" data-dismiss="modal"
                                                aria-label="Close">
                                                <span aria-hidden="true">&times;</span>
                                            </button>
                                            <h4 class="modal-title" id="exampleModalLabel">Anular</h4>
                                        </div>
                                        <div class="modal-body">Debe seleccionar una opción</div>
                                        <div class="modal-footer">                                                                                        
                                        </div>
                                    </div>
                                </div>
                            </div>



                        </form>
                <!--  FIN POP UP 1-->
                </div>
                <!--<Body>-->
            </div>
            <!--<main-content>-->
            <footer class="login inter-foot">
                                  <jsp:include page="../../template/footer.jsp" />
            </footer>
        </div>
    </div>
</section>

    <!-- SCRIPTS -->
    <jsp:include page="../../template/libreriasFooter.jsp" />
<!--     <footer class="login"> -->
<%--         <jsp:include page="../../template/footerlogin.jsp" /> --%>
<!--     </footer> -->
    
    <script type="text/javascript">
        $(document).ready(function() {
            inicializarVariables();
            cargarComponentes();
            generarMenu();
            $('#auto-checkboxes').bonsai({
                 ///expandAll: true,
                 checkboxes: true, // depends on jquery.qubit plugin
                 createInputs: 'radio' // takes values from data-name and data-value, and data-name is inherited
             });
        });

        //INICIALIZAR VARIABLES
        var btnGrabar = null;
        var btnActualizar = null;
        var btnNuevo = null;
        var btnCancelar = null;
        var btnAnular = null;
        var nuevaOpcionForm = null;
        var txtIdOpcion = null;
        var lblcodigoRepuesta = null;

        var ddltipoOpcion = null;
        var txtCodigoOpcion = null;
        var txtNombreOpcion = null;
        var ddlestadoOpcion = null;
        var txtAccionOpcion = null;
        var lblPermisoPadre = null;
        var txtIdPadre = null;
        var lblResultado = null;
        var btnSi = null;
        var btnNo = null;
        
        function inicializarVariables() {
            
            btnActualizar =$('#btnActualizar'); 
            nuevaOpcionForm = $('#nuevaOpcionForm');
            btnCancelar = $('#btnCancelar');
            nuevaOpcionForm = $('#nuevaOpcionForm');
            btnNuevo = $('#btnNuevo');
            btnAnular = $('#btnAnular');
            btnSi = $('#btnSi');
            btnNo = $('#btnNo');

            //modal
            btnGrabar = $('#btnGrabar');
            txtCodigoOpcion = $('#txtCodigoOpcion');
            ddltipoOpcion = $('#ddl-tipoOpcion');
            txtNombreOpcion = $('#txtNombreOpcion');
            ddlestadoOpcion = $('#ddl-estadoOpcion');
            txtAccionOpcion = $('#txtAccionOpcion');
            lblPermisoPadre = $('#lblPermisoPadre');
            txtIdOpcion = $('#txtIdOpcion');
            txtIdPadre = $('#txtIdPadre');
            lblcodigoRepuesta = $('#lblcodigoRepuesta');
        }

        function cargarComponentes() {

            var listaTipoOpcion= ${listaTipoOpcion};
            ddltipoOpcion.append($("<option/>").attr("value","").text("Seleccionar"));
            $.each(listaTipoOpcion, function(i, item) {
                ddltipoOpcion.append($("<option/>").attr("value",listaTipoOpcion[i].idDetalleParametro).text(listaTipoOpcion[i].descripcion)); 
            });

            btnGrabar.click(function(event) {

                if (ddlestadoOpcion.is(":disabled")) {
                    ddlestadoOpcion.prop('disabled', false);
                }
                
                if( validarFormulario() ){

                    var opcionJson = JSON.stringify(nuevaOpcionForm.serializeJSON());
                    $.ajax({
                        url : "./grabarOpcion",
                        type : "POST",
                        dataType : "json",
                        data : {
                            opcion : opcionJson
                        }
                    }).done(function(paramJson) {

                        limpiarComponentes();
                        $('#nuevaOpcionModal').modal('toggle');
                        location.replace(location.pathname)                
            
                    }).fail(function(jqXHR, textStatus, errorThrown) {
                      validarFinDeSesion(jqXHR, textStatus, errorThrown, '<%= ConstanteServices.MENSAJE_SESION_EXPIRADA %>');
                    });

                     }

            });

            btnActualizar.click(function(event) {

                if (ddlestadoOpcion.is(":disabled")) {
                    ddlestadoOpcion.prop('disabled', false);
                }
                
                var selectedRadio = $("input[type='radio'][name=rbOpcion]:checked");
                var idOpcion = selectedRadio.val();
                if(idOpcion != null){
                    
                    txtIdOpcion.val(idOpcion);
                    $('#nuevaOpcionModal').modal('toggle');
                    
                    $.ajax({
                        url : "./actualizarOpcion",
                        type : "POST",
                        dataType : "json",
                        data : {
                            idOpcion : idOpcion
                        }
                    }).done(function(paramJson) {

                        var nombrePadre = paramJson.nombrePadre;
                        var idPadre = paramJson.idPadre
                        lblPermisoPadre.text(nombrePadre);
                        
                        txtCodigoOpcion.val(paramJson.opcion.codigoOpcion) ;
                        txtNombreOpcion.val(paramJson.opcion.nombreOpcion);
                        txtAccionOpcion.val(paramJson.opcion.valorAccion);
                        ddltipoOpcion.val(paramJson.opcion.tipoOpcion);
                        ddlestadoOpcion.val(paramJson.opcion.estadoRegistro);

                        var idPadre = paramJson.idPadre; 
                        txtIdPadre.val(idPadre);
                
                    }).fail(function(jqXHR, textStatus, errorThrown) {
                    	validarFinDeSesion(jqXHR, textStatus, errorThrown, '<%= ConstanteServices.MENSAJE_SESION_EXPIRADA %>');
                    });
                }
                else{
                    $('#mdlAlertaActualizar').modal('show');                        
                }

            });


            btnAnular.click(function(event) {
                var selectedRadio = $("input[type='radio'][name=rbOpcion]:checked");
                var idOpcion = selectedRadio.val();
                if(idOpcion != null){
                    $('#modalAnular').modal('toggle');
                }
                else{
                    $('#mdlAlertaAnular').modal('show');
                }
            });
            
            btnSi.click(function(event) {

                var selectedRadio = $("input[type='radio'][name=rbOpcion]:checked");
                var idOpcion = selectedRadio.val();
                if(idOpcion != null){                    
                    $.ajax({
                        url : "./darBajaOpcion",
                         type : "POST",
                         dataType : "json",
                         data : {
                             idOpcion : idOpcion
                        }
                    }).done(function(paramJson) {
                        location.replace(location.pathname)
                        
                    }).fail(function(jqXHR, textStatus, errorThrown) {
                      validarFinDeSesion(jqXHR, textStatus, errorThrown, '<%= ConstanteServices.MENSAJE_SESION_EXPIRADA %>');
                    });
                }
                else{
                        alert("Debe seleccionar una opcion.");
                }

            });
    
            btnNo.click(function(event) {
                limpiarComponentes();
                $('#modalAnular').modal('hide');
                
            });
        
            btnNuevo.click(function(event) {
                ddlestadoOpcion.prop('disabled', 'disabled');

                var selectedRadio = $("input[type='radio'][name=rbOpcion]:checked");
                
                var idOpcion = selectedRadio.val();
                if(idOpcion == null){
                    idOpcion = 0;
                }

                txtIdOpcion.val(idOpcion);

                $.ajax({
                    url : "./nuevaOpcion",
                    type : "POST",
                    dataType : "json",
                    data : {
                        idOpcion : idOpcion
                    }
                }).done(function(paramJson) {
                    var nombrePadre = paramJson.nombrePadre;
                    var idPadre = paramJson.idPadre;
                    
                    lblPermisoPadre.text(nombrePadre);
                    txtIdPadre.val(idPadre);
                    txtIdOpcion.val("");
                }).fail(function(jqXHR, textStatus, errorThrown) {
                	validarFinDeSesion(jqXHR, textStatus, errorThrown, '<%= ConstanteServices.MENSAJE_SESION_EXPIRADA %>');
                });
            });

            btnCancelar.click(function(event) {
                $('#nuevaOpcionModal').modal('hide');
                limpiarComponentes();
            });
    }

        function generarMenu() {
            var listaOpciones = ${listaOpciones};
            var arbolOpciones = $('#auto-checkboxes');
            $.each(listaOpciones,function(index, value) {
                var txt = '';
                txt = txt + "<li data-value='" + value.idOpcion + "' data-id='" + value.codigoOpcion + "'>";
                if (value.estadoRegistro=='I'){
                    txt = txt + '<font color="#A4A7A7">';
                	txt = txt + value.nombreOpcion + ' (anulado)';
                	txt = txt + '</font>'
                }else{
                	txt = txt + value.nombreOpcion;
                }
                txt = txt + "</li>";
                var parent;
                if (value.nivel == 0) {
                    parent = arbolOpciones;
                }else {
                    var $elem = arbolOpciones.find("li[data-value='"+ value.idPadre + "']");
                    if ($elem.find("ul").length == 0) {
                        $elem.append("<ul>");
                    }
                    parent = $elem.find("ul:first");
                }
                parent.append(txt);
            });
        }

        function limpiarComponentes(){
            if (ddlestadoOpcion.is(":disabled")) {
                ddlestadoOpcion.prop('disabled', false);
            }
            
            txtCodigoOpcion.val("");
            txtCodigoOpcion.text("");
            
            txtNombreOpcion.val("");
            txtNombreOpcion.text("");
            
            txtAccionOpcion.val("");
            txtAccionOpcion.text("");
            
            lblPermisoPadre.val("");
            lblPermisoPadre.text("");
            
            txtIdOpcion.val("");
            txtIdOpcion.text("");
            
            txtIdPadre.val("");
            txtIdPadre.text("");
            
            }

        function validarFormulario(){
            if(txtNombreOpcion.val() == '' || ddltipoOpcion.val() == '' || ddlestadoOpcion == ''){
                mostrarMensajeError('Deben ingresar los campos obligatrios.');
                return false;
            }
            else
                return true;
            }
        
        function mostrarMensajeError(mensajeError) {
            $('#mensajeInformacion').empty();
            var mensajeHTML = '';
            mensajeHTML = '<div class="alert alert-danger" role="alert" style="height: auto!important;">';
            mensajeHTML = mensajeHTML + '<i class="fa fa-warning"></i>';
            mensajeHTML = mensajeHTML + mensajeError;
            $('#mensajeInformacion').append(mensajeHTML);
            }

    </script>

</body>
</html>