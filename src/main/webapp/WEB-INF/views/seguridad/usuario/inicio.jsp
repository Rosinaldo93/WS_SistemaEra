<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE HTML>
<html lang="es">
<head>
	<!-- importamos los estilos -->
    <jsp:include page="../../template/libreriasCabecera.jsp" />
</head>

<body class="skin-gym bar-white">   
    <section class="wrap-ui">
    	<div class="box-opacity"></div>
    	
        <!--<header>-->
        <header class="header">
            <jsp:include page="../../template/header.jsp" />
        </header>
      
         <!--Menu -->
        <div class="menu">
             <jsp:include page="../../template/menu.jsp" />
        </div>
                       
        <!--<wrap-content>-->
        <div class="wrap-content">
			<!--</main-aside>-->
			<!--<pull-main-content>-->
			<div class="pull-main-content">
				<!--<main-content>-->
				<div class="main-content view-wrap">
				</div>
				<!--</main-content>-->
			</div>
			<!--</pull-main-content>-->
		</div>
		
       <!--</wrap-content>-->
        <input type="hidden" id="flagInvocarMenu" value="${flagInvocarMenu}"> 
		<div class="up-page upPage"><span class="glyphicon glyphicon-chevron-up"></span></div>
    </section>     
    
    <!--importamos los JS-->
    <jsp:include page="../../template/libreriasFooter.jsp" />
    
    <script type="text/javascript">
		$(function(){	
			$('[data-toggle="tooltip"]').tooltip();
			generales();
			
			var flagInvocarMenu = $('#flagInvocarMenu').val();
			if(!IsEmpty(flagInvocarMenu)) {
				if(flagInvocarMenu == '1') {
					invocarMenu();
				}
			}
		});
	</script>
	<footer class="login">
        <jsp:include page="../../template/footerlogin.jsp" />
    </footer> 
</body>                     
</html>