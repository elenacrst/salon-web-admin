<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<html lang="en">

<head>

  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>Salon - Login</title>

  <!-- Custom fonts for this template-->
  <link href="../../static/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">

  <!-- Custom styles for this template-->
 <link href="../../static/css/sb-admin.css" rel="stylesheet" type="text/css">


</head>

<body class="bg-dark">

  <div class="container">
    <div class="card card-login mx-auto mt-5">
      <div class="card-header">Login</div>
      <div class="card-body">
        <form:form action="login" method="post" modelAttribute="employee">
          <div class="form-group">
            <div class="form-label-group">
              <form:input type="email" id="inputEmail" path="email" class="form-control" required="required" />
              <label for="inputEmail">Email address</label>
            </div>
          </div>
          <div class="form-group">
            <div class="form-label-group">
              <form:input type="password" id="inputPassword" path="password" class="form-control" required="required"/>
              <label for="inputPassword">Password</label>
            </div>
          </div>
         <!-- <div class="form-group">
            <div class="checkbox">
              <label>
                <input type="checkbox" value="remember-me">
                Remember Password
              </label>
            </div>
          </div>-->
           <button class="btn btn-primary btn-block form-button" type="submit">Login</button>
        </form:form>
        <div class="text-center">
          <a class="d-block small mt-3" href="register">Register an Account</a>
        <!--  <a class="d-block small" href="forgot-password.html">Forgot Password?</a>-->
        </div>
      </div>
    </div>
  </div>

</body>

</html>
