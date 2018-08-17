<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
                                               :: Usted se encuentra en: <span>SEGURIDAD</span><span class="nivel-bread">/</span><span class="active-view">ADMINISTRAR PERFIL</span>
                                        </div>
                                        <div class="main-colum">
                                               <!-- wrap -->
                                               <div class="box-wrap-main">
                                                      <div class="box-wrap-header">
                                                            <div class="pull-left">
                                                                   <div class="title-main">
                                                                          Buscar <span>Perfil</span>
                                                                   </div>
                                                            </div>                                
                                                      </div>  
                                                      <div class="box-wrap-body">
                                                            <h3 class="title-form">FILTRO DE BUSQUEDA</h3>
                                                            <form id="perfilBusquedaForm" name="perfilBusquedaForm">
                                                            <div class="box-form">
                                                                   <div class="row">
                                                                          <div class="col-sm-4">
                                                                                 <div class="form-group">
                                                                                       <label>Nombre Perfil:</label>
                                                                                       <input type="text" id="txtNombre" name="nombre" class="form-control">                                                   
                                                                                 </div>                                                                          
                                                                          </div>
                                                                          <div class="col-sm-4">
                                                                                 <div class="form-group">
                                                                                       <label>Estado Perfil: </label>                                                                                     
                                                                                        <select id="selEstadoRegistro" name="estadoRegistro" class="form-control">
                                                                                              <option value="" >Todos</option>
                                                                                              <option value="A">Activo</option>
                                                                                              <option value="I">Inactivo</option>
                                                                                       </select>                                                                                                                                                                                                
                                                                                 </div>                                                                          
                                                                          </div>
                                                                   </div>
                                                            </div>
                                                            </form>
                                                            
                                                            <div class="box-acciones">
                                                            	<div class="pull-left">
                                                                 	<div id="divMensajeInformacion"></div>
                                                                 </div>
                                                                   <div class="pull-right">          
                                                                    	<button type="button" id="btnBuscar" class="btn-s btn-search">Buscar</button>
                                                                    	<button type="button" id="btnNuevo" class="btn-s btn-add">Nuevo</button>                                                   
                                                                    	<button class="btn-s btn-clean" id="btnLimpiar" >Limpiar</button>                                                              
                                                                   </div>
                                                          </div>
                                                            <div class="table-responsive">
                                                                   <table id="tblPerfiles"  class="table table-striped table-bordered table-hover text-center text-middle"  data-flat="true" data-show-export="true" data-cache="false">
                                                                  <thead>
                                                                    <tr>
                                                                      <th>Nombre Perfil</th>
                                                                      <th>Descripción</th>
                                                                      <th>Estado</th>
                                                                      <th>Acción</th>
                                                                    </tr>
                                                                  </thead>
                                                                  
                                                                </table> 
                                                            </div>
                                                      </div>                                                

                                               </div>
                                               <!-- cierra wrap -->
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
             <div class="up-page upPage"><span class="glyphicon glyphicon-chevron-up"></span></div>
       </section>
       
       <!-- Modal -->        
    <div class="modal fade" id="confirmarModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel">
      <div class="modal-dialog" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
            <h4 class="modal-title" id="exampleModalLabel"></h4>
          </div>
          <div class="modal-body">
           
            <span id="txtTitulo"></span>
            <form>
              <div class="form-group">
                <input type="hidden" id="txtIdPerfil" name="txtIdPerfil" value="">
              </div>          
          </form>
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
        var tblPerfiles = null;
        var btnBuscar = null;
        var btnNuevo = null;
        var btnLimpiar = null;
        var btnSiModal = null;        
        var perfilBusquedaForm = null;
        var btnExportar= null;
        var mensaje=null;
        var confirmarModal=null;
      

        function inicializarVariables(){
             tblPerfiles = $('#tblPerfiles');
             btnBuscar = $('#btnBuscar');
             btnNuevo = $('#btnNuevo');
             btnLimpiar = $('#btnLimpiar');
             perfilBusquedaForm = $('#perfilBusquedaForm');
             btnSiModal = $('#btnSiModal');  
             btnExportar = $('#btnExportar');  
             confirmarModal = $('#confirmarModal');      
             mensaje = ${mensaje};

        }
        

        function cargarComponentes(){
                var listaPerfiles = ${listaPerfiles};
         		var mensaje = ${mensaje};
         		if(mensaje!="")
                {
            		mostrarMensajeError(mensaje);
            	}
                 tblPerfiles.bootstrapTable({
                //   processing: false,
                   pagination: true,
                   pageSize: 10,
                //   bServerSide: false,
                   data: listaPerfiles,
                   formatShowingRows: function (pageFrom, pageTo, totalRows) {
                       return '';
                   },
                   formatRecordsPerPage: function(pageNumber){
                       return '';
                   },
                   columns: [{
								field : 'nro',
								title : 'Nro',
								align : 'center',
								valign : 'bottom',
								sortable : false,
								formatter: 'formatoNro'
							 },
                             {
                            	 field: 'nombre',
                                 title: 'Nombre',
                                 align: 'left',
                                 valign: 'bottom',
                                 sortable: false
                             },
                             {
                                 field: 'descripcion',
                                 title: 'Descripción',
                                 align: 'left',
                                 valign: 'bottom',
                                 sortable: false
                             },
                             {
                            	 field: 'estadoRegistro',
                                 title: 'Estado',
                                 align: 'left',
                                 valign: 'bottom',
                                 sortable: false
                                 },
                              {
                                 field: 'operate',
                                 title: 'Acci&oacute;n',
                                 align: 'center',
                                 valign: 'bottom',
                                 sortable: false,
                                 formatter: 'crearAcciones',
                                 class: 'controls',
                               events : operateEvents
                              }
                          ]
                      });
//                    aoColumnDefs: [
//                    {
//                     'mRender': function ( data, type, full ) {
//                            var enlace = "<a href='./cargarVentanaActualizarPerfil?id=" + data.id +"' class='btn btn-default btn-sm'> <span class='fa fa-edit'></span></a>";
//                            enlace = enlace + "<a class='btn btn-default btn-sm' data-toggle='modal' data-target='#confirmarModal' data-whatever='"+ data.id +"'> <span class='fa fa-remove'></span></a>";
//                      return enlace;
//                    },
//                    'aTargets': [ 3 ]
//                    }
//                     ],        
//                              searching: false,
//                              bLengthChange: false,
//                              bInfo: false,
//                              bPaginate: false
          //     });
                    
                btnSiModal.click(function(event){
                    var idPerfil = confirmarModal.data('idPerfil');
                    $.ajax({
                        url: "./eliminarPerfil",
                        type: "POST",
                        dataType: "text",
                        cache: false,
                        data : {
                          idPerfil : idPerfil,
                        }
                     }).done(function(paramJson) { 
                   	    confirmarModal.modal('hide');
                         tblPerfiles.bootstrapTable('load', paramJson);
                            window.location.href = './cargarVentanaBuscarPerfil?mensaje=.'; 
                            removerMensaje();
                        //mostrarMensajeConfirmación('Se anuló el perfil: ' + $('#txtNombre').val());
                      }).fail(function( jqXHR, textStatus, errorThrown ) {
                    	  validarFinDeSesion(jqXHR, textStatus, errorThrown, '<%= ConstanteServices.MENSAJE_SESION_EXPIRADA %>');
                      });                     
               });

                 btnExportar.click(function(event){
                     tblPerfiles.bootstrapTable('refreshOptions', {
                         exportDataType: 'excel'
                     });
                 });
                 
               btnBuscar.click(function(event){
                   var parametrosBusquedaJson = JSON.stringify(perfilBusquedaForm.serializeJSON());
                          $.ajax({
                              url: "./buscarPerfil",
                              type: "POST",
                              dataType: "json",
                              cache: false,
                              data : {
                                     parametrosBusqueda : parametrosBusquedaJson
                              }
                          }).done(function(paramJson) {
                               tblPerfiles.bootstrapTable('load', paramJson);
 						  }).fail(function( jqXHR, textStatus, errorThrown ) {
 							 validarFinDeSesion(jqXHR, textStatus, errorThrown, '<%= ConstanteServices.MENSAJE_SESION_EXPIRADA %>');
                          });
                          removerMensaje();
               });
            
             btnNuevo.click(function(event){
                   window.location.href = './cargarVentanaRegistrarPerfil';    
                   
               });

             btnLimpiar.click(function(event){
               $('#perfilBusquedaForm')[0].reset();
               removerMensaje();
             });

             function mostrarMensajeError(mensajeError){
                 var mensajeHTML = '';
                 mensajeHTML = '<div class="alert alert-success" role="alert" style="height: auto!important;">';
                 mensajeHTML = mensajeHTML + '<i class="fa fa-check"></i>';
                 mensajeHTML = mensajeHTML + mensajeError;
                 $('#divMensajeInformacion div').remove();
                 $('#divMensajeInformacion').append(mensajeHTML);
             }


             function removerMensaje(){
            	   $('#divMensajeInformacion div').remove();
                 }

        }
        
        
		function formatoNro(value, row, index) {
			return [
				(index + 1) + ''
		    ].join('');			
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
           	 $.ajax({
                      url: "./obtenerVentanaActualizarPerfil",
                      type: "POST",
                      async: false,
	                  dataType: "json",
	                  cache: false,
	                  data : {
	                         idPerfil : row.idPerfil
	                  }
	              }).done(function(paramJson) {
                               window.location.href ='./cargarVentanaActualizarPerfil';
 						  }).fail(function( jqXHR, textStatus, errorThrown ) {
 							 validarFinDeSesion(jqXHR, textStatus, errorThrown, '<%= ConstanteServices.MENSAJE_SESION_EXPIRADA %>');
                          });
	              
                //window.location.href ='./cargarVentanaActualizarPerfil?idPerfil='+row.idPerfil;
            },
            'click #btnEliminar': function (e, value, row, index) {
               $("#txtTitulo").text("¿Desea Anular el registro?");
               $("#exampleModalLabel").text("Eliminar");
         	   confirmarModal.data('idPerfil', row.idPerfil).modal('show');
            },
            'click #btnActivar': function (e, value, row, index) {
               $("#txtTitulo").text("¿Desea Activar el registro?");
               $("#exampleModalLabel").text("Activar");
         	   confirmarModal.data('idPerfil', row.idPerfil).modal('show');
            }
        };


        
       </script>

</body>                                        
</html>
