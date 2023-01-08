
<a href="admindashboard.jsp"></a>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@page import="java.util.*" %>
        <%@page import="java.sql.*" %>
        <title>
            Profile
        </title>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
     
    </head>
    <body><nav class="navbar navbar-expand-sm bg-info bg-gradient">
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
                     <a class="nav-link text-dark" href="profile.jsp"><img src="https://img.icons8.com/ios-glyphs/30/000000/gender-neutral-user.png" alt="" width="30" height="24" class="d-inline-block align-text-top">
                         &nbsp;View Profile</a>
                 </li>
                     </div>
                 <div class="col-sm">
                 <li class="nav-item p-2">
                     <a class="nav-link text-dark"  href="index.html"><img src="https://img.icons8.com/external-sbts2018-mixed-sbts2018/58/000000/external-logout-social-media-basic-1-sbts2018-mixed-sbts2018.png" alt="" width="30" height="24" class="d-inline-block align-text-top">
                         &nbsp;Logout</a>
                 </li></div>
             </ul>
                 </div></div>
         </div>
        </nav>
        <%
    Class.forName("com.mysql.cj.jdbc.Driver");
    Connection ct = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/employee",
                "root", "");
    try{  
        PreparedStatement ps=ct.prepareStatement("select fname,lname,username,phone,bld_grp,designation,dept,salary,joindate from employees where username=?");
        String user=(String)session.getAttribute("username");          
  ps.setString(1,user);
        ResultSet rs=ps.executeQuery();
    while(rs.next())
    {
    String fname=rs.getString(1),lname=rs.getString(2),username=rs.getString(3),phone=rs.getString(4),blood=rs.getString(5),designation=rs.getString(6),dept=rs.getString(7);
    int salary=rs.getInt(8);
String joindate=rs.getString(9);
     %>
    <div class="container p-5 m-5 bg-dark">
            <div class="card p-2 mx-auto" style="width:30rem;height:30rem;">
                <img src="https://as2.ftcdn.net/v2/jpg/01/71/94/39/1000_F_171943908_K9zdR8EcRJFxGFC1sIzvKRvaoSWRBTmL.jpg" class="card-img-top img-thumbnail mx-auto d-block" alt="profile picture" style="width:80%;height:50%">
                
                <div class="card-body">
      <div class="card-title"><h3>Employee Profile</h3></div>
    <h6 class="card-subtitle mb-2 text-muted"><%= "@"+username %></h6>
    <div class="card-text"><%= "Name: "+fname+" "+lname +"<br>Phone: "+phone+"<br>Designation: "+designation+"<br>Department: "+dept+"<br>Salary: "+salary+"<br>Joined on: "+joindate %></div>
  </div>
</div>
</div>
   <% }
ct.close();
}
   catch(Exception ex) {System.out.println(ex);}
   %>   
    </body>
</html>
