package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import sun.security.util.Password;

public final class index_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html lang=\"en\">\n");
      out.write("\n");
      out.write("<head>\n");
      out.write("\n");
      out.write("  <meta charset=\"utf-8\">\n");
      out.write("  <meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\">\n");
      out.write("  <meta name=\"viewport\" content=\"width=device-width, initial-scale=1, shrink-to-fit=no\">\n");
      out.write("  <meta name=\"description\" content=\"\">\n");
      out.write("  <meta name=\"author\" content=\"\">\n");
      out.write("\n");
      out.write("  <title>INVENTARIS UNIKU | Login</title>\n");
      out.write("\n");
      out.write("  <!-- Custom fonts for this template-->\n");
      out.write("  <link href=\"fontawesome-free/css/all.min.css\" rel=\"stylesheet\" type=\"text/css\">\n");
      out.write("  <link href=\"css/fontnunito.css\" rel=\"stylesheet\">\n");
      out.write("\n");
      out.write("  <!-- Custom styles for this template-->\n");
      out.write("  <link href=\"bootstrap/css/sb-admin-2.min.css\" rel=\"stylesheet\">\n");
      out.write("\n");
      out.write("</head>\n");
      out.write("\n");
      out.write("<body class=\"bg-gradient-primary\">\n");
      out.write("  <div class=\"container\">\n");
      out.write("\n");
      out.write("    <!-- Outer Row -->\n");
      out.write("    <div class=\"row justify-content-center\">\n");
      out.write("\n");
      out.write("      <div class=\"col-xl-10 col-lg-12 col-md-9\" style=\"margin-top: 90px;\">\n");
      out.write("\n");
      out.write("        <div class=\"card o-hidden border-0 shadow-lg my-5\">\n");
      out.write("          <div class=\"card-body p-0\">\n");
      out.write("            <!-- Nested Row within Card Body -->\n");
      out.write("            <div class=\"row\">\n");
      out.write("              <div><img src=\"img/login.png\" style=\"height: 300px; width: 300px; margin-top: 70px; margin-left: 50px;\"></div>\n");
      out.write("              <div class=\"col-lg-6\">\n");
      out.write("                <div class=\"p-5\">\n");
      out.write("                  <div class=\"text-center\">\n");
      out.write("                      <h1 class=\"h4 text-gray-900 mb-4\"><b>Login</b></h1>\n");
      out.write("                    <hr></hr>\n");
      out.write("                  </div>\n");
      out.write("                    ");

        String username = (String)session.getAttribute("username");
        //redirect to dashboard page if already logged in
        if(username!=null){
            response.sendRedirect("dashboard.jsp");
        }
        Cookie user = new Cookie("Username",request.getParameter("username"));
        Cookie pass = new Cookie("Password", request.getParameter("password"));
        // Set expiry date after 24 Hrs for both the cookies.
        user.setMaxAge(60*60*24); 
        pass.setMaxAge(60*60*24); 
        // Add both the cookies in the response header.
        response.addCookie( user );
        response.addCookie( pass );
        
        
        String status = request.getParameter("status");
        if(status!=null){
            if(status.equals("false")){
                out.print("<script> alert('Login Gagal, Periksa Kembali !'); window.location='index.jsp'</script>");
            }
        }
     
      out.write("\n");
      out.write("     <form class=\"user\" method=\"post\" action=\"proses_login.jsp\" name=\"login\" onsubmit=\"return validateForm()\">\n");
      out.write("                    <div class=\"form-group\">\n");
      out.write("                        <input type=\"text\" class=\"form-control form-control-user\" id=\"exampleInputEmail\" aria-describedby=\"emailHelp\" placeholder=\"Username Anda\" name=\"username\" required oninvalid=\"this.setCustomValidity('Username Tidak Boleh Kosong!')\" oninput=\"setCustomValidity(')\" />\n");
      out.write("                    </div>\n");
      out.write("                    <div class=\"form-group\">\n");
      out.write("                        <input type=\"password\" class=\"form-control form-control-user\" id=\"exampleInputPassword\" placeholder=\"Password Anda\" name=\"password\" required oninvalid=\"this.setCustomValidity('Password Tidak Boleh Kosong!')\" oninput=\"setCustomValidity(')\" ");
      out.print( request.getParameter("password"));
      out.write(" />\n");
      out.write("                    </div>\n");
      out.write("                    <div class=\"form-group\">\n");
      out.write("                      <div class=\"custom-control custom-checkbox small\">\n");
      out.write("                        <input type=\"checkbox\" class=\"custom-control-input\" id=\"customCheck\">\n");
      out.write("                      </div>\n");
      out.write("                    </div>\n");
      out.write("                    <button class=\"btn btn-primary btn-user btn btn-block\" type=\"submit\" name=\"submit\">Login</button>\n");
      out.write("                    <button class=\"btn btn-warning btn-user btn btn-block\" type=\"reset\"  name=\"reset\">Cancel</button>\n");
      out.write("                    <p align=\"center\">Belum Mempunyai Akun? <a href=\"register.jsp\" style=\"text-decoration: none;\">Daftar Disini!</a></p>\n");
      out.write("                    <hr>\n");
      out.write("                    <p align=\"center\">INVENTARIS UNIKU</p>\n");
      out.write("                    <p align=\"center\">All Rights Reserved by M. Nasihul Umam &copy 2020</p>\n");
      out.write("                  </form>\n");
      out.write("                  <hr>\n");
      out.write("                </div>\n");
      out.write("              </div>\n");
      out.write("            </div>\n");
      out.write("          </div>\n");
      out.write("        </div>\n");
      out.write("      </div>\n");
      out.write("    </div>\n");
      out.write("  </div>\n");
      out.write("\n");
      out.write("  <!-- Bootstrap core JavaScript-->\n");
      out.write("  <script src=\"bootstrap/js/jquery.min.js\"></script>\n");
      out.write("  <script src=\"bootstrap/js/bootstrap.bundle.min.js\"></script>\n");
      out.write("\n");
      out.write("  <!-- Core plugin JavaScript-->\n");
      out.write("  <script src=\"bootstrap/js/jquery.easing.min.js\"></script>\n");
      out.write("\n");
      out.write("  <!-- Custom scripts for all pages-->\n");
      out.write("  <script src=\"bootstrap/js/sb-admin-2.min.js\"></script>\n");
      out.write("\n");
      out.write("</body>\n");
      out.write("\n");
      out.write("</html>\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
