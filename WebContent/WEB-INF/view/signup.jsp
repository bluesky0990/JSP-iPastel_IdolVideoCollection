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
			font-family: "NanumGothicCoding";
			src: url("./font/NanumGothicCoding.ttf");
		}
		
		* {
			font-family: "NanumGothicCoding";
		}
		
		.font-white-package {
			font-family: "NanumGothicCoding";
			color: #eee;
		}
		.font-black-package {
			font-family: "NanumGothicCoding";
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
	<script type="text/javascript">
		var idCheck = "false";
		
		function mCheck() {
			var id = encodeURIComponent(document.getElementById("signup_id").value);
			console.log(id);
			
			if(id !== "") {
				$.ajax({
					url:'idCheck.on',
					type:'post',
					data: {"id":id},
					async:true,
					success:function(chk) {
						idCheck = chk + "";
						console.log(idCheck);
						if("true" === idCheck) {
							alertHide();
							$("#alert_success_idChk").show();
							$("#signup_id").attr("readonly", true);
						} else {
							alertHide();
							$("#alert_failed_idChk").show();
						}
					},
					error:function() {
						alert("페이지 오류 발생, 페이지를 다시 불러와주시길 바랍니다.");
					}
				});
			} else {
				alertHide();
				$("#alert_failed_nullIdEntry").show();
			}
			
		}
		
		function idCheckOnSubmit() {
			var pwd = document.getElementById("signup_pw").value;;
			var name = document.getElementById("signup_name").value;
			if(idCheck !== "true") {
				alertHide();
				$("#alert_failed_noTryChk").show();
				return
			}
			if(pwd === "" || name === "") {
				alertHide();
				$("#alert_failed_nullEntry").show();
				return
			}
			if(idCheck === "true" && pwd !== "" && name !== "") {
				if(idCheck !== "true") {
					return
				}
				if(pwd === "") {
					return
				}
				if(name === "") {
					return
				}
				$("#form_signup").submit();
			}
		}
		function alertClose(id) {
			$("#" + id).hide();
		}
		function alertHide() {
			$("#alert_success_idChk").hide();
			$("#alert_failed_nullIdEntry").hide();
			$("#alert_failed_nullEntry").hide();
			$("#alert_failed_noTryChk").hide();
			$("#alert_failed_idChk").hide();
		}
	</script>
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
			<form id="form_signup" action="signup_finish.do" method="post">
				<table>
					<tr>
						<td>
							<!-- Success Alert -->
							<div id="alert_success_idChk" class="alert alert-success" style="display:none;">
							<a onclick="alertClose('alert_success_idChk');" href="#" class="close" aria-label="close">×</a>
								<strong>Success!</strong> 사용가능한 ID입니다.
							</div>
							<!-- Failed Alert -->
							<div id="alert_failed_idChk" class="alert alert-danger" style="display:none;">
							<a onclick="alertClose('alert_failed_idChk');" href="#" class="close" aria-label="close">×</a>
								<strong>Failed!</strong> 이미 존재하는 ID입니다.
							</div>
							<div id="alert_failed_noTryChk" class="alert alert-danger" style="display:none;">
							<a onclick="alertClose('alert_failed_noTryChk');" href="#" class="close" aria-label="close">×</a>
								<strong>Failed!</strong> ID 중복체크를 해주시기 바랍니다.
							</div>
							<div id="alert_failed_nullIdEntry" class="alert alert-danger" style="display:none;">
							<a onclick="alertClose('alert_failed_nullIdEntry');" href="#" class="close" aria-label="close">×</a>
								<strong>Failed!</strong> ID 입력 후 중복확인을 해주시기 바랍니다.
							</div>
							<div id="alert_failed_nullEntry" class="alert alert-danger" style="display:none;">
							<a onclick="alertClose('alert_failed_nullEntry');" href="#" class="close" aria-label="close">×</a>
								<strong>Failed!</strong> 빈 칸 없이 모두 입력해주시기 바랍니다.
							</div>
							
							<!-- ID -->
							<div class="input-group mb-3">
								<div class="input-group-prepend">
									<div class="input-group-prepend">
										<span class="input-group-text">&nbsp;i&nbsp;&nbsp;d&nbsp;</span>
									</div>
									<input type="text" class="form-control" id="signup_id" name="signup_id">
								</div>
								<input type="button" value="Chk" class="btn btn-outline-dark" onclick="mCheck();">
							</div>
						</td>
					</tr>
					
					<tr>
						<td>
							<!-- PW -->
							<div class="input-group mb-3">
								<div class="input-group-prepend">
									<span class="input-group-text">&nbsp;p&nbsp;&nbsp;w</span>
								</div>
								<input type="password" class="form-control" id="signup_pw" name="signup_pw">
							</div>
						</td>
					</tr>
					
					<tr>
						<td>
							<!-- name -->
							<div class="input-group mb-3">
								<div class="input-group-prepend">
									<span class="input-group-text">name</span>
								</div>
								<input type="text" class="form-control" id="signup_name" name="signup_name">
							</div>
						</td>
					</tr>
					
					<tr>
						<td>
							<!-- Button -->
							<br>
							<div class="text-center">
								<input type="button" onclick="idCheckOnSubmit();" class="form-control btn btn-dark mb-2" value="Submit">
								<button class="form-control btn btn-outline-dark">back</button>
							</div>
						</td>
					</tr>
				</table>
			</form>
		</div>
	</div>
</body>
</html>