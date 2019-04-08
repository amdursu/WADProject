<%-- 
    Document   : home
    Created on : 07-Apr-2019, 20:06:40
    Author     : andrei
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/style.css">
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <title>Home</title>
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
      </div>
      <div class="bar"></div>
      <div class="container-fluid">
          <div class='cont'>
              <p class="welcome">Welcome to our website. Here you can discover car manufacturers, car models, user reviews, our users' top favorites. 
              By joining our community you can add your own car reviews and configure car specifications that you can add to your personal favorite list. </p>
          </div>
          <h3 class='fav'>Our users' top favorite cars:</h3>
      </div>
      
      <div class="bar"></div>
      
      <div class="navbar-fixed-bottom">
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
