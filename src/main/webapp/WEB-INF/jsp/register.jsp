<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<html lang="en">

<head>

  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>Salon - Register</title>

  <!-- Custom fonts for this template-->
  <link href="../../static/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">

  <!-- Custom styles for this template-->
  <link href="../../static/css/sb-admin.css" rel="stylesheet">

</head>

<body class="bg-dark">

  <div class="container">
    <div class="card card-register mx-auto mt-5">
      <div class="card-header">Register an Account</div>
      <div class="card-body">
        <form:form action="addEmployee" method="post" modelAttribute="employee">
          <div class="form-group">
            <div class="form-row">
              <div class="col-md-6">
                <div class="form-label-group">
                  <form:input type="text" id="firstName" path="firstName" class="form-control" required="required" autofocus="autofocus"/>
                  <label for="firstName">First name</label>
                </div>
              </div>
              <div class="col-md-6">
                <div class="form-label-group">
                  <form:input type="text" id="lastName" path="lastName" class="form-control" required="required"/>
                  <label for="lastName">Last name</label>
                </div>
              </div>
            </div>
          </div>
          <div class="form-group">
            <div class="form-row">
              <div class="col-md-6">
                <div class="form-label-group">
                  <form:input type="email" id="inputEmail" path="email" class="form-control" required="required"/>
                  <label for="inputEmail">Email address</label>
                </div>
              </div>
              <div class="col-md-6">
                <div class="form-label-group">
                  <form:input type="text" id="phone" path="phone" class="form-control"/>
                  <label for="phone">Phone</label>
                </div>
              </div>
            </div>
          </div>
          <div class="form-group">
            <div class="form-row">
              <div class="col-md-6">
                <div class="form-label-group">
                  <form:input type="password" id="input_password" path="password" class="form-control" required="required"/>
                  <label for="input_password">Password</label>
                </div>
              </div>
              <div class="col-md-6">
                <div class="form-label-group">
                  <input type="password" id="confirm_password" class="form-control" required="required"/>
                  <label for="confirm_password">Confirm password</label>
                </div>
              </div>
            </div>
          </div>
          <button class="btn btn-primary btn-block form-button" type="submit">Register</button>
        </form:form>
        <div class="text-center">
          <a class="d-block small mt-3" href="login.html">Login Page</a>
         <!-- <a class="d-block small" href="forgot-password.html">Forgot Password?</a> -->
        </div>
      </div>
    </div>
  </div>

  <!-- Bootstrap core JavaScript-->
  <script src="../../static/vendor/jquery/jquery.min.js"></script>
  <script src="../../static/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  <!-- Core plugin JavaScript-->
  <script src="../../static/vendor/jquery-easing/jquery.easing.min.js"></script>
  <script src="../../static/js/register.js"></script>
</body>

</html>
