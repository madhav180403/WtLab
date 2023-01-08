
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Leave Request</title>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <script>
            $(document).ready(function() {
            
            $("#approvedleaves").click(function() {
                $("#table2").load("approvedleavesdisp.jsp");
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
            <h3>Submit request for leave:</h3><hr>
            <div class="container">
                <div class="row">
                    <div class="col-sm">
            <form action="leave_req.jsp" method="POST">
                <label for="daynum">Enter number of days:</label><br>
                <input type="number" name="daynum" id="daynum"></input><br><br>
                <label for="startdate">Enter starting date</label><br>
                <input type="date" name="startdate" id="startdate"></input><br>
                <br>
                <label for="reason">Enter leave reason:</label><br>
                <textarea name="reason" rows="5" cols="50" id="reason"></textarea><br><br>
                <input type="submit" value="Submit Leave Request" />
            </form>
                    </div>
                    <div class="col-sm">
                        <button type="button" class="btn btn-success" id="approvedleaves">Check approved leaves</button>
                        <br><br>
                        <div id="table2"></div>
                    </div>
                </div>
            </div>
        </div>
        <%@page import="java.sql.*,java.io.*,java.util.*" contentType="text/html" pageEncoding="UTF-8"%>
        <%  if("POST".equals(request.getMethod())){
            Class.forName("com.mysql.cj.jdbc.Driver");
    Connection ct = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/employee",
                "root", "");
        PreparedStatement ps=ct.prepareStatement("select fname,lname from employees where username=?");
        String uname=(String)request.getSession().getAttribute("username");
        System.out.println(uname);
        ps.setString(1,uname);
        ResultSet rs=ps.executeQuery();
        Statement st=ct.createStatement();
int status=0;
while(rs.next())
{
    String fname=rs.getString(1),lname=rs.getString(2);
    int daynum=Integer.parseInt(request.getParameter("daynum"));
    String startdate=request.getParameter("startdate");
    String reason=request.getParameter("reason");
    System.out.println(daynum+" "+startdate+" "+reason);
    PreparedStatement ps1=ct.prepareStatement("insert into leaves(fname,lname,username,no_of_days,start_date,leave_reason,approved) values (?,?,?,?,?,?,?)");
    ps1.setString(1,fname);
    ps1.setString(2,lname);
    ps1.setString(3,uname);
    ps1.setInt(4,daynum);
    ps1.setString(5,startdate);
    ps1.setString(6,reason);
ps1.setString(7,"N");
    status=ps1.executeUpdate();
System.out.println(status);
}
if(status>0)
response.sendRedirect("leave_req.jsp");
ct.close();
}
%>
    </body>
</html>
