<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Attendance Form</title>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"> 
        <script>
         $(document).ready(function() {
             
             $("#enter").change(function()  
           {
                $("#exit").change(function() {
                     var hr1=parseInt($("#enter").val().substring(0,2));
                     var hr2=parseInt($("#exit").val().substring(0,2));
                     if(hr2<hr1)
                         hr2=hr2+24;
                     var min1=parseInt($("#enter").val().substring(3));
                     var min2=parseInt($("#exit").val().substring(3));
                     if(min2<min1)
                         min2=min2+60;
                     var hr_diff=hr2-hr1;
                     var min_diff=min2-min1;
                     $("#demo").html("Worked for "+ hr_diff + " hours, "+min_diff+" minutes");
                     });
            });
             
             var $myForm = $("#attn");
    $myForm.submit(function(){
        alert("Attendance submitted");
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
    
        <div class="container m-5 p-5">
            <div class="container">
                <div class="row">
                    <div class="col-sm">
            <h5>Mark attendance for  <%= LocalDate.now() %></h5>
                    </div>
                    <div class="col-sm">
            <form action="attendance.jsp" id="attn" method="POST">
                <label for="entertime">Entered time:</label><br>
                <input type="time" id="enter" name="entertime"></input><br><br>
                <label for="exittime">Exit time:</label><br>
                <input type="time" id="exit" name="exittime"></input><br><br>
                <input type="submit" value="Submit attendance" />
            </form>
                        
                    </div>
                    <div class="col-sm">
                        <h3 id="demo"></h3>
                    </div>
                </div>
            </div>
        </div>
        <%@page import="java.sql.*,java.io.*,java.util.*,java.time.*" contentType="text/html" pageEncoding="UTF-8"%>
        <%  if("POST".equals(request.getMethod())){
            String uname=(String)request.getSession().getAttribute("username");
int hr1=Integer.parseInt(request.getParameter("entertime").substring(0,2));
int min1=Integer.parseInt(request.getParameter("entertime").substring(3));
int hr2=Integer.parseInt(request.getParameter("exittime").substring(0,2));
int min2=Integer.parseInt(request.getParameter("exittime").substring(3));
if(min2<min1)
    min2=min2+60;
if(hr2<hr1)
    hr2+=24;
float hrs_worked=((hr2-hr1)*60 + (min2-min1))/(float)60.0;
try{
        Class.forName("com.mysql.cj.jdbc.Driver");
    Connection ct = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/employee",
                "root", "");
        PreparedStatement ps=ct.prepareStatement("update employees set hours=hours+? where username=?");
        ps.setFloat(1,hrs_worked);
        ps.setString(2,uname);
        int status=0;
        status=ps.executeUpdate();
        ct.close();
        response.sendRedirect("salary.jsp");
      }
        catch(Exception ex) {
        System.out.println(ex);
        }
}
%>
    </body>
</html>
