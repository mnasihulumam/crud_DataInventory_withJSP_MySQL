<%-- 
    Document   : dashboard
    Created on : Dec 7, 2020, 9:38:00 AM
    Author     : HP
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
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

    <title>Data Inventaris | Dashboard</title>
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
          <a class="nav-link active" href="dashboard.jsp"><i class="fas fa-tachometer-alt mr-2"></i> Dashboard</a> <hr class="bg-secondary"></hr>
        </li>
        <li class="nav-item">
          <a class="nav-link text-white" href="tampil_barang.jsp"><i class="fas fa-dolly-flatbed mr-2"></i> Data Barang</a><hr class="bg-secondary"></hr>
        </li>
        <li class="nav-item">
          <a class="nav-link text-white" href="tampil_pegawai.jsp"><i class="fas fa-user-tie mr-2"></i> Data Pegawai</a><hr class="bg-secondary"></hr>
        </li>
        </ul>
      </div>
      <div class="col-md-10">
        <%@ include file="jam.jsp" %>
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
