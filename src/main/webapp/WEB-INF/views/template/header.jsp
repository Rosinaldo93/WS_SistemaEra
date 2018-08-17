<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<!--<header>-->
<div class="pull-left">
	<a class="btn-show" id="btnShowMenu"></a>
	<div class="logo-data">								<!-- fuerzo a que se mantenga el  middle, este error se presento en tracking.jsp-->
		<a href="${pageContext.request.contextPath}/cargarVentanaInicio">
		<img src="<c:url value="/resources/Content/images/system/logoERA.png" />" style="height: 80%; vertical-align: middle !important;">
		</a>
		<div class="pull-right">Sistema de Archivos ERA</div> <span class="title-master"></span>
	</div>
</div>
<div class="pull-right">
	<div class="pull-left comp-btn-user">
		<button id="btnGroupDrop2" type="button" class="btn dropdown-toggle" data-toggle="dropdown">
<!-- 			<span class="ico-user">					 -->
<%-- 				<img src="<c:url value="/resources/Content/images/system/usuario.jpg" />">				 --%>
<!-- 			</span> -->
          	<span class="name">
          		${sessionScope.usuarioBean.nombre} ${sessionScope.usuarioBean.apellidoPaterno} ${sessionScope.usuarioBean.apellidoMaterno}
          	</span>
        </button>
        <ul class="dropdown-menu dropdown-menu-right" role="menu" aria-labelledby="btnGroupDrop2">
          <li>
          	<a href="${pageContext.request.contextPath}/seguridad/usuario/cargarVentanaCambiarContrasena">Cambiar Clave</a>
          </li>
          <li>
          	<a href="${pageContext.request.contextPath}/accionCerrarSesion">Cerrar Sesion</a>
          </li>
        </ul>	        
	</div>
</div>
