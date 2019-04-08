
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
      </div>
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
      <div class="divi"></div>
  </body>
</html>
