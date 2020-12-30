<%-- 
    Document   : edit_pegawai
    Created on : Dec 7, 2020, 11:02:54 AM
    Author     : HP
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %> 
<%
    String username = (String)session.getAttribute("username");
    // redirect user to login page if not logged in
    if(username == null){
        response.sendRedirect("index.jsp");
    }
%>
<% 
    if(request.getParameter("submit")!=null)
    {
        String id_pegawai = request.getParameter("id_pegawai");
        String jk = request.getParameter("jk");
        String nama_pegawai = request.getParameter("nama_pegawai");
        String jabatan = request.getParameter("jabatan");
        String tempat_lahir = request.getParameter("tempat_lahir");
        String tanggal_lahir = request.getParameter("tanggal_lahir");
        String agama = request.getParameter("agama");
        String no_hp = request.getParameter("no_hp");
        String alamat = request.getParameter("alamat");
        
        Connection con;
        PreparedStatement pst;
        ResultSet rs;
        
        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost/inventaris_uniku","root","");
        pst = con.prepareStatement("update data_pegawai set nama_pegawai = ?, jk = ?,jabatan =?,tempat_lahir= ?, tanggal_lahir =?, agama = ?, no_hp =?, alamat= ? where id_pegawai = ?");
        pst.setString(1, nama_pegawai);
        pst.setString(2, jk);
        pst.setString(3, jabatan);
        pst.setString(4, tempat_lahir);
        pst.setString(5, tanggal_lahir);
        pst.setString(6, agama);
        pst.setString(7, no_hp);
        pst.setString(8, alamat);
        pst.setString(9, id_pegawai);
        pst.executeUpdate();  
        
        %>
        
    <script>   
        alert("Data Berhasil di Perbarui!");
        window.location="tampil_pegawai.jsp"
    </script>
    <%             
    }

