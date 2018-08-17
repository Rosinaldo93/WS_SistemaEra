<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
                            Usted no tiene ningun perfil asignado, favor de solicitar al área correspondiente la asignación de uno.
                            <span class="active-view">
                                <a href="${pageContext.request.contextPath}/accionCerrarSesion">Hacer click aquí para regresar a la página de inicio.</a>
                            </span>
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
    <!--JS-->
    <jsp:include page="../../template/libreriasFooter.jsp" />
</body>                     
</html>