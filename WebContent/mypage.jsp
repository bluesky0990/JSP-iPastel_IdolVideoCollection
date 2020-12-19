<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<title>iPastel :: MyPage</title>
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
		
		.container_bar {
			position: fixed;
			z-index: 1;
			width: 100%;
			transition: top 1s;
			background-color: #24292e;
		}
		
		#btn_modifiy:link {
			color: blue;
			text-decoration: underline;
		}
		#btn_modifiy:hover {
			color: blue;
			text-decoration: underline;
		}
		#btn_modifiy:visited {
			color: blue;
			text-decoration: underline;
		}
		#btn_modifiy:active {
			color: blue;
			text-decoration: underline;
		}
		
		#btn_modifiy_submit:link {
			color: blue;
			text-decoration: underline;
		} 
		#btn_modifiy_submit:hover {
			color: blue;
			text-decoration: underline;
		}
		#btn_modifiy_submit:visited {
			color: blue;
			text-decoration: underline;
		}
		#btn_modifiy_submit:active {
			color: blue;
			text-decoration: underline;
		}
	</style>
	<script type="text/javascript">
		$().ready(function() {
			var prevScrollpos = window.pageYOffset;
			window.onscroll = function() {
			var currentScrollPos = window.pageYOffset;
			  if (prevScrollpos > currentScrollPos) {
			    document.getElementById("top_bar").style.top = "0";
			  } else {
			    document.getElementById("top_bar").style.top = "-50px";
			  }
			  prevScrollpos = currentScrollPos;
			}
			
			
			$("#btn_modifiy").click(function() {
				var disabled = $("#signup_pw").attr("disabled");
				
				if(disabled === "disabled") {
					var html = "";
					html += '<td>';
					html += '<div class="input-group mb-3">';
					html += '<div class="input-group-prepend">';
					html += '<span class="input-group-text">c&nbsp;h&nbsp;k</span>';
					html += '</div>';
					html += '<input type="password" class="form-control" id="signup_confirm" name="signup_confirm">';
					html += '</div>';
					html += '</td>';
					html += '<td>';
					html += '<p id="btn_modifiy_submit" onclick="confirmModify();" style="color:blue;">Modify</p>';
					html += '</td>';
					
					$("#confirm_modify").html(html);
					$("#signup_pw").attr("disabled", false);
					$("#btn_modifiy").html("Cancel");
				} else if(disabled === undefined) {
					$("#signup_pw").attr("disabled", true);
					$("#confirm_modify").html("");
					$("#btn_modifiy").html("Modify");
					$("#alert_danger").hide();
				}
			});
			
			$("#btn_modifiy_submit").click(function() {
				
			});
			$("#btn_DeleteAccount").click(function(e) {
				e.preventDefault();
				$("#modalDeleteAccount").modal("show");
			});
		});
		function confirmModify() {
			console.log(1);
			var pw1 = $("#signup_pw").val();
			var pw2 = $("#signup_confirm").val();
			console.log(pw1+pw2);
			if(pw1 === pw2) {
				// member 테이블 내의 pw 값 업데이트
				console.log(true);
			} else {
				$('.alert').show();
			}
		}
		function alertClose(id) {
			$("#" + id).hide();
		}
	</script>
