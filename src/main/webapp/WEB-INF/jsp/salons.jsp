<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<!DOCTYPE html>
<html lang="en">

<head>

  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>Salon</title>

  <!-- Custom fonts for this template-->
  <link href="../static/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">

  <!-- Page level plugin CSS-->
  <link href="../static/vendor/datatables/dataTables.bootstrap4.css" rel="stylesheet">

  <!-- Custom styles for this template-->
  <link href="../static/css/sb-admin.css" rel="stylesheet">

</head>

<body id="page-top">

  <div id="wrapper">

    <!-- Sidebar -->
    <ul class="sidebar navbar-nav">
      <li class="nav-item active">
        <a class="nav-link" href="index.html">
          <i class="fas fa-fw fa-tachometer-alt"></i>
          <span>Dashboard</span>
        </a>
      </li>
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="pagesDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          <i class="fas fa-fw fa-folder"></i>
          <span>Pages</span>
        </a>
        <div class="dropdown-menu" aria-labelledby="pagesDropdown">
          <a class="dropdown-item" href="register">Register</a>
          <a class="dropdown-item" href="../../static/404.html">404 Page</a>
          <a class="dropdown-item" href="../../static/blank.html">Blank Page</a>
          <a class="dropdown-item" href="#" data-toggle="modal" data-target="#logoutModal">Logout</a>
        </div>
      </li>

      <li class="nav-item">
        <a class="nav-link" href="salons">
          <i class="fas fa-fw fa-table"></i>
          <span>Salons</span></a>
      </li>
      <li class="nav-item">
              <a class="nav-link" href="salons">
                <i class="fas fa-fw fa-table"></i>
                <span>Appointments</span></a>
            </li>
       <li class="nav-item">
                     <a class="nav-link" href="salons">
                       <i class="fas fa-fw fa-table"></i>
                       <span>Campaigns</span></a>
                   </li>
        <li class="nav-item">
                      <a class="nav-link" href="salons">
                        <i class="fas fa-fw fa-table"></i>
                        <span>Haircuts</span></a>
                    </li>
        <li class="nav-item">
                      <a class="nav-link" href="salons">
                        <i class="fas fa-fw fa-table"></i>
                        <span>Products</span></a>
                    </li>
    </ul>

    <div id="content-wrapper">

      <div class="container-fluid">

        <!-- Breadcrumbs-->
        <ol class="breadcrumb">
          <li class="breadcrumb-item">
            <a href="#">Dashboard</a>
          </li>
          <li class="breadcrumb-item active">Overview</li>
        </ol>

        <!-- DataTables Example -->
        <div class="card mb-3">
          <div class="card-header">
            <i class="fas fa-table"></i>
            Salons</div>
          <div class="card-body">
            <div class="table-responsive">
              <table class="table table-bordered" id="dataTable" maxWidth="100%" cellspacing="0">
                <thead>
                  <tr>
                    <th>ID</th>
                    <th>Salon name</th>
                    <th>Latitude</th>
                    <th>Longitude</th>
                    <th>Edit</th>
                    <th>Delete</th>
                  </tr>
                </thead>

             <tbody>
                <c:forEach items="${salons}" var="s"  varStatus="count">
                                    <form id="form-${count.index}" name="form-${count.index}" action="editSalon" method="post" modelAttribute="s">
                                            <tr>
                                                <td>
                                                    ${s.salonId}
                                                    <input name="salonId" value="${s.salonId}" class="invisible"/>
                                                </td>
                                                <td>
                                                    <span id="span-name-${count.index}">${s.name}</span>
                                                    <input id="input-name-${count.index}"
                                                    class="editable-input" name="name" value="${s.name}"/>
                                                </td>
                                                <td>
                                                   <span id="span-lat-${count.index}">${s.latitude}</span>
                                                   <input id="input-lat-${count.index}" class="editable-input" name="latitude" value="${s.latitude}"/>
                                                </td>
                                                <td>
                                                    <span id="span-lon-${count.index}">${s.longitude}</span>
                                                    <input id="input-lon-${count.index}" class="editable-input" name="longitude" value="${s.longitude}"/>
                                                </td>
                                                <td>
                                                   <button type="button" id="edit-${count.index}" value="${count.index}" onclick="showInputs(${count.index})" class="btn btn-dark edit mt-0 mb-0"
                                                                                                     >Edit</button>
                                                                 <button type="submit" id="apply-${count.index}" value="${count.index}" class="btn btn-dark apply mt-0 mb-0" onclick="hideInputs(${count.index})">Apply</button>
                                                </td>
                                                <td>
                                                <button type="button" class="btn btn-dark delete mt-0 mb-0" value="form${userCount.index}">Delete</button>
                                                </td>
                                            </tr>

                                </c:forEach>
</tbody>

              </table>
            </div>
          </div>
        </div>

      </div>

    </div>

  </div>

  <!-- Scroll to Top Button-->
  <a class="scroll-to-top rounded" href="#page-top">
    <i class="fas fa-angle-up"></i>
  </a>

  <!-- Logout Modal-->
  <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
          <button class="close" type="button" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">x</span>
          </button>
        </div>
        <div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
        <div class="modal-footer">
          <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
          <a class="btn btn-primary" href="login.html">Logout</a>
        </div>
      </div>
    </div>
  </div>

  <!-- Bootstrap core JavaScript-->
  <script src="../static/vendor/jquery/jquery.min.js"></script>
  <script src="../static/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  <!-- Core plugin JavaScript-->
  <script src="../static/vendor/jquery-easing/jquery.easing.min.js"></script>

  <!-- Page level plugin JavaScript-->
  <script src="../static/vendor/datatables/jquery.dataTables.js"></script>
  <script src="../static/vendor/datatables/dataTables.bootstrap4.js"></script>

  <!-- Custom scripts for all pages-->
  <script src="../static/js/sb-admin.min.js"></script>
  <script src="../static/js/salons.min.js"></script>

  <!-- Demo scripts for this page-->
  <script src="../static/js/demo/datatables-demo.js"></script>

</body>

</html>
