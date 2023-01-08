<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/jquery-validation@1.19.3/dist/jquery.validate.js"></script>
        <title>Register account</title>
        <script>
          $(document).ready(function() {
              
              var fnameerror=true;
              var lnameerror=true;
              var usernameerror=true;
              var emailerror=true;
              var passworderror=true;
              var confirmpassworderror=true;
              var phoneerror=true;
              
              $("#inp1").change(function() {
                 validate_fname(); 
              });
              
              $("#inp2").change(function() {
                 validate_lname(); 
              });
              
              $("#inp11").change(function() {
                  validate_username();
              });
              
              $("#inp3").change(function() {
                  validate_email();
              });
              
              $("#inp4").change(function() {
                  validate_phone();
              })
              
              $("#inp12").change(function() {
                  validate_password();
              })
              
              $("#inp13").change(function() {
                 validate_confirmpassword(); 
              });
              
              $("#regbutton").click(function() {
                 validate_fname();
                 validate_lname();
                 validate_username();
                 validate_email();
                 validate_phone();
                 validate_password();
                 validate_confirmpassword();
                 if(fnameerror==true && lnameerror==true && usernameerror==true && phoneerror==true && emailerror==true && passworderror==true && confirmpassworderror==true)
                 {
                     alert("Account registered");
                     return true;
                 }
                 else
                 {
                     alert("Account could not be registered");
                     window.location.href="index.html";
                     return false;
                 }  
              });
              
              function validate_fname() {
                  let val1=$("#inp1").val();
                  if(val1=='' || !/^[A-Za-z]+$/.test(val1))
                  {
                      if(val1=='')
                      {
                         $("#fnamemissing").html("Field is empty");
                      }
                      else if(!/^[A-Za-z]+$/.test(val1))
                      {
                          $("#fnamemissing").html("First name should have only alphabets");
                      }
                      $("#fnamemissing").show();
                      fnameerror=false;
                      return false;
                  }
                  else
                  {
                      $("#fnamemissing").hide();
                      fnameerror=true;
                      return true;
                  }
              }
              
               function validate_lname() {
                  let val1=$("#inp2").val();
                  if(val1=='' || !/^[A-Za-z]+$/.test(val1))
                  {
                      if(val1=='')
                      {
                         $("#lnamemissing").html("Field is empty");
                      }
                      else if(!/^[A-Za-z]+$/.test(val1))
                      {
                          $("#lnamemissing").html("Last name should have only alphabets");
                      }
                      $("#lnamemissing").show();
                      lnameerror=false;
                      return false;
                  }
                  else
                  {
                      $("#lnamemissing").hide();
                      lnameerror=true;
                      return true;
                  }
              }
              
              function validate_username() {
                  let val1=$("#inp11").val();
                  if(val1=='' || !/^[A-Za-z0-9_]+$/.test(val1))
                  {
                      if(val1=='')
                      {
                         $("#usernamemissing").html("Field is empty");
                      }
                      else if(!/^[A-Za-z0-9_]+$/.test(val1))
                      {
                          $("#usernamemissing").html("Username should have alphanumeric characters");
                      }
                      $("#usernamemissing").show();
                      usernameerror=false;
                      return false;
                  }
                  else
                  {
                      $("#usernamemissing").hide();
                      usernameerror=true;
                      return true;
                  }
              }
              
             function validate_email() {
                  let val1=$("#inp3").val();
                  if(val1=='' || !/\S+@\S+\.\S+/.test(val1))
                  {
                      if(val1=='')
                      {
                         $("#emailmissing").html("Field is empty");
                      }
                      else if(!/\S+@\S+\.\S+/.test(val1))
                      {
                          $("#emailmissing").html("Email given is of invalid format");
                      }
                      $("#emailmissing").show();
                      emailerror=false;
                      return false;
                  }
                  else
                  {
                      $("#emailmissing").hide();
                      emailerror=true;
                      return true;
                  }
              }
              
              function validate_phone() {
                  let val1=$("#inp4").val();
                  if(val1=='' || ! /[0-9]{10}$/.test(val1))
                  {
                      if(val1=='')
                      {
                         $("#phonemissing").html("Field is empty");
                      }
                      else if(! /[0-9]{10}$/.test(val1))
                      {
                          $("#phonemissing").html("Phone number should be numeric with minimum 10 digits");
                      }
                      $("#phonemissing").show();
                      phoneerror=false;
                      return false;
                  }
                  else
                  {
                      $("#phonemissing").hide();
                      phoneerror=true;
                      return true;
                  }
              }
              
              function validate_password() {
                  let val1=$("#inp12").val();
                  if(val1=='' || val1.length<5 || val1.length>12)
                  {
                      if(val1=='')
                      {
                         $("#passwordmissing").html("Field is empty");
                      }
                      else if(val1.length<5 || val1.length>12)
                      {
                          $("#passwordmissing").html("Password should be between 5 and 12 characters");
                      }
                      $("#passwordmissing").show();
                      passworderror=false;
                      return false;
                  }
                  else
                  {
                      $("#passwordmissing").hide();
                      passworderror=true;
                      return true;
                  }
              }
              
              function validate_confirmpassword() {
                  let val1=$("#inp13").val();
                  let val2=$("#inp12").val();
                  if(val1=='' || val1!=val2)
                  {
                      if(val1=='')
                      {
                         $("#confirmpasswordmissing").html("Field is empty");
                      }
                      else if(val1!=val2)
                      {
                          $("#confirmpasswordmissing").html("Passwords don't match");
                      }
                      $("#confirmpasswordmissing").show();
                      confirmpassworderror=false;
                      return false;
                  }
                  else
                  {
                      $("#confirmpasswordmissing").hide();
                      confirmpassworderror=true;
                      return true;
                  }
              }
              
              $("#nextbut").click(function() {
                 $.fn.page1to2();
              });
              
              $("#prevbut1").click(function() {
                 $.fn.page1to2(); 
              });
              
             $("#nextbut2").click(function() {
                $.fn.page2to3();
             });
             
             $("#prevbut2").click(function() {
                $.fn.page2to3(); 
             });
             
             $.fn.page1to2 = function(){
                  $("#off").toggle();
                   $("#per").toggle();
               $("#lbl1").toggle();
              $("#inp1").toggle();
               $("#lbl2").toggle();
              $("#inp2").toggle();
               $("#lbl3").toggle();
              $("#inp3").toggle();
               $("#lbl4").toggle();
              $("#inp4").toggle();
               $("#lbl5").toggle();
              $("#inp5").toggle();
               $("#lbl6").toggle();
              $("#inp6").toggle();
              $("#nextbut2").toggle();
              $("#lbl7").toggle();
              $("#inp7").toggle();
              $("#lbl8").toggle();
              $("#inp8").toggle();
              $("#lbl9").toggle();
              $("#inp9").toggle();
              $("#lbl10").toggle();
              $("#inp10").toggle();
              $("#nextbut").toggle();
              $("#prevbut1").toggle();
             }
             
             $.fn.page2to3 = function() {
                  $("#nextbut2").toggle();
              $("#lbl7").toggle();
              $("#inp7").toggle();
              $("#lbl8").toggle();
              $("#inp8").toggle();
              $("#lbl9").toggle();
              $("#inp9").toggle();
              $("#lbl10").toggle();
              $("#inp10").toggle();
              $("#lbl11").toggle();
              $("#inp11").toggle();
              $("#lbl12").toggle();
              $("#inp12").toggle();
              $("#lbl13").toggle();
              $("#inp13").toggle();
              $("#regbutton").toggle();
              $("#off").toggle();
              $("#acc").toggle();
              $("#prevbut2").toggle();
              $("#prevbut1").toggle();
             }
      });
         </script>
    </head>
    <body>
        <div class="container m-5">
            <a href="index.html" class="btn btn-outline-primary">Go back to home page</a><br><br>
            <div class="container text-center">
        <h1 id="per">1.Personal Details</h1>
        <h1 style="display:none" id="off">2.Official Details</h1>
        <h1 style="display:none" id="acc">3.Account Details</h1>
        <br><br>
        <form action="register.jsp" method="POST" id="regform">
  
        <label for="fname" id="lbl1">Enter first name:</label>
        <input type="text" name="fname" id="inp1"></input>
        <p id="fnamemissing" style="color:red;display:none;"></p>
        
        <label for="joindate" id="lbl7" style="display:none">Enter date of joining:</label>
        <input type="date" name="joindate" id="inp7" style="display:none"></input>
        
        <label for="username" id="lbl11" style="display:none">Enter username:</label>
        <input type="text" id="inp11" name="username" style="display:none"></input>
        <p id="usernamemissing" style="color:red;display:none"></p>
        <br><br>
        
            
        <label for="lname" id="lbl2">Enter last name:</label>
        <input type="text" name="lname" id="inp2"></input>
        <p id="lnamemissing" style="color:red;display:none"></p>
        
        <label for="dept" id="lbl8" style="display:none">Enter department</label>
        <select name="dept" id="inp8" style="display:none">
            <option value="Frontend">Frontend</option>
            <option value="Dev Ops">Dev Ops</option>
            <option value="Data Analysis">Data Analysis</option>
            <option value="Backend">Backend</option>
        </select>
        
        <label for="pwd" id="lbl12" style="display:none">Enter password:</label>
        <input type="password" name="pwd" id="inp12" style="display:none"></input>
        <p id="passwordmissing" style="color:red;display:none"></p>
        <br><br>
        
        <label for="email" id="lbl3">Enter email:</label>
        <input type="email" name="email" id="inp3"></input>
        <p id="emailmissing" style="color:red;display:none"></p>
        
        <label for="desig" id="lbl9" style="display:none">Enter designation:</label>
        <select name="desig" id="inp9" style="display:none">
            <option value="Trainee">Trainee</option>
            <option value="Junior developer">Junior Developer</option>
            <option value="Mid-level developer">Mid level Developer</option>
            <option value="Senior developer">Senior Developer</option>
            <option value="Project Lead">Project Lead</option>
        </select>
        
        <label for="password" id="lbl13" style="display:none">Confirm password:</label>
        <input type="password" name="password" id="inp13" style="display:none"></input>
        <p id="confirmpasswordmissing" style="color:red;display:none"></p>
        <br><br>
        
        <label for="phone" id="lbl4">Enter contact number:</label>
        <input type="text" name="phone" id="inp4"></input>
        <p id="phonemissing" style="color:red;display:none"></p>
        
        <label for="sal" id="lbl10" style="display:none">Enter salary per month:</label>
        <input type="number" name="salary" id="inp10" min="25000" max="300000" style="display:none"></input>
        <br><br>
        
        <label for="blood" id="lbl6">Enter blood group:</label>
        <select name="blood" id="inp6">
            <option value="O">O</option>
            <option value="A+">A+</option>
            <option value="B+">B+</option>
            <option value="A-">A-</option>
            <option value="B-">B-</option>
           <option value="AB+">AB+</option>
        </select><br><br>
        
        <input type="submit" class="btn btn-primary" id="regbutton" style="display:none" value="Register" />
        </form><br>
        <%@page import="java.sql.*,java.io.*,java.util.*" contentType="text/html" pageEncoding="UTF-8"%>
        <%  if("POST".equals(request.getMethod())){
            String fname=request.getParameter("fname");
String lname=request.getParameter("lname");
String email=request.getParameter("email");
String joindate=request.getParameter("joindate");
String username=request.getParameter("username");
String dept=request.getParameter("dept");
String designation=request.getParameter("desig");
String phone=request.getParameter("phone");
int salary=Integer.parseInt(request.getParameter("salary"));
String blood=request.getParameter("blood");
String password=request.getParameter("password");
System.out.println(fname+" "+lname+" "+email+" "+joindate+" "+username+" "+dept+" "+designation+" "+phone+" "+salary+" "+blood+" "+password);
try
{   
    Class.forName("com.mysql.cj.jdbc.Driver");
    Connection conn = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/employee",
                "root", "");
    int status=0; 
        try{
            Statement st=conn.createStatement();
            String pwd="Employee";
            int hr=0;
            int num=st.executeUpdate("insert into employees(fname,lname,email,phone,bld_grp,joindate,dept,designation,salary,username,password,role,hours) values ('"+fname+"','"+lname+"','"+email+"','"+phone+"','"+blood+"','"+joindate+"','"+dept+"','"+designation+"','"+salary+"','"+username+"','"+password+"','"+pwd+"','"+hr+"')");      
            out.close(); 
        }catch(Exception ex){
        out.println(ex);
           ex.printStackTrace();}  
           
}
catch(Exception e) {
    out.println(e); }
            }
    %>
        <button type="button" class="btn btn-primary" style="display:none" id="prevbut2">Go back to page 2</button>
        <button type="button" class="btn btn-primary" id="nextbut">Go to page 2</button>
        <button type="button" class="btn btn-primary" style="display:none" id="nextbut2">Go to page 3</button>
        <button type="button" class="btn btn-primary" style="display:none" id="prevbut1">Go back to page 1</button>
        </div>
        </div>
    </body>
</html>