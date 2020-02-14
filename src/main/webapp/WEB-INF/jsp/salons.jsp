<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
      integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
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

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
</head>

<body>

<div id="wrapper">

    <!-- Sidebar -->
    <ul class="sidebar navbar-nav">
        <li class="nav-item active">
            <a class="nav-link" href="salons">
                <i class="fa fa-fw far fa-building"></i>
                <span>Salons</span></a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="salons">
                <i class="fa fa-fw fas fa-book"></i>
                <span>Appointments</span></a>
        </li>

        <li class="nav-item">
            <a class="nav-link" href="salons">
                <i class="fa fa-cog fa-fw fas fa-cut"></i>
                <span>Haircuts</span></a>
        </li>

        <li class="nav-item">
            <a class="nav-link" href="#" data-toggle="modal" data-target="#logoutModal" onclick="showLogoutModal()">
                <i class="fa fa-cog fa-fw fas fa-sign-out-alt"></i>
                <span>Logout</span></a>
        </li>

        <li class="nav-item">
            <a class="nav-link" href="register">
                <i class="fa fa-cog fa-fw fas fa-user"></i>
                <span>Register</span></a>
        </li>

    </ul>

    <div id="content-wrapper">

        <div class="container-fluid">

            <!-- Breadcrumbs-->
            <ol class="breadcrumb">
                <li class="breadcrumb-item active" style="padding-left: 0.75rem;">Salons</li>
            </ol>

            <div class="card mb-3">

                <div class="card-body">
                    <a href="#" data-toggle="modal" data-target="#insertModal" id="insert"
                       class="btn btn-dark add-btn">Add entry</a>
                </div>

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
                            <c:forEach items="${salons}" var="s" varStatus="count">
                            <form id="form-${count.index}" name="form-${count.index}" action="editSalon" method="post"
                                  modelAttribute="s" onSubmit="return false;">
                                <tr>
                                    <td>
                                            ${s.salonId}
                                        <input name="salonId" id="input-id-${count.index}" value="${s.salonId}"
                                               class="invisible editable-input"/>
                                    </td>
                                    <td>
                                        <span id="span-name-${count.index}">${s.name}</span>
                                        <input id="input-name-${count.index}"
                                               class="editable-input" name="name" value="${s.name}"/>
                                    </td>
                                    <td>
                                        <span id="span-lat-${count.index}">${s.latitude}</span>
                                        <input id="input-lat-${count.index}" class="editable-input" name="latitude"
                                               value="${s.latitude}"/>
                                    </td>
                                    <td>
                                        <span id="span-lon-${count.index}">${s.longitude}</span>
                                        <input id="input-lon-${count.index}" class="editable-input" name="longitude"
                                               value="${s.longitude}"/>
                                    </td>
                                    <td>
                                        <button type="button" id="edit-${count.index}" value="${count.index}"
                                                onclick="showInputs(${count.index})" class="btn btn-dark edit mt-0 mb-0"
                                        >Edit
                                        </button>
                                        <button type="submit" id="apply-${count.index}" value="${count.index}"
                                                class="btn btn-dark apply mt-0 mb-0"
                                                onclick="hideInputs(${count.index})">Apply
                                        </button>
                                    </td>
                                    <td>
                                        <button type="button" class="btn btn-dark delete mt-0 mb-0"
                                                value="form${userCount.index}" onclick="deleteEntry(${count.index})">
                                            Delete
                                        </button>
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

<!-- Insert Modal-->
<div class="modal fade" id="insertModal" tabindex="-1" role="dialog"
     aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Insert salon</h5>

            </div>


            <div class="card-body">


                <form:form action="addSalon" method="post" modelAttribute="salon">
                <div class="form-group" style="margin-right: 1rem;">
                    <div class="form-row">
                        <div class="col-md-12">
                            <div class="form-label-group">
                                <form:input type="text" id="inputName" path="name" class="form-control"
                                            required="required"
                                            autofocus="autofocus"/>
                                <label for="name">Name</label>
                            </div>
                        </div>

                    </div>
                    <div class="form-group">
                        <div class="form-row">
                            <div class="col-md-6">
                                <div class="form-label-group">
                                    <form:input type="number" id="inputLat" path="latitude" class="form-control"
                                                required="required"/>
                                    <label for="inputLat">Latitude</label>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-label-group">
                                    <form:input type="number" id="inputLon" path="longitude" class="form-control"/>
                                    <label for="inputLon">Longitude</label>
                                </div>
                            </div>
                        </div>

                        <div class="form-group">
                            <div class="form-row">
                                <div class="col-md-6">
                                    <button class="btn btn-primary btn-block form-button" type="button"
                                            data-dismiss="modal">Cancel
                                    </button>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-label-group">
                                        <button class="btn btn-primary btn-block form-button" onclick="addSalon()"
                                                data-dismiss="modal"
                                                data-toggle="modal" data-target="#successModal">Save
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </div>
                        </form:form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Logout Modal-->
<div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
     aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Ready to Leave?</h5>
            </div>
            <div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
            <div class="modal-footer">
                <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
                <a class="btn btn-primary" href="login.html">Logout</a>
            </div>
        </div>
    </div>
</div>

<!--success modal-->
<div class="modal fade successModal" id="successModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Success!</h5>

            </div>
            <div class="modal-body">The salon has been successfully inserted.</div>
            <div class="modal-footer">
                <button class="btn btn-secondary" type="button" data-dismiss="modal" onclick="redirect()">OK</button>
            </div>
        </div>
    </div>
</div>

<!-- Page level plugin JavaScript-->
<script src="../static/vendor/datatables/jquery.dataTables.js"></script>
<script src="../static/vendor/datatables/dataTables.bootstrap4.js"></script>

<!-- Custom scripts for all pages-->
<script src="../static/js/sb-admin.js"></script>
<script src="../static/js/salons.min.js"></script>

<!-- Demo scripts for this page-->
<script src="../static/js/demo/datatables-demo.js"></script>

</body>

</html>
