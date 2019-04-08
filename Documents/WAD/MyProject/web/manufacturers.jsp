<%-- 
    Document   : manufacturers
    Created on : 07-Apr-2019, 21:04:44
    Author     : andrei
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="classes.Manufacturer"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
    <meta charset="utf-8">
    <title></title>
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <script type="text/javascript">
      function validatePassword(){
        var pass = document.getElementById("pass").value;
        var rpass = document.getElementById("rpass").value;
        var span = document.getElementById("passValidate");

        if(pass == rpass){
          span.style.color = 'green';
          span.innerHTML = "Password OK";
          return true;
        }
        else{
          span.style.color = 'red';
          span.innerHTML = "Passwords do not match!";
          return false;
        }
        if(pass == '' || rpass == ''){
          span.innerHTML = '';
        }
        return false;
      }
    </script>
  </head>
    <body>
        <div class="head">
        <header>
          <div class="row myhead">
            <div class="col-md-2">
              <img src="img/logo.png" alt="LOGO">
            </div>
            <div class="col-md-2 headelem">
              <a class="nav-item nav-link" href="home.jsp">HOME</a>
            </div>
            <div class="col-md-2 headelem">
              <a class="nav-item nav-link" href="manufacturers.jsp">CARS</a>
            </div>
            <div class="col-md-2 headelem">
              <% 
                  if(request.getSession(false) != null && request.getSession().getAttribute("USER") != null){
              %>
              <a class="nav-item nav-link" href="account.jsp">ACCOUNT</a>
              <% 
                }
                else{
              %>
              <a class="nav-item nav-link" href="login_register.jsp">ACCOUNT</a>
              <% } %>
            </div>
            <div class="col-md-4">
              <form method="post">
                <span>
                  <input type="search" class="search" name="search" placeholder="Search">
                  <input type="submit" class="searchbutton" name="src" value=" ">
                </span>
              </form>
            </div>

          </div>
        </header>
            <div class="bar"></div>
      </div>
      
      <div class="container-fluid">
          <div class='cont'>
              <p class='welcome'>Here is a list of our selected car manufacturers. Each of them contain some of the most famous models produced.</p>
          </div>
          <div class='mans'>
              <div class="row">
              <%
                  ArrayList<Manufacturer> manufacturers = (ArrayList<Manufacturer>) getServletContext().getAttribute("manufacturers");
                  int i = 0;
                  for(Manufacturer m : manufacturers){
                      if(i % 4 == 0 && i != 0){
              %>
              </div>
              <div class='row'> <% } %>
              
              <div class='col-md-3'>
                  <a href='#'><img src='<%= m.getImgPath()%>' alt="<%= m.getName()%>"></a>
              </div>
              <% i++; } %>
              </div>
          </div>
      </div>
    
      
      
      
      <div class="navbar-fixed-bottom">
          <div class="bar"></div>
          <footer>
            <div class="row">
                <div class="col-md-1">
                    <img src="img/logo.png" alt="LOGO">
                </div>
                <div class="col-md-2 afoot">
                    <a href="home.jsp">HOME</a>
                </div>
                <div class="col-md-2 afoot">
                    <a href="#">CARS</a>
                </div>
                <div class="col-md-2 afoot">
                    <a href="login_register.jsp">ACCOUNT</a>
                </div>
                <div class="col-md-2 afoot">
                    <a href="#">CONTACT</a>
                </div>
                <div class="col-md-2 copy">
                    <p>COPYRIGHT © ANDREI URSU</p>
                </div>
            </div>
        </footer>
      </div>   
    </body>
</html>
