<%-- 
    Document   : edit_barang
    Created on : Dec 8, 2020, 9:44:05 AM
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
        String id_barang = request.getParameter("id_barang");
        String nama_barang = request.getParameter("nama_barang");
        String jumlah_barang = request.getParameter("jumlah_barang");
        String kondisi = request.getParameter("kondisi");
        String fakultas = request.getParameter("fakultas");
        String tahun = request.getParameter("tahun");
        
        Connection con;
        PreparedStatement pst;
        ResultSet rs;
        
        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost/inventaris_uniku","root","");
        pst = con.prepareStatement("update data_barang set nama_barang = ?,jumlah_barang =?,kondisi= ?, fakultas =?, tahun = ? where id_barang = ?");
        pst.setString(1, nama_barang);
        pst.setString(2, jumlah_barang);
        pst.setString(3, kondisi);
        pst.setString(4, fakultas);
        pst.setString(5, tahun);
        pst.setString(6, id_barang);
        pst.executeUpdate();  
        
        %>
        
        <script>   
            alert("Data Berhasil di Perbarui!");
            window.location="tampil_barang.jsp"
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

    <title>Data Inventaris | Data Barang</title>
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
          <a class="nav-link active" href="tampil_barang.jsp"><i class="fas fa-dolly-flatbed mr-2"></i> Data Barang</a><hr class="bg-secondary"></hr>
        </li>
        <li class="nav-item">
          <a class="nav-link text-white" href="tampil_pegawai.jsp"><i class="fas fa-user-tie mr-2"></i> Data Pegawai</a><hr class="bg-secondary"></hr>
        </li>
        </ul>
      </div>
      <div class="col-md-10 mt-3">
        <div id="content">
  <div class="container-fluid" style="padding-bottom: 450px;">
    <div class="alert alert-dark">
              <h1>Edit Data Barang</h1>
            </div>
            <hr class="bg-secondary"></hr>
          <form method="post" action="#">
              <%    
                         Connection con;
                        PreparedStatement pst;
                        ResultSet rs;
        
                         Class.forName("com.mysql.jdbc.Driver");
                          con = DriverManager.getConnection("jdbc:mysql://localhost/inventaris_uniku","root","");
                           
                          String id_barang = request.getParameter("id_barang");
                          
                        pst = con.prepareStatement("select * from data_barang where id_barang = ?");
                        pst.setString(1, id_barang);
                        rs = pst.executeQuery();
                        
                         while(rs.next())
                         {
                    
                    %>
             <div class="form-group">
              <label for="">ID Barang</label>
              <input type="text" name="id_barang" class="form-control" readonly value="<%= rs.getString("id_barang")%>"/>
            </div>
            <div class="form-group">
              <label for="">Nama Barang</label>
              <input type="text" name="nama_barang" value="<%= rs.getString("nama_barang")%>" class="form-control">
            </div>
            <div class="form-group">
              <label for="">Jumlah Barang</label>
              <input type="text" name="jumlah_barang" value="<%= rs.getString("jumlah_barang")%>" class="form-control">
            </div>
            <div class="form-group">
              <label for="">Kondisi (Rusak)</label>
              <input type="text" name="kondisi" value="<%= rs.getString("kondisi")%>" class="form-control">
            </div>
            <div class="form-group">
              <label for="">Fakultas</label>
              <select name="fakultas" class="form-control">
                     <option value="">-- Pilih Fakultas --</option>
                     <option value="FE" <%= rs.getString("fakultas").equals("FE") ? "selected=\"selected\"": "" %>>FE</option>
                     <option value="FKOM" <%= rs.getString("fakultas").equals("FKOM") ? "selected=\"selected\"": "" %>>FKOM</option>
                     <option value="FKIP" <%= rs.getString("fakultas").equals("FKIP") ? "selected=\"selected\"": "" %>>FKIP</option>
                     <option value="FHUT" <%= rs.getString("fakultas").equals("FHUT") ? "selected=\"selected\"": "" %>>FHUT</option>
                     <option value="FH" <%= rs.getString("fakultas").equals("FH") ? "selected=\"selected\"": "" %>>FH</option>
              </select>
            </div>
            <div class="form-group">
              <label for="">Tahun</label>
              <input type="text" name="tahun" value="<%= rs.getString("tahun")%>" class="form-control">
            </div>
            <% }  %>
            <div class="form-group">
              <button type="submit" name="submit" class="btn btn-primary" onclick="return confirm('Anda yakin mau mengedit data ini ?')">Update</button> <button class="btn btn-warning"><a href="tampil_barang.jsp" style="text-decoration: none;">Kembali</a></button>
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