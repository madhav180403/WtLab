

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Leave Approval</title>
        <%@page import="java.util.*" %>
        <%@page import="java.sql.*" %>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <script>
            $(document).ready(function() {
               $("#table").load("leavedisp.jsp");
               
               $("#approve").click(function(){
                 $.ajax({
            type: "POST",
            url: "appr",
            data: {
                user:$("#user").val(),
                startdate:$("#startdate").val()
            },
            success: function(){
                     alert("Approved");
                     $("#table").load("leavedisp.jsp");
                  }
                    });
            }); 
            
            $("#notapprove").click(function(){
                 $.ajax({
            type: "POST",
            url: "notappr",
            data: {
                user:$("#user").val(),
                startdate:$("#startdate").val()
            },
            success: function(){
                     alert("Not approved");
                     $("#table").load("leavedisp.jsp");
                  }
                    });
            }); 
                 
            });
           
            </script>
    </head>
    <body>
        <nav class="navbar navbar-expand-sm bg-info bg-gradient">
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
         <span class="navbar-toggler-icon"></span>
        </button>
         <div class="collapse navbar-collapse" id="navbarSupportedContent">
             <div class="container">
                 <div class="row">
             <ul class="navbar-nav p-3">
                     <div class="col-sm">
                 <li class="nav-item p-2 text-success">
                     <a class="nav-link text-dark" href="check_attendance.jsp"><img src="https://img.icons8.com/dotty/80/000000/attendance-mark.png" alt="" width="30" height="24" class="d-inline-block align-text-top">&nbsp;Check Attendance</a>
                 </li></div>
                    <div class="col-sm">
                 <li class="nav-item p-2">
                     <a class="nav-link text-dark" href="leave_approve.jsp"><img src="https://img.icons8.com/ios/50/000000/leave.png" alt="" width="30" height="24" class="d-inline-block align-text-top">&nbsp;Leave Approval</a>
                 </li></div>
                     <div class="col-sm">
                 <li class="nav-item p-2">
                     <a class="nav-link text-dark"  href="empdetails.jsp"><img src="https://img.icons8.com/ios-glyphs/30/000000/gender-neutral-user.png" alt="" width="30" height="24" class="d-inline-block align-text-top">
                         &nbsp;View/Modify Employee Details</a>
                 </li></div>
                 <div class="col-sm">
                 <li class="nav-item p-2">
                     <a class="nav-link text-dark"  href="index.html"><img src="https://img.icons8.com/external-sbts2018-mixed-sbts2018/58/000000/external-logout-social-media-basic-1-sbts2018-mixed-sbts2018.png" alt="" width="30" height="24" class="d-inline-block align-text-top">
                         &nbsp;Logout</a>
                 </li></div>
             </ul>
                 </div></div>
         </div>
        </nav>
        <div class="container m-5 p-5">
            <div class="container">
                <div class="row">
                    <div class="col-sm">
                        <h3>List of Leave Requests</h3></div>
                    <div class="col-sm">
                        <button type="button" class="btn btn-warning" data-bs-toggle="modal" data-bs-target="#myModal">Approve/Not Approve</button></div>
                </div>
            </div>
            <hr>
             <div id="table">
        </div>
            <div class="modal" id="myModal">
  <div class="modal-dialog">
    <div class="modal-content">

      <div class="modal-header">
        <h4 class="modal-title">Approve/Not Approve Request</h4>
        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
      </div>

      <div class="modal-body">
          <label for="user">Enter employee username for whom to make decision</label><br><br>
          <input type="text" name="user" id="user"></input>
          <br><br>
          <label for="startdate">Enter starting date</label><br><br>
          <input type="date" name="startdate" id="startdate"></input>
      </div>
        
      <div class="modal-footer">
        <button type="button" class="btn btn-danger" data-bs-dismiss="modal" id="approve">Approve</button>
        <button type="button" class="btn btn-danger" data-bs-dismiss="modal" id="notapprove">Not Approve</button>
      </div>

    </div>
  </div>
</div>
        </div>
    </body>
</html>
