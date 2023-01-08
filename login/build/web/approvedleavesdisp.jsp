<!DOCTYPE html>
<html>
    <head>
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
                <th>Number of days</th>
                <th>Start Date</th>
                <th>Leave Reason</th>
            </tr>
            </thead>
            <tbody>
            <%@page import="java.sql.*,java.io.*,java.util.*" contentType="text/html" pageEncoding="UTF-8"%>
            <% Class.forName("com.mysql.cj.jdbc.Driver");
    Connection ct = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/employee",
                "root", "");
             Statement st=conn.createStatement();
    try{  
String uname=(String)session.getAttribute("username");
        PreparedStatement ps=ct.prepareStatement("select fname,lname,username,no_of_days,start_date,leave_reason from leave where approved='Y' and username=?");
        ps.setString(1,uname);        
        ResultSet rs=ps.executeQuery();
    while(rs.next())
    {
    String fname=rs.getString(1),lname=rs.getString(2),username=rs.getString(3);
int no_of_days=rs.getInt(4);
String startdate=rs.getString(5),reason=rs.getString(6);
   %>
    <tr>
    <td><%= fname %></td>
    <td><%= lname %></td>
    <td><%= username %></td>
    <td><%= no_of_days %></td>
    <td><%= startdate %></td>
    <td><%= reason %></td>
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
