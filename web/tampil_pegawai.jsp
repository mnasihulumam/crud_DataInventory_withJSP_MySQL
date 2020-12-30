<%-- 
    Document   : tampil_pegawai
    Created on : Dec 7, 2020, 9:11:01 AM
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
<!doctype html>
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
              <h1>Data Pegawai</h1>
            </div>
            <hr class="bg-secondary"></hr>
              <a href="tambah_pegawai.jsp" class="btn-warning pr-3 pl-3" style="border-radius: 5px;">Tambah Data</a>
              <a href="tampil_pegawai.jsp?exportToExcel=YES" class="btn-success pr-3 pl-3" style="border-radius: 5px;">Export ke Excel</a>
                  <table class="table">
                    <thead>
                      <tr class="btn-primary">
                        <th>Nama Pegawai</th>
                        <th>Jenis Kelamin</th>
                        <th>Jabatan</th>
                        <th>Tempat Lahir</th>
                        <th>Tanggal Lahir</th>
                        <th>Agama</th>
                        <th>No. HP</th>
                        <th>Alamat</th>
                        <th>Action</th>
                      </tr>
                    </thead>
                    <tbody>
                      <%   

                                Connection con;
                                PreparedStatement pst;
                                ResultSet rs;
        
                                Class.forName("com.mysql.jdbc.Driver");
                                con = DriverManager.getConnection("jdbc:mysql://localhost/inventaris_uniku","root","");
                                
                                  String query = "select * from data_pegawai";
                                  Statement st = con.createStatement(); %>
                                  <%
                                        String exportToExcel = request.getParameter("exportToExcel");
                                        if(exportToExcel != null && exportToExcel.toString().equalsIgnoreCase("YES")) {
                                            response.setContentType("application/vnd.ms-excel");
                                            response.setHeader("Content-Disposition", "inline; filename = DataPegawai.xls");
                                        }
                                             
                                   %>
                                    <% rs =  st.executeQuery(query);
                                    
                                        while(rs.next())
                                        {
                                            String id_pegawai = rs.getString("id_pegawai");
                                   %>
             
                             <tr>
                                 <td><%=rs.getString("nama_pegawai") %></td>
                                 <td><%=rs.getString("jk") %></td>
                                 <td><%=rs.getString("jabatan") %></td>
                                 <td><%=rs.getString("tempat_lahir") %></td>
                                 <td><%=rs.getDate("tanggal_lahir") %></td>
                                 <td><%=rs.getString("agama") %></td>
                                 <td><%=rs.getString("no_hp") %></td>
                                 <td><%=rs.getString("alamat") %></td>
                                 <td><a href="edit_pegawai.jsp?id_pegawai=<%=id_pegawai%>" class="badge badge-success">Edit</a> |
                                     <a href="hapus_pegawai.jsp?id_pegawai=<%=id_pegawai%>" class="badge badge-danger" onclick="return confirm('Anda yakin mau menghapus <%=rs.getString("nama_pegawai") %>?')">Delete</a></td>
                             </tr> 
                             
                             
                                <%
                                 
                                 }
                               %>   
                    </tbody>
                  </table>
          </div>
        </div>
<!--Footer-part-->
        <%@ include file="footer.jsp" %>
      </div>
  </div>   
    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="bootstrap/js/jquery-3.3.1.slim.min.js" ></script>
    <script src="bootstrap/js/popper.min.js"></script>
    <script src="bootstrap/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="bootstrap/js/admin.js"></script>
  </body>
</html>