<?php
		error_reporting(1);
		
		session_start();
		if ($_COOKIE["auth"] != "admin_in") {header("location:"."./");}
			include("includes/connect.php");
			?>
			<!DOCTYPE html>
			<html lang="en">
			<head>
				<meta charset="utf-8">
				<meta http-equiv="X-UA-Compatible" content="IE=edge">
				<meta name="viewport" content="width=device-width, initial-scale=1">
				<meta name="author" content="@housamz">

				<meta name="description" content="Admin Panel">
				<title>Admin Panel</title>
			<link href="https://maxcdn.bootstrapcdn.com/bootswatch/3.3.7/cosmo/bootstrap.min.css" rel="stylesheet" integrity="sha384-h21C2fcDk/eFsW9sC9h0dhokq5pDinLNklTKoxIZRUn3+hvmgQSffLLQ4G4l2eEr" crossorigin="anonymous">

				<!-- jQuery Version 1.11.1 -->
				<script src="https://code.jquery.com/jquery-1.12.0.min.js"></script>

				<!-- Bootstrap Core JavaScript -->
				<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js" integrity="sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS" crossorigin="anonymous"></script>

				<!--<script type="text/javascript" src="//cdn.ckeditor.com/4.4.3/standard/ckeditor.js"></script>-->
				<script type="text/javascript" src="//cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js"></script>
				<script type="text/javascript" src="//cdn.datatables.net/1.10.16/js/dataTables.bootstrap.min.js"></script>


				<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.min.js"></script>
				<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.min.css" id="theme-styles"/>

				<!-- Custom CSS -->
				<link rel="stylesheet" href="css/style.css">
				 <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css"/>
				<link href="//cdn.datatables.net/1.10.16/css/dataTables.bootstrap.min.css" rel="stylesheet" type="text/css" />
				
				<link href="css/bootstrap-datepicker.min.css" type="text/css" media="all" rel="stylesheet" />
				<script type="text/javascript" src="js/moment-with-locales.min.js"></script>
				<script type="text/javascript" src="js/bootstrap-datepicker.min.js"></script>
				<script type="text/javascript" src="js/bootstrap-datepicker.es.min.js"></script>
				

				<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
				<!-- WARNING: Respond.js doesnt work if you view the page via file:// -->
				<!--[if lt IE 9]>
					<script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
					<script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
				<![endif]-->
				
				<script>
					/*$(document).ready(function() {
						alert( "document loaded" );
					});*/
				 
					$(window).on( "load", function() {
						
						<?php
							$errorMsg = "";
							if (isset($_GET["errorMsg"])) {
								$errorMsg =  $_GET["errorMsg"];
							}
							echo 'var errorMsg = "' . $errorMsg . '";';
						?>
						
						if(errorMsg != ""){
							Swal.fire({
							  title: errorMsg,
							  icon: "info",
							  confirmButtonText: "Ok!",
							  showClass: {
								popup: "animate__animated animate__fadeInDown"
							  },
							  hideClass: {
								popup: "animate__animated animate__fadeOutUp"
							  }
							})
						}
					});
				</script>
				
				<style>
					#sorted tbody tr.selected {
						color: white !important;
						background-color: #eeeeee !important;
					}
				</style>
			</head>

			<body>

			<div class="wrapper">
				<!-- Sidebar Holder -->
				<nav id="sidebar" class="bg-primary">
					<div class="sidebar-header">
						<h3>
							Admin Panel<br>
							<i id="sidebarCollapse" class="glyphicon glyphicon-circle-arrow-left"></i>
						</h3>
						<strong>
							Admin Panel<br>
							<i id="sidebarExtend" class="glyphicon glyphicon-circle-arrow-right"></i>
						</strong>
					</div><!-- /sidebar-header -->

					<!-- start sidebar -->
					<ul class="list-unstyled components">
						<li>
							<a href="home.php" aria-expanded="false">
								<i class="glyphicon glyphicon-home"></i>
								Home
							</a>
						</li>
						</li>
						<li>
							<a href="#animalSubmenu" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle">
								<i class="glyphicon glyphicon-phone"></i>Historico animal
							</a>
							<ul class="collapse list-unstyled" id="animalSubmenu">
								<li><a href="animal_seccion.php">Historico</a></li>
								<li><a href="animal_informacion.php">Animales</a></li>
								<li><a href="animal_enfermedades.php">Enfermedades</a></li>
								<li><a href="animal_tratamiento.php">Tratamientos</a></li>
							</ul>
						</li>
						<li><a href="colaborador_seccion.php"> <i class="glyphicon glyphicon-phone"></i>Colaboradores </a></li>
						<li><a href="recurso_seccion.php"> <i class="glyphicon glyphicon-phone"></i>Recursos </a></li>
						<li>
							<a href="#economicoSubmenu" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle">
								<i class="glyphicon glyphicon-phone"></i>Economico
							</a>
							<ul class="collapse list-unstyled" id="economicoSubmenu">
								<li><a href="economico_main_pago.php">Pagos</a></li>
								<li><a href="economico_main_cuenta.php">Cuentas</a></li>
							</ul>
						</li>
						<li><a href="logout.php"><i class="glyphicon glyphicon-log-out"></i> Logout</a></li>
					</ul>

			</nav><!-- /end sidebar -->

			<!-- Page Content Holder -->
			<div id="content">