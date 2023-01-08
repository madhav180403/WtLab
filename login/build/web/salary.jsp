

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%@page import="java.util.*" %>
        <%@page import="java.sql.*" %>
        <%@page import="java.text.*" %>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Salary</title>
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
                     <a class="nav-link text-dark" href="attendance.jsp"><img src="https://img.icons8.com/dotty/80/000000/attendance-mark.png" alt="" width="30" height="24" class="d-inline-block align-text-top">&nbsp;Mark Attendance</a>
                 </li></div>
                     <div class="col-sm">
                 <li class="nav-item p-2">
                     <a class="nav-link text-dark" href="salary.jsp"><img src="https://img.icons8.com/external-kmg-design-detailed-outline-kmg-design/64/000000/external-salary-money-kmg-design-detailed-outline-kmg-design.png" alt="" width="30" height="24" class="d-inline-block align-text-top">&nbsp;Check Salary</a>
                 </li></div>
                 <div class="col-sm">
                 <li class="nav-item p-2">
                     <a class="nav-link text-dark" href="leave_req.jsp"><img src="https://img.icons8.com/ios/50/000000/leave.png" alt="" width="30" height="24" class="d-inline-block align-text-top">&nbsp;Leave Request</a>
                 </li></div>

                     <div class="col-sm">
                 <li class="nav-item p-2">
                    
                     <a class="nav-link text-dark" id="viewprofile" href="profile.jsp"><img src="https://img.icons8.com/ios-glyphs/30/000000/gender-neutral-user.png" alt="" width="30" height="24" class="d-inline-block align-text-top">
                         &nbsp;View Profile</a>
                 </li>
                     </div>
                 <div class="col-sm">
                 <li class="nav-item p-2">
                     <a class="nav-link text-dark"  id="logout" href="index.html"><img src="https://img.icons8.com/external-sbts2018-mixed-sbts2018/58/000000/external-logout-social-media-basic-1-sbts2018-mixed-sbts2018.png" alt="" width="30" height="24" class="d-inline-block align-text-top">
                         &nbsp;Logout</a>
                 </li></div>
             </ul>
                 </div></div>
         </div>
        </nav>
        <div class="container m-5 p-5">
            <% String uname=(String)session.getAttribute("username");
 Class.forName("com.mysql.cj.jdbc.Driver");
    Connection ct = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/employee",
                "root", "");
    try{  
        PreparedStatement ps=ct.prepareStatement("select salary,hours from employees where username=?");
ps.setString(1,uname);
        ResultSet rs=ps.executeQuery();
    while(rs.next())
    {
        int salary=rs.getInt(1),hours=rs.getInt(2); 
%>
<p class="font-weight-light">Should work minimum 130 hours per month to get full salary. Additional hours will be taken as overtime hours</p><hr>
<h6>Total hours worked: <%= hours %> hours </h2><br>
<h6>Total salary: <%= salary %> rupees</h2><br>
<% 
float sal_earned=(hours/(float)130.0)*salary; %>
<h6>Salary earned so far for <%= new SimpleDateFormat("MMM").format(Calendar.getInstance().getTime()) %> is <%= sal_earned %> rupees</h2><br>
        </div>
  <%  }
}
catch(Exception ex) {System.out.println(ex); }
 %>
    </body>
</html>