</head>
<body>
	<div class="container-fluid p-0">
		<!-- top_bar -->
		<div id="top_bar" class="container_bar container-fulid d-flex flex-row-reverse p-1">
			<c:choose>
				<c:when test="${state eq 'login'}">
            		${session_name}님 환영합니다.
            		<input class="btn btn-light btn-sm" type="button" value="마이페이지" onclick="location.href='mypage.do'">
					<input class="btn btn-light btn-sm" type="button" value="로그아웃" onclick="location.href='logout.do'">
				</c:when>
				<c:otherwise>
					<c:if test="${faildLogin eq 'fail'}">
 						존재하지 않거나 잘못된 아이디 또는 비밀번호를 입력하셨습니다.
  					</c:if>
					<form action="login.do" method="post" class="font-white-package">
						<label for="login_id" class="form-control-text">id&nbsp;</label><input type="text" id="login_id" name="login_id" class="btn btn-outline-light btn-sm button-none-hover" style="width:150px;">&nbsp;&nbsp;
						<label for="login_pw"class="form-control-text">pw&nbsp;</label><input type="password" id="login_pw" name="login_pw" class="btn btn-outline-light btn-sm button-none-hover" style="width:150px;">
						<input type="button" value="SignIn" class="btn btn-light btn-sm">
						<input type="button" value="SignUp" class="btn btn-light btn-sm">
					</form>
				</c:otherwise>
			</c:choose>
		</div>
	
	
	
		<!-- banner -->
		<div class="container-fluid p-0 pb-5">
			<a href="index.jsp"><img src="img/banner_v2.png" class="img-fluid"></a>
		</div>
		
		
		<!-- form -->
		<div class="container">
			<br>
			<div class="d-flex justify-content-center p-5">
				<form action="update.do" method="post">
					<table>
						<tr>
							<td>
								<!-- Alert -->
								<div id="alert_danger" class="alert alert-danger" style="display:none;">
									<a href="#" class="close" aria-label="close" onclick="alertClose('alert_danger');">×</a>
									<strong>Error!</strong> Not Incorrect Password!
								</div>
							</td>
						</tr>
						<tr>
							<td>
								<div class="input-group mb-3">
									<div class="input-group-prepend">
										<span class="input-group-text">name</span>
									</div>
									<input type="text" class="form-control" id="signup_name" name="signup_name" value="${dto_mypage.name}" disabled>
								</div>
							</td>
						</tr>
						<tr>
							<td>
								<div class="input-group mb-3">
									<div class="input-group-prepend">
										<span class="input-group-text">&nbsp;i&nbsp;&nbsp;d&nbsp;</span>
									</div>
									<input type="text" class="form-control" id="signup_id" name="signup_id" value="${dto_mypage.id}" disabled>
								</div>
							</td>
						</tr>
						
						<tr>
							<td>
								<div class="input-group mb-3">
									<div class="input-group-prepend">
										<span class="input-group-text">&nbsp;p&nbsp;&nbsp;w</span>
									</div>
									<input type="password" class="form-control" id="signup_pw" name="signup_pw" value="${dto_mypage.pw}" disabled>
								</div>
							</td>
							
							<td>
								<p id="btn_modifiy" style="color:blue;">Modify</p>
							</td>
						</tr>
						
						<tr id="confirm_modify"></tr>
						
						<tr>
							<td>
								<button id="btn_DeleteAccount" class="form-control btn btn-light font-black-package">Delete Account</button>
								
								<!-- 회원가입 확인 Modal-->
								<div class="modal fade" id="modalDeleteAccount" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
									<div class="modal-dialog" role="document">
										<div class="modal-content">
											<div class="modal-header">
												<h5 class="modal-title" id="exampleModalLabel">Delete Account</h5>
												<button class="close" type="button" data-dismiss="modal" aria-label="Close">
												<span aria-hidden="true">X</span>
												</button>
											</div>
											
											<div class="modal-body">정말 계정을 삭제하시겠습니까?</div>
											<div class="modal-footer">
												<a class="btn" id="modalY" href="#">예</a>
												<button class="btn" type="button" data-dismiss="modal">아니요</button>
											</div>
										</div>
									</div>
								</div>
							</td>
						</tr>
					</table>
				</form>
			</div>
			<br>
		</div>
		
		
		<!-- footer -->
		<div id="footer" class="text-center text-white second mt-2 pt-5" style="background-color: #223547;">
			<br>
			<a href="">회사소개</a> | <a href="">인재채용</a> | <a href="">이용약관</a> | <a href="">개인정보처리방침</a> | <a href="">청소년보호정책</a> | <a href="">고객센터</a>&nbsp;&copy;58￥ corp.
			<br><br><br>
		</div>
	</div>
</body>
</html>