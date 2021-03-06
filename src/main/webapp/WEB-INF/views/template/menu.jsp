<%@page import="pe.com.sistemaera.core.util.ConstantesParametros"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@page import="pe.com.sistemaera.core.util.ConstanteServices"%>
<a class="btn-hide"></a>
<span class="name-app-menu">Sistema de Archivos ERA</span>
<nav class="nav">
    <ul id="menuNavegacion" class="nav-wrap">
        ${sessionScope.menuHtml}
    </ul>
</nav>
<script type="text/javascript" src="<c:url value="/resources/Scripts/jquery/jquery-1.11.1.js" />"></script>
<script type="text/javascript">
		
		function optionClick(optionName){
			console.info(optionName);
		}
		
		function invocarMenu(){
			$("#btnShowMenu").click();
		}

		$(document).ready(function(){
			asignarVariablesPeticionAjax('<%=ConstanteServices.OK%>', '<%=ConstanteServices.ERROR%>', '<%=ConstanteServices.IMAGEN_SUCCESS%>', '<%=ConstanteServices.IMAGEN_DANGER%>', '<%=ConstanteServices.MENSAJE_SESION_EXPIRADA%>');
			asignarTextoItemSeleccionar('<%=ConstantesParametros.descripcionOpcionSeleccione %>');
			asignarTextoItemTodos('<%=ConstantesParametros.descripcionOpcionTodos %>');
		});
		
	</script>