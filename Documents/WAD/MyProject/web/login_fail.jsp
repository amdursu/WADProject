<%-- 
    Document   : LoggedIn
    Created on : 02-Apr-2019, 21:09:11
    Author     : andrei
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Account</title>
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
            }
            else{
              span.style.color = 'red';
              span.innerHTML = "Passwords do not match!";
            }
            if(pass == '' || rpass == ''){
              span.innerHTML = '';
            }
            return pass === rpass;
          }
        </script>
    </head>
    <body>
        <%@include file="header.jsp" %>
      <div class="bar"></div>
      <div class="container-fluid">
        <h1>Please sign in or create a new account</h1>
        <div class="row">
          <div class="col-md-6 logreg">
            <h3>Sign in</h3>
            <div class="err">
                <p style="color: #CA2B2B"><%= request.getAttribute("mess")%></p>
            </div>
            <form class="login" action="" method="post">
              <div class="formelem">
                <label for="mail">Email: </label>
                <input type="email" name="mail" required>
              </div>
              <div class="formelem">
                <label for="password">Password: </label>
                <input type="password" name="password" required>
              </div>
              <div class="sub">
                <input type="submit" name="signin" value="Log in">
              </div>

            </form>
          </div>
          <div class="col-md-6 logreg">
            <h3>Register</h3>
            <form class="register" action="RegistrationController" method="post">
              <div class="formelem">
                <label for="name">Name: </label>
                <input type="text" name="name" required>
              </div>
              <div class="formelem">
                <label for="surname">Surname: </label>
                <input type="text" name="surname" required>
              </div>
              <div class="formelem">
                <label for="email">Email: </label>
                <input type="email" name="email" required>
              </div>
              <div class="formelem">
                <label for="pass">Password: </label>
                <input type="password" name="pass" id="pass" required>
              </div>
              <div class="formelem">
                <label for="rpass">Re-type password: </label>
                <input type="password" name="rpass" id="rpass" onkeyup="validatePassword()" required>
                <span id="passValidate"></span>
              </div>
              <div class="sub">
                <input type="submit" name="registergo" value="Register" onSubmit="return validatePassword();">
              </div>
            </form>
          </div>
        </div>
      </div>
      <div class="bar"></div>
      <%@include file="footer.jsp" %>
      <div class="divi"></div>
    </body>
</html>
