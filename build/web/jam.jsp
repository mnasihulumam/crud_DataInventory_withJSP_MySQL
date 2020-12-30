<%
    String username = (String)session.getAttribute("username");
    // redirect user to login page if not logged in
    if(username == null){
        response.sendRedirect("index.jsp");
    }
%>
<div id="content">
  <div id="content-header">
  </div>
  <div class="container-fluid" style="background: url(img/night.jpg); background-size: cover; padding: 250px;"><hr>
    <h1 align="center" style="color: white; font-size: 60px; opacity: 70%;  ">
        <i>Selamat Datang <%= username %></i>
    </h1>

    <script type="text/javascript">
      function date_time(id)
      {
      date = new Date;
      year = date.getFullYear();
      month = date.getMonth();
      months = new Array('Januari', 'Februari', 'Maret', 'April', 'Mei', 'Juni', 'Juli', 'Agustus', 'September', 'Oktober', 'November', 'Desember');
      d = date.getDate();
      day = date.getDay();
      days = new Array('Minggu', 'Senin', 'Selasa', 'Rabu', 'Kamis', 'Jumat', 'Sabtu');
      h = date.getHours();
      if(h<10)
      {
      h = "0"+h;
      }
      m = date.getMinutes();
      if(m<10)
      {
      m = "0"+m;
      }
      s = date.getSeconds();
      if(s<10)
      {
      s = "0"+s;
      }
      result = ''+days[day]+', '+d+' '+months[month]+' '+year+'<br> '+h+':'+m+':'+s+ ' WIB';
      document.getElementById(id).innerHTML = result;
      setTimeout('date_time("'+id+'");','1000');
      return true;
      }
      </script>

      <h1 align="center" style="color: white"><i><span id="date_time"><</span></i><h1>
      <script type="text/javascript">window.onload = date_time('date_time');</script>
      </div>
  <div class="container-fluid">
  </div>
</div>
<!--Footer-part-->