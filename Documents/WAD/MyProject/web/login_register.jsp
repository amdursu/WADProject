
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
      <%@include file="header.jsp" %>
      <div class="bar"></div>
      <div class="container-fluid">
        <h1>Please sign in or create a new account</h1>
        <div class="row">
          <div class="col-md-6 logreg">
            <h3>Sign in</h3>
            <form class="login" action="LoginController" method="post">
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
            <form class="register" action="RegistrationController" method="post" onsubmit="return validatePassword();">
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
                <div id="passValidate"></div>
              </div>
              <div class="sub">
                <input type="submit" name="registergo" value="Register">
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
