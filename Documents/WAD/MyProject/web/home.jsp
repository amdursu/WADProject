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
      <%@include file="header.jsp" %>
      <div class="container-fluid">
          <div class='cont'>
              <p class="welcome">Welcome to our website. Here you can discover car manufacturers, car models, user reviews, our users' top favorites. 
              By joining our community you can add your own car reviews and configure car specifications that you can add to your personal favorite list. </p>
          </div>
          <h3 class='fav'>Our users' top favorite cars:</h3>
      </div>
      <div class="bar"></div>
      <%@include file="footer.jsp" %>
    </body>
</html>
