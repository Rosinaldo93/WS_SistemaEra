package pe.com.sistemaera.core.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;

import pe.com.sistemaera.core.entity.Usuario;
import pe.com.sistemaera.core.util.ConstanteServices;



public class LoginFilter implements Filter{

   private String loginPage = "cargarVentanaInicioSesion";
   private String timeoutPage = "cargarVentanaSinAcceso";
   private String loginPerfil = "cargarVentanaInicio";
    
    
	@Override
	public void destroy() {
		// TODO Auto-generated method stub
		
	}
	
   private boolean isSessionControlRequiredForThisResource(HttpServletRequest httpServletRequest) {
        String requestPath = httpServletRequest.getRequestURI();
        boolean controlRequired = !StringUtils.contains(requestPath, getTimeoutPage());
        requestPath.contains(getTimeoutPage());
        return controlRequired;
    }

    private boolean isSessionInvalid(HttpServletRequest httpServletRequest) {
        boolean sessionInValid = (httpServletRequest.getRequestedSessionId() != null) && !httpServletRequest.isRequestedSessionIdValid();
        return sessionInValid;
    }
	    
    private void enviarRespuestaSesionExpiradaAjax(HttpServletRequest request, ServletResponse response) throws IOException {
        String urlLogin = request.getContextPath() + ConstanteServices.URL_PAGINA_INICIO_SESION_EXPIRADA;
        response.setContentType("text/plain");
        response.getWriter().write(ConstanteServices.MENSAJE_SESION_EXPIRADA + "," + urlLogin);
    }
	    
	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain filterChain) throws IOException, ServletException {
		 if ((request instanceof HttpServletRequest) && (response instanceof HttpServletResponse)) {
	            HttpServletRequest httpServletRequest = (HttpServletRequest) request;
	            HttpServletResponse httpServletResponse = (HttpServletResponse) response;
	            String requestPath = httpServletRequest.getRequestURI();
	            boolean loginVal = requestPath.endsWith("cargarVentanaInicioSesion") || requestPath.endsWith("autenticarUsuario")
	                               || requestPath.endsWith(".css") || requestPath.endsWith(".js") || requestPath.endsWith(".png") || requestPath.endsWith(".jpg")
	                               || requestPath.contains(".woff")
	                               || requestPath.contains("generarCaptcha")
	                               || requestPath.contains("SToken")
	                               || requestPath.endsWith("accionCerrarSesion");
	            
	            boolean isAjaxRequest = httpServletRequest.getHeader("accept").contains("application/json");
	            
	            if (!loginVal) {
	                if (isSessionControlRequiredForThisResource(httpServletRequest)) {
	                    if (isSessionInvalid(httpServletRequest)) {
	                        if(!isAjaxRequest){
	                            httpServletResponse.sendRedirect(httpServletRequest.getContextPath() + "/" +  loginPage + "?mensaje=Su sesión ha expirado.");
	                            return;
	                        }else{
	                            enviarRespuestaSesionExpiradaAjax(httpServletRequest, httpServletResponse);
	                            return;
	                        }
	                    }
	                }
	                
	                Usuario usuarioEntidad = (Usuario)httpServletRequest.getSession().getAttribute("usuarioBean");
	                
	                if(usuarioEntidad==null){
	                    isAjaxRequest = httpServletRequest.getHeader("accept").contains("application/json");
	                    if(!isAjaxRequest){
	                        httpServletResponse.sendRedirect(httpServletRequest.getContextPath() + "/" + loginPage);
	                        return;
	                    }else{
	                        enviarRespuestaSesionExpiradaAjax(httpServletRequest, httpServletResponse);
	                        return;
	                    }
	                }else{
	                    Integer idPerfil = httpServletRequest.getParameter("idPerfil")==null?0:Integer.valueOf(httpServletRequest.getParameter("idPerfil"));
	                    if(loginVal && idPerfil == 0){
	                        httpServletResponse.sendRedirect(httpServletRequest.getContextPath() + "/" + loginPerfil);
	                        return;
	                    }
	                }
	            }
	        }
	      filterChain.doFilter(request, response);
		
	}

	@Override
	public void init(FilterConfig arg0) throws ServletException {				
	}
		
	public String getLoginPage() {
	        return loginPage;
	}

    public void setLoginPage(String loginPage) {
        this.loginPage = loginPage;
    }

    public String getTimeoutPage() {
        return timeoutPage;
    }

    public void setTimeoutPage(String timeoutPage) {
        this.timeoutPage = timeoutPage;
    }
	    

}
