<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    </head>
    <body>
        <div class="container m-5 p-5">
             <a class="btn btn-outline-primary" href="index.html">Go back to home page</a><br>
            <div class="container text-center">
            <h1>Login</h1><br><br>
         <form action="login.jsp" method="POST">
        <label for="username">Enter username:</label>
        <input type="text" name="username"></input><br><br>
        <label for="pwd">Enter password:</label>
        <input type="password" name="password"></input><br><br>
        <label for="role">Enter role:</label>
        <select name="role" id="role">
            <option value="Admin">Admin</option>
            <option value="Employee">Employee</option>
        </select>
        <br><br>
        <input type="submit" class="btn btn-primary" value="Login" />
            </div></div>
        <%@page import="java.sql.*,java.io.*,java.util.*" contentType="text/html" pageEncoding="UTF-8"%>
        <%  if("POST".equals(request.getMethod())){
            String name=request.getParameter("username");
            String pwd=request.getParameter("password");
try
{   
    Class.forName("com.mysql.cj.jdbc.Driver");
    Connection conn = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/employee",
                "root", "");
    Statement st=conn.createStatement();
try {           
          
                ResultSet rs=st.executeQuery("select * from employees where username='"+name+"' and password='"+pwd+"'"); 
                
if(true)
{   rs.next();
    out.println(rs.getString(13));
    if(rs.getString(13).equals("Employee"))
{
RequestDispatcher rd=request.getRequestDispatcher("empdashboard.jsp");        
rd.forward(request,response);
}
    else if(rs.getString(13).equals("Admin"))
{
RequestDispatcher rd=request.getRequestDispatcher("admindashboard.jsp");        
rd.forward(request,response);
}
}
else
{
out.println("<h1>Incorrect login details</h1></div>");
RequestDispatcher rd=request.getRequestDispatcher("login.jsp");  
rd.include(request, response);
}
}
catch(Exception ex) {out.println(ex); }
}
catch(Exception ex) {out.println(ex); }
}
%>
    </body>
</html>

