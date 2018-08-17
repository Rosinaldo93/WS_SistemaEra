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
                            <span>SEGURIDAD</span>
                            <span class="nivel-bread">/</span>
                            <span class="active-view">ADMINISTRAR USUARIO</span>
                        </div>
                        <div class="main-colum">
                            <!-- wrap -->
                            <div class="box-wrap-main">
                                <div class="box-wrap-header">
                                    <div class="pull-left">
                                        <div class="title-main">
                                            Buscar <span>Usuario</span>
                                        </div>
                                    </div>                                    
                                </div>

                                <div class="box-wrap-body">
                                    <h3 class="title-form">Filtros de Búsqueda</h3>
                                    <div class="box-form">
                                        <form id="formUsuarioBusqueda">
                                            <div class="row">
                                                <div class="col-sm-4">
                                                    <div class="form-group">
                                                        <label>Login Usuario: </label> 
                                                        <input type="text" id="txtLogin" name="login" class="form-control">
                                                    </div>
                                                </div>
                                                <div class="col-sm-4">
                                                    <div class="form-group">
                                                        <label>Número de documento:</label>
                                                        <div class="row">
                                                            <div class="col-sm-6">
                                                                <select id="selTipoDocumentoIdentidad" name="idTipoDocumentoIdentidad" class="form-control">
                                                                </select>
                                                            </div>
                                                            <div class="col-sm-6">
                                                                <input id="txtNumeroDocumentoIdentidad" name="numeroDocumentoIdentidad" type="text" class="form-control">
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-sm-4">
                                                    <div class="form-group">
                                                        <label>Correo Electrónico</label> 
                                                        <input type="text"  id="txtNombreCorreoElectronico" name="correoElectronico" class="form-control">
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-sm-4">
                                                    <div class="form-group">
                                                        <label>Nombres: </label> 
                                                        <input type="text" id="txtNombres" name="nombres" class="form-control">
                                                    </div>
                                                </div>
                                                <div class="col-sm-4">
                                                    <div class="form-group">
                                                        <label>Apellido Paterno</label> 
                                                        <input type="text" id="txtApellidoPaterno" name="apellidoPaterno" class="form-control">
                                                    </div>
                                                </div>
                                                <div class="col-sm-4">
                                                    <div class="form-group">
                                                        <label>Apellido Materno</label>
                                                        <input type="text" id="txtApellidoMaterno" name="apellidoMaterno" class="form-control">
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-sm-4">
                                                    <div class="form-group">
                                                        <div class="row">
                                                            <div class="col-sm-6">
                                                                <div class="form-group">
                                                                    <label>Perfil:</label>
                                                                     <select id="selPerfil" name="idPerfil" class="form-control">
                                                                    </select>
                                                                </div>
                                                            </div>
                                                            <div class="col-sm-6">
                                                                <div class="form-group">
                                                                    <label>Estado</label> 
                                                                    <select id="selEstado" name="estadoRegistro" class="form-control">
                                                                        <option value="">Seleccionar</option>
                                                                        <option value="A">ACTIVO</option>
                                                                        <option value="I">INACTIVO</option>
                                                                    </select>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </form>
                                    </div>
                                    
                                    <!--FOOTER -->
                                    <div class="box-acciones">
                                        <div class="pull-left">
                                            <div id="divMensajeInformacion" class="alert-custom">
                                            </div>
                                        </div>
                                        <div class="pull-right">
                                            <button type="button" id="btnBuscar" class="btn-s btn-search">Buscar</button>
                                            <button type="button" id="btnNuevo" class="btn-s btn-add">Nuevo</button>
                                            <button type="button" id="btnLimpiar" class="btn-s btn-clean" > Limpiar</button>                                            
                                        </div>
                                    </div>
                                    <table id="tblUsuarios" data-flat="true" data-show-export="true">
                                    </table>
                                    <div class="table-responsive">
                                    </div>
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
            <h4 class="modal-title" id="exampleModalLabel"></h4>
          </div>
          <div class="modal-body">
            <span id="txtTitulo"></span>
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
            mostrarOpciones();
        });

        //INICIALIZAR VARIABLES
        var tblUsuarios = null;
        var btnNuevo = null;
        var btnBuscar = null;
        var selTipoDocumentoIdentidad = null;
        var selPerfil = null;        
        var selEstado = null;
        var formUsuarioBusqueda = null;
        var btnSiModal = null; 
        var mdlEliminar = null;
        var btnExportar = null;
        var btnLimpiar = null;
        var idUsuarioTabla  = null;
        var txtNumeroDocumentoIdentidad = null;
        var tamanio=0;
      
        var listaOpciones = null;       

        function inicializarVariables(){
            tblUsuarios = $('#tblUsuarios');
            btnNuevo = $('#btnNuevo');
            btnBuscar = $('#btnBuscar');
            selTipoDocumentoIdentidad = $('#selTipoDocumentoIdentidad');
            selPerfil =$('#selPerfil');            
            selEstado =$('#selEstado');
            formUsuarioBusqueda =$('#formUsuarioBusqueda');
            btnSiModal = $('#btnSiModal');
            mdlEliminar = $('#mdlEliminar');
            btnExportar = $('#btnExportar');
            btnLimpiar = $('#btnLimpiar');
            txtNumeroDocumentoIdentidad = $('#txtNumeroDocumentoIdentidad');
        }

        function cargarComponentes(){
            var listaTipoDocumento = ${listaTipoDocumento};
            
            agregarItem(selTipoDocumentoIdentidad);
            agregarListaItem(selTipoDocumentoIdentidad, listaTipoDocumento, "idDetalleParametro", "descripcionCorta");
            
            
            var listaPerfiles = ${listaPerfiles};
            agregarItem(selPerfil);
            agregarListaItem(selPerfil, listaPerfiles, "idPerfil", "nombre");
            
            listaOpciones = ${listaOpciones};

            txtNumeroDocumentoIdentidad.prop("readonly",true);
            
            
            
		tblUsuarios.bootstrapTable({

            clickToSelect: true,
            exportDataType: 'all',
            exportOptions: {
                fileName: 'listaUsuarios',
                ignoreColumn: [0, 11]
            },
            pagination: true,
            pageSize: 10,
            formatShowingRows: function (pageFrom, pageTo, totalRows) {
                return '';
            },
            formatRecordsPerPage: function(pageNumber){
                return '';
            },
            columns: [
            		{
						field : 'nro',
						title : 'Nro',
						align : 'center',
						valign : 'bottom',
						sortable : false,
						formatter: 'formatoNro'
					 },
                    {
                        field: 'login',
                        title: 'Login',
                        align: 'left',
                        valign: 'bottom',
                        sortable: false
                    },
                    {
                        field: 'nombre',
                        title: 'Nombre',
                        align: 'left',
                        valign: 'bottom',
                        sortable: false
                    },
                    {
                        field: 'apellidoPaterno',
                        title: 'Apellido Pat.',
                        align: 'left',
                        valign: 'bottom',
                        sortable: false
                    },
                    {
                        field: 'apellidoMaterno',
                        title: 'Apellido Mat.',
                        align: 'left',
                        valign: 'bottom',
                        sortable: false
                    },
                    {
                        field: 'descripcionPerfil',
                        title: 'Perfil',
                        align: 'center',
                        valign: 'bottom',
                        sortable: false
                    }, 
                    {
                        field: 'numeroDocumentoIdentidad',
                        title: 'Documento Identidad',
                        align: 'center',
                        valign: 'bottom',
                        sortable: false
                    },                   
                    {
                        field: 'estadoRegistro',
                        title: 'Estado',
                        align: 'center',
                        valign: 'bottom',
                        sortable: false
                    },
                    {
                        field: 'id',
                        title: 'ID',
                        visible: false
                    },                    
                    {
                        field: 'operate',
                        title: 'Acción',
                        align: 'center',
                        valign: 'bottom',
                        sortable: false,
                        formatter: 'crearAcciones',
                        class: 'controls',
                        events : operateEvents
                    }
                
            ]
        });            
            
            var mensaje = ${mensaje};
            if(mensaje!=""){
                mostrarMensajeConfirmacion(mensaje);
            }

            function mostrarMensajeConfirmacion(mensaje){
                var mensajeHTML = '';
                mensajeHTML = '<div class="alert alert-success" role="alert" style="height: auto!important;">';
                mensajeHTML = mensajeHTML + '<i class="fa fa-check"></i>';
                mensajeHTML = mensajeHTML + mensaje;
                $('#divMensajeInformacion div').remove();
                $('#divMensajeInformacion').append(mensajeHTML);
            }

            function mostrarMensajeError(type,icon,mensajeError)
            {
                var mensajeHTML = '';
                mensajeHTML = '<div class="alert alert-'+type+'" role="alert" style="height: auto!important;">';
                mensajeHTML = mensajeHTML + '<i class="'+icon+'"></i>';
                mensajeHTML = mensajeHTML + mensajeError;
                $('#divMensajeInformacion div').remove();
                $('#divMensajeInformacion').append(mensajeHTML);
            }
            

            
            btnNuevo.click(function(event){
                window.location.href = './cargarVentanaRegistrarUsuario';
            });

          btnExportar.click(function(event){
              tblUsuarios.bootstrapTable('refreshOptions', {
                  exportDataType: 'excel',
                  fileName: 'usuarios'
              });
          });
          
          btnSiModal.click(function(event){
              var idUsuario = mdlEliminar.data('idUsuario');
              var login = mdlEliminar.data('login');
              var indicador = mdlEliminar.data('indicador');
              var parametrosBusquedaJson = JSON.stringify(formUsuarioBusqueda.serializeJSON());
              $.ajax({
                  url: "./accionEliminarUsuario",
                  type: "POST",
                  dataType: "json",
                  cache: false,
                  data : {
                     idUsuario : idUsuario,
                     parametrosBusqueda : parametrosBusquedaJson
                  }
               }).done(function(paramJson) {
                   mdlEliminar.modal('hide');
                   tblUsuarios.bootstrapTable('load', paramJson);
                   if(indicador == 'A'){
                   		mostrarMensajeConfirmacion('Se Activo el usuario con código de login: '+login);
                   }else if(indicador == 'I'){
                   		mostrarMensajeConfirmacion('Se anuló el usuario con código de login: '+login);
                   }                   
               }).fail(function( jqXHR, textStatus, errorThrown ) {
            	   validarFinDeSesion(jqXHR, textStatus, errorThrown, '<%= ConstanteServices.MENSAJE_SESION_EXPIRADA %>');
               });
            });
            
            btnBuscar.click(function(event){
                if(validarFormulario()){
                    $('#divMensajeInformacion div').remove();
                    var parametrosBusquedaJson = JSON.stringify(formUsuarioBusqueda.serializeJSON());
                    $.ajax({
                        url: "./accionBuscarUsuario",
                        type: "POST",
                        dataType: "json",
                        cache: false,
                        data : {
                               parametrosBusqueda : parametrosBusquedaJson
                        }
                    }).done(function(paramJson) {
                        tblUsuarios.bootstrapTable('load', paramJson);
                    }).fail(function( jqXHR, textStatus, errorThrown ) {
                        validarFinDeSesion(jqXHR, textStatus, errorThrown, '<%= ConstanteServices.MENSAJE_SESION_EXPIRADA %>');
                    });
                }
            });

            btnLimpiar.click(function(event){
                $('#divMensajeInformacion div').remove();
                $('#formUsuarioBusqueda')[0].reset();

                txtNumeroDocumentoIdentidad.prop("readonly",true);
              });

            tblUsuarios.bootstrapTable({
            }).on('check.bs.table', function (e, row) {
                idUsuarioTabla = (row.idUsuario);
            });

            selTipoDocumentoIdentidad.change(function(){
                if(selTipoDocumentoIdentidad.val() == '<%=ConstantesParametros.idOpcionSeleccione%>'){
                    txtNumeroDocumentoIdentidad.val("");
                    txtNumeroDocumentoIdentidad.prop("readonly",true);
                }else{
                	txtNumeroDocumentoIdentidad.prop("readonly", false);
                    changeTipoDocu("#selTipoDocumentoIdentidad", "#txtNumeroDocumentoIdentidad", "#formUsuarioBusqueda");
                }
            });

            function validarFormulario()
            {
                var correcto=true;
                var lenNroDocumento = txtNumeroDocumentoIdentidad.val().length;
                if(lenNroDocumento<tamanio && lenNroDocumento>0)
                {
                    mostrarMensajeError('danger','fa fa-warning','El formato del No. de Documento no corresponde al tipo de documento ' + selTipoDocumentoIdentidad.find('option:selected').text());
                    correcto=false;
                }
                return correcto;
            }
            
        }

        function crearAcciones(value, row, index) {            
            if(row != null && row.stRegi == '<%= ConstanteServices.IND_ESTADO_REGISTRO_ACTIVO %>') {	
	        	return [
	                '<button id="btnEditar" class="control-table">',
	                    '<i class="fa fa-edit"></i>',
	                '</button>',
		                '<button id="btnEliminar" class="control-table">',
		                    '<i class="fa fa-remove"></i>',
		                '</button>'      
	                
	            ].join('');
        	}else{
	        	return [
		            '<button id="btnActivar" class="control-table">',
	                    '<i class="fa fa-check"></i>',
	                '</button>'      
	                
	            ].join('');
        	}
            
        }

        window.operateEvents = {
            'click #btnEditar': function (e, value, row, index) {
                /* window.location.href = './cargarVentanaActualizarUsuario?idUsuario='+row.idUsuario; */
                $.redirect('./cargarVentanaActualizarUsuario', {'idUsuario': row.idUsuario });
            },
            'click #btnEliminar': function (e, value, row, index) {
            	$("#txtTitulo").text("¿Desea Anular el registro?");
                $("#exampleModalLabel").text("Eliminar");
               // mdlEliminar.data('idUsuario', row.idUsuario).modal('show');
                mdlEliminar.data('login', row.login).modal('show');
                mdlEliminar.data('indicador', 'I').modal('show');
                mdlEliminar.data('idUsuario', row.idUsuario).modal('show');
            },
            'click #btnActivar': function (e, value, row, index) {
               $("#txtTitulo").text("¿Desea Activar el registro?");
               $("#exampleModalLabel").text("Activar");
               mdlEliminar.data('login', row.login).modal('show');
               mdlEliminar.data('indicador', 'A').modal('show');
         	   mdlEliminar.data('idUsuario', row.idUsuario).modal('show');
            }
        };

        function mostrarOpciones(){
            $.each(listaOpciones, function(index) {
            });
        };
    </script>
</body>
</html>