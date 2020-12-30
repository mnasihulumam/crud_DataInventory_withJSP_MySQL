<%-- 
    Document   : proses_register
    Created on : Dec 17, 2020, 4:51:29 PM
    Author     : HP
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%
    String nama_user = request.getParameter("nama_user");
    String username =  request.getParameter("username");
    String password =  request.getParameter("password");
    
    Class.forName("com.mysql.jdbc.Driver");
    Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/inventaris_uniku","root","");
    Statement st = con.createStatement();
    
    int i = st.executeUpdate("insert into user (nama_user, username, password) values ('" + nama_user + "', '" + username + "', '" + password + "')");
    if (i>0){
        out.print("<script> alert('Register Sukses'); window.location='index.jsp'</script>");
    }
       else{
        response.sendRedirect("index.jsp");
       }
        
            
            
%>
