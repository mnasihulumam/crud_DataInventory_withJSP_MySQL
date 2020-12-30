<%-- 
    Document   : hapus_pegawai
    Created on : Dec 7, 2020, 11:03:18 AM
    Author     : HP
--%>

<%@page import="java.sql.*" %> 


<% 
        String id_pegawai = request.getParameter("id_pegawai");
        Connection con;
        PreparedStatement pst;
        ResultSet rs;
        
        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/inventaris_uniku","root","");
        pst = con.prepareStatement("DELETE FROM data_pegawai where id_pegawai = ?");
        pst.setString(1, id_pegawai);
        pst.executeUpdate();  
        
%>
<script>   
        alert("Data Berhasil di Hapus!");
        window.location="tampil_pegawai.jsp"
</script>
            
    