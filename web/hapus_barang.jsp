<%-- 
    Document   : hapus_barang
    Created on : Dec 7, 2020, 11:03:06 AM
    Author     : HP
--%>


<%@page import="java.sql.*" %> 


<% 
        String id_barang = request.getParameter("id_barang");
        Connection con;
        PreparedStatement pst;
        ResultSet rs;
        
        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/inventaris_uniku","root","");
        pst = con.prepareStatement("delete from data_barang where id_barang = ?");
         pst.setString(1, id_barang);
        pst.executeUpdate();  
        
        %>
        
<script>   
        alert("Data Berhasil di Hapus!");
        window.location="tampil_barang.jsp"
</script>