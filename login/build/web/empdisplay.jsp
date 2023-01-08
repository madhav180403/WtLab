

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%@page import="java.util.*" %>
        <%@page import="java.sql.*" %>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Employee Details</title>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    </head>
    <body>
        <table class="table table-hover">
            <thead>
            <tr>
                <th>First Name</th>
                <th>Last Name</th>
                <th>Username</th>
                <th>Contact Number</th>
                <th>Designation</th>
                <th>Department</th>
                <th>Salary</th>
            </tr>
            </thead>
            <tbody>
            <% Class.forName("com.mysql.cj.jdbc.Driver");
    Connection ct = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/employee",
                "root", "");    try{  
        PreparedStatement ps=ct.prepareStatement("select fname,lname,username,phone,designation,dept,salary from employees order by salary desc,fname,lname");
        ResultSet rs=ps.executeQuery();
    while(rs.next())
    {
    String fname=rs.getString(1),lname=rs.getString(2),username=rs.getString(3),phone=rs.getString(4),designation=rs.getString(5),dept=rs.getString(6);
    int salary=rs.getInt(7); %>
    <tr>
    <td><%= fname %></td>
    <td><%= lname %></td>
    <td><%= username %></td>
    <td><%= phone %></td>
    <td><%= designation %></td>
    <td><%= dept %></td>
    <td><%= salary %></td>
    </tr>
 <% }
ct.close();
}
catch(Exception ex) {System.out.println(ex); }
 %> 
            </tbody>
        </table>
    </body>
</html>
