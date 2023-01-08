

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Dashboard</title>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
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
        <div class="container m-5">
        <h1>Welcome <%= request.getParameter("username") %></h1>
        </div>
    </body>
</html>

