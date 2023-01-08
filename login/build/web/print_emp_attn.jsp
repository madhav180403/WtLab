

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%@page import="java.util.*" %>
        <%@page import="java.sql.*" %>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    </head>
    <body>
        <div class="container m-5 p-5">
   <% Class.forName("com.mysql.cj.jdbc.Driver");
    Connection ct = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/employee",
                "root", "");  
    try{  
        PreparedStatement ps=ct.prepareStatement("select fname,lname,username,hours,salary from employees where username=?");
        String uname=request.getParameter("uname");
        System.out.println(uname);
        ps.setString(1,uname);
        ResultSet rs=ps.executeQuery();
    while(rs.next())
    {
    String fname=rs.getString(1),lname=rs.getString(2),username=rs.getString(3); 
    int hours=rs.getInt(4),salary=rs.getInt(5);
%>
     <div class="container m-5">
            <div class="card" style="width:30rem;height:10rem;">
  <div class="card-body p-2">
      <div class="card-title"><h3>Employee Attendance</h3></div>
    <h6 class="card-subtitle mb-2 text-muted"><%= "@"+username %></h6>
    <div class="card-text"><%= "Name: "+fname+" "+lname +"<br>Hours worked: "+hours+"<br>Salary for the month: "+(hours/(float)130.0)*salary %>
  </div>
</div>
</div>
 <% }
ct.close();
}
catch(Exception ex) {System.out.println(ex); }
 %> 
        </div>
    </body>
</html>
