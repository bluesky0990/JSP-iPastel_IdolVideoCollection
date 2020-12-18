<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>iPastel :: Signup</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
	<style type="text/css">
		@font-face {
			font-family: "Arita-buriM";
			src: url("./font/Arita-buriM.otf");
		}
		
		* {
			font-family: "Arita-buriM";
		}
		
		.font-white-package {
			font-family: "Arita-buriM";
			color: #eee;
		}
		.font-black-package {
			font-family: "Arita-buriM";
			color: #24292e;
		}
		
		.button-none-hover:hover {
			background-color: #24292e;
			color: #eee;	
		}
		
		a:link {
			color: #eee;
			text-decoration: none;
		}
		a:hover {
			color: #eee;
			text-decoration: none;
		}
		a:visited {
			color: #eee;
			text-decoration: none;
		}
		a:active {
			color: #eee;
			text-decoration: none;
		}
	
		#background {
			position: relative;
		}
		
		#form {
			position: absolute;
			top: 50%;
			left: 50%;
			transform: translate(-50%, -50%);
		}
	</style>
</head>
<body>
	<div class="container-fluid p-0 m-0">
		<!-- background -->
		<div class="container-fluid p-0 m-0">
			<img id="background" src="img/signup.jpg" class="img-fluid" style="opacity: 0.6;">
		</div>
		
		<!-- form -->
		<div id="form" class="card rounded-lg bg-light p-4 py-5 pb-4">
			<h4>SignUp</h4>
			<br><br>
			<form action="signup.do" method="post">
				<div class="input-group mb-3">
					<div class="input-group-prepend">
						<span class="input-group-text">&nbsp;i&nbsp;&nbsp;d&nbsp;</span>
					</div>
					<input type="text" class="form-control" id="signup_id" name="signup_id">
				</div>
				
				<div class="input-group mb-3">
					<div class="input-group-prepend">
						<span class="input-group-text">&nbsp;p&nbsp;&nbsp;w</span>
					</div>
					<input type="text" class="form-control" id="signup_pw" name="signup_pw">
				</div>
				
				<div class="input-group mb-3">
					<div class="input-group-prepend">
						<span class="input-group-text">name</span>
					</div>
					<input type="text" class="form-control" id="signup_name" name="signup_name">
				</div>
				
				<br>
				
				<div class="text-center">
					<button type="submit" class="form-control btn btn-dark mb-2">Submit</button>
					<button class="form-control btn btn-secondary">back</button>
				</div>
			</form>
		</div>
	</div>
</body>
</html>