%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="bootstrap/css/admin.css">
    <link rel="stylesheet" href="fontawesome-free/css/all.min.css">

    <title>Data Inventaris | Data Pegawai</title>
  </head>
  <body>
  <nav class="navbar navbar-expand-lg navbar-light bg-warning fixed-top">
    <a class="navbar-brand" href="#">INVENTARIS | UNIVERSITAS KUNINGAN</a>
      <form class="form-inline my-2 my-lg-0 ml-auto">
        <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
        <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
      </form>
      <div class="icon ml-4">
        <h5>
          <a href="logout.jsp" style="color: black;"><i class="fas fa-sign-out-alt mr-3" data-toggle="tooltip" title="Sign Out"></i></a>
        </h5>
      </div>
    </div>
  </nav>

  <div class="row no-gutters mt-5"> 
      <div class="col-md-2 bg-dark mt-2 pr-3 pt-4">
        <ul class="nav flex-column ml-3 mb-5">
        <li class="nav-item">
          <a class="nav-link text-white" href="dashboard.jsp"><i class="fas fa-tachometer-alt mr-2"></i> Dashboard</a> <hr class="bg-secondary"></hr>
        </li>
        <li class="nav-item">
          <a class="nav-link text-white" href="tampil_barang.jsp"><i class="fas fa-dolly-flatbed mr-2"></i> Data Barang</a><hr class="bg-secondary"></hr>
        </li>
        <li class="nav-item">
          <a class="nav-link active" href="tampil_pegawai.jsp"><i class="fas fa-user-tie mr-2"></i> Data Pegawai</a><hr class="bg-secondary"></hr>
        </li>
        </ul>
      </div>
      <div class="col-md-10 mt-3">
        <div id="content">
  <div class="container-fluid" style="padding-bottom: 450px;">
    <div class="alert alert-dark">
              <h1>Edit Data Pegawai</h1>
            </div>
            <hr class="bg-secondary"></hr>
          <form method="post" action="#">
              <%    
                         Connection con;
                        PreparedStatement pst;
                        ResultSet rs;
        
                         Class.forName("com.mysql.jdbc.Driver");
                          con = DriverManager.getConnection("jdbc:mysql://localhost/inventaris_uniku","root","");
                           
                          String id_pegawai = request.getParameter("id_pegawai");
                          
                        pst = con.prepareStatement("select * from data_pegawai where id_pegawai = ?");
                        pst.setString(1, id_pegawai);
                        rs = pst.executeQuery();
                        
                         while(rs.next())
                         {
                    
                    %>
             <div class="form-group">
              <label for="">ID Pegawai</label>
              <input type="text" name="id_pegawai" class="form-control" readonly value="<%= rs.getString("id_pegawai")%>"/>
            </div>
            <div class="form-group">
              <label for="">Nama Pegawai</label>
              <input type="text" name="nama_pegawai" value="<%= rs.getString("nama_pegawai")%>" class="form-control">
            </div>
            <div class="form-group">
               <label for="">Jenis Kelamin</label><br>
               <input type="radio" name="jk" value="L" <%= rs.getString("jk").equals("L") ? "checked=\"checked\"": "" %>>L
               <input type="radio" name="jk" value="P" <%= rs.getString("jk").equals("P") ? "checked=\"checked\"": "" %>>P
            </div>
            <div class="form-group">
              <label for="">Jabatan</label>
              <input type="text" name="jabatan" value="<%= rs.getString("jabatan")%>" class="form-control">
            </div>
            <div class="form-group">
              <label for="">Tempat Lahir</label>
              <input type="text" name="tempat_lahir" value="<%= rs.getString("tempat_lahir")%>" class="form-control">
            </div>
            <div class="form-group">
              <label for="">Tanggal Lahir</label>
              <input type="date" name="tanggal_lahir" value="<%= rs.getString("tanggal_lahir")%>" class="form-control">
            </div>
            <div class="form-group">
              <label for="">Agama</label>
              <select id="" cols="" rows="3" class="form-control" name="agama">
                    <option value="">-- Pilih Agama --</option>
                    <option value="Islam" <%= rs.getString("agama").equals("Islam") ? "selected=\"selected\"": "" %> >Islam</option>
                    <option value="Kristen" <%= rs.getString("agama").equals("Kristen") ? "selected=\"selected\"": "" %>>Kristen</option>
                    <option value="Katolik" <%= rs.getString("agama").equals("Katolik") ? "selected=\"selected\"": "" %>>Katolik</option>
                    <option value="Hindu" <%= rs.getString("agama").equals("Hindu") ? "selected=\"selected\"": "" %>>Hindu</option>
                    <option value="Budha" <%= rs.getString("agama").equals("Budha") ? "selected=\"selected\"": "" %>>Budha</option>
                    <option value="Konghucu" <%= rs.getString("agama").equals("Konghucu") ? "selected=\"selected\"": "" %>>Konghucu</option>
              </select>
            </div>
            <div class="form-group">
              <label for="">NO HP</label>
              <input type="text" name="no_hp" value="<%= rs.getString("no_hp")%>" class="form-control">
            </div>
            <div class="form-group">
              <label for="">Alamat</label>
              <textarea name="alamat" id="" cols="" rows="3" class="form-control"><%= rs.getString("alamat")%></textarea>
            </div>
            <% }  %>
            <div class="form-group">
              <button type="submit" name="submit" class="btn btn-primary" onclick="return confirm('Anda yakin mau mengedit data ini ?')">Update</button> <button class="btn btn-warning" ><a href="tampil_pegawai.jsp" style="text-decoration: none;">Kembali</a></button>
            </div>
          </form>
        </div>
        </div>
      </div>
  </div>   
  <%@ include file="footer.jsp" %>   
    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="bootstrap/js/jquery-3.3.1.slim.min.js" ></script>
    <script src="bootstrap/js/popper.min.js"></script>
    <script src="bootstrap/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="bootstrap/js/admin.js"></script>
  </body>
</html>