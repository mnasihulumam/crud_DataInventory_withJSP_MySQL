<%-- 
    Document   : proses_login
    Created on : Dec 8, 2020, 8:49:36 AM
    Author     : HP
--%>

<%@page import="function.flogin"%>
<%@page import="function.login"%>
<jsp:useBean id="flogin" class="function.flogin" scope="session"/>
<jsp:setProperty property="*" name="flogin"/>
<%
   String result = login.loginCheck(flogin);
   if(result.equals("true")){
       session.setAttribute("username", flogin.getUsername());
       out.print("<script> alert('Login Sukses'); window.location='dashboard.jsp'</script>");
       
   }
   if(result.equals("false")){
       response.sendRedirect("index.jsp?status=false");
   }
   if(result.equals("error")){
       response.sendRedirect("index.jsp?status=error");
   }
   if (request.getParameter("remember") != null) {
       String remember = request.getParameter("remember");
       System.out.println("remember : " + remember);
        Cookie user = new Cookie("Username",request.getParameter("username"));
        Cookie pass = new Cookie("Password", request.getParameter("password"));
        Cookie reme = new Cookie("Remember", request.getParameter("remember"));
        // Set expiry date after 24 Hrs for both the cookies.
        user.setMaxAge(60*60*24); 
        pass.setMaxAge(60*60*24);
        reme.setMaxAge(60*60*24);
        // Add both the cookies in the response header.
        response.addCookie( user );
        response.addCookie( pass );
        response.addCookie( reme );
    }
   
%>
