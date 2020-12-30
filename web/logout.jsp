<%-- 
    Document   : logout
    Created on : Dec 17, 2020, 2:49:37 PM
    Author     : HP
--%>

<%
session.invalidate();
response.sendRedirect("index.jsp");
%>
