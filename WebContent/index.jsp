<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<title>iPastel :: Main</title>
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
		});
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
		<div class="container-fluid p-0">
			<a href="index.jsp"><img src="img/banner_v2.png" class="img-fluid"></a>
		</div>
		
		
		
		<div class="row container-fluid p-0">
			<!-- navbar -->
			<div class="col-3">
				<div class="container-fluid text-left p-0 pt-1 mt-2" style="width:90%;">
					<!-- search bar -->
					<div class="input-group d-flex justify-content-center mb-2">
						<form class="form-inline" action="#">
							<input class="form-control" type="text" placeholder="Search"">
							<div class="input-group-append">
								<button class="btn btn-light" type="submit">Search</button>  
							</div>
						</form>
					</div>
					
					<!-- menu bar -->
					<div>
						<ul class="nav navbar-nav">
							<a href="-----------?boardNo=1"><li class="text-center border border-white font-white-package py-2" style="background-color: #24292e;">자유게시판</li></a>
							<c:forEach var="dto_board" items="${dtos_board}">
								<a href="-----------?boardNo=${dto_board.boardNo}"><li class="text-center border border-white font-white-package py-2" style="background-color: #24292e;">${dto_board.boardName}</li></a>
							</c:forEach>
						</ul>
					</div>
				</div>
			</div>
			
			
			
			<!-- center -->
			<div class="col-9">
				<div class="container-fluid">
					<!-- 320x180 p1 m2, 12개, 최신순 -->
					<c:forEach var="dto_youtube" items="${dtos_youtube}">
						<!-- <iframe class="p-1 m-3 my-1" allowfullscreen="" frameborder="0" height="180" src="https://www.youtube.com/embed/mvBR8q7Y0OI?rel=0" width="320"></iframe> </p> -->
						<iframe class="p-1 m-3 my-1" allowfullscreen="" frameborder="0" height="180" src="${dto_youtube.url}" width="320"></iframe>
					</c:forEach>
				</div>
			</div>
		</div>
		
		<!-- footer -->
		<div id="footer" class="text-center text-white second mt-2" style="background-color: #223547;">
			<br>
			<a href="">회사소개</a> | <a href="">인재채용</a> | <a href="">이용약관</a> | <a href="">개인정보처리방침</a> | <a href="">청소년보호정책</a> | <a href="">고객센터</a>&nbsp;&copy;58￥ corp.
			<br><br><br>
		</div>
	</div>
</body>
</html>