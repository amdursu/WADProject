<%-- 
    Document   : account
    Created on : 07-Apr-2019, 17:25:36
    Author     : andrei
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/style.css">
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <title>Account</title>
    </head>
    <body>
        <%@include file="header.jsp" %>
      <div class="container-fluid">
        <h2>Hello,<%= request.getSession().getAttribute("USER")%>!</h2>
        <a href="LogoutController" class="logout">Logout</a>
        <h3 class="fav">Favorite cars list:</h3>
      </div>
        <div class="bar"></div>
      <%@include file="footer.jsp" %> 
    </body>
</html>
