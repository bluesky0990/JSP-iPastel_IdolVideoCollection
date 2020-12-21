<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<title>iPastel :: Write</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
	<c:choose>
		<c:when test="${param.boardNo eq '1'}">
			<script type="text/javascript" src="./ckeditor_noPl/ckeditor.js"></script>
		</c:when>
		<c:otherwise>
			<script type="text/javascript" src="./ckeditor_inPl/ckeditor.js"></script>
		</c:otherwise>
	</c:choose>
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
		.dropdownHover:hover {
			background-color: gray;
		}
		.dropdownHover:active {
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
			
			$("#btn_signin").click(function() {
				$("#form_login").submit();
			});
			
			$("#btn_addBoardType").click(function(e) {
				e.preventDefault();
				$("#modalAddBoardType").modal("show");
			});
			
			$("#btn_addBoardTypeOnModal").click(function () {
				var boardName = $("#input_addBoardType").val();
				if(boardName !== "") {
					$.ajax({
						url:'addBoardType.on',
						type:'post',
						data: {"boardName":boardName},
						async:true,
						success:function(chk) {
							if(chk === "true") {
								$("#input_addBoardType").val("");
								$("#alert_success").show();
							}
						},
						error:function() {
							alert("페이지 오류 발생, 페이지를 다시 불러와주시길 바랍니다.");
						}
					});
				}
			});
			
			CKEDITOR.replace('ckeditor4', {
				width: "100%",
				height: 450,
				language_list: ['kor:Korean', 'jpn:Japanese']
				//filebrowserUploadUrl: "imageUploadOnForm.on"
			});
			window.parent.CKEDITOR.tools.callFunction(1, "${url}", "전송완료");
			$("#write_btnSubmit").click(function() {
				var title = $("#write_title").val();
				var content = CKEDITOR.instances['ckeditor4'].getData();
				if(title !== "" && content !== "") {
					$("#content").val(content);
					$("#boardUpdateForm").submit();	
				} else {
					alert("빈 칸 없이 입력해주시기 바랍니다.");
				}
			});
			//https://m.blog.naver.com/PostView.nhn?blogId=jskimmail&logNo=221600848149&proxyReferer=https:%2F%2Fwww.google.com%2F
			CKEDITOR.editorConfig = function(config) {
				// write api
			};

			var aa = $('#content').val();
			CKEDITOR.instances['ckeditor4'].setData(aa);
			console.log(aa);
		});
	</script>
</head>
<body>
	<div class="container-fluid p-0">
		<!-- top_bar -->
		<div id="top_bar" class="container_bar container-fulid d-flex flex-row-reverse p-1">
			<c:choose>
				<c:when test="${state eq 'login'}">
					<div class="px-5">
						<c:choose>
							<c:when test="${empty session_profileImg}">
								<img src="img/userProfile.png" class="rounded-circle" width="40" height="40">
							</c:when>
							<c:otherwise>
								<img src="img/userProfile/${session_profileImg}" class="rounded-circle" width="40" height="40">
							</c:otherwise>
						</c:choose>
	            		<p class="font-white-package d-inline px-3">${session_name}님 환영합니다.</p>
						<a class="dropdown-toggle" data-toggle="dropdown"></a>
						<div class="dropdown-menu" id="dropdown">
							<input class="btn btn-light btn-sm dropdown-item" type="button" value="마이페이지" onclick="location.href='mypage.do'">
							<input class="btn btn-light btn-sm dropdown-item" type="button" value="로그아웃" onclick="location.href='logout.do'">
						</div>
            		</div>
				</c:when>
				<c:otherwise>
					<c:if test="${faildLogin eq 'fail'}">
 						존재하지 않거나 잘못된 아이디 또는 비밀번호를 입력하셨습니다.
  					</c:if>
					<form id="form_login" action="login.do" method="post" class="font-white-package">
						<label for="login_id" class="form-control-text">id&nbsp;</label><input type="text" id="login_id" name="login_id" class="btn btn-outline-light btn-sm button-none-hover" style="width:150px;">&nbsp;&nbsp;
						<label for="login_pw"class="form-control-text">pw&nbsp;</label><input type="password" id="login_pw" name="login_pw" class="btn btn-outline-light btn-sm button-none-hover" style="width:150px;">
						<input type="button" id="btn_signin" value="SignIn" class="btn btn-light btn-sm">
						<input type="button" onclick="location.href='signup.do'" value="SignUp" class="btn btn-light btn-sm">
					</form>
				</c:otherwise>
			</c:choose>
		</div>
	
	
	
		<!-- banner -->
		<div class="container-fluid p-0">
			<a href="index.do"><img src="img/banner.png" class="img-fluid"></a>
		</div>
		
		
		
		<div class="row container-fluid p-0">
			<!-- navbar -->
			<div class="col-2">
				<div class="container-fluid text-center p-0 pt-1 mt-2 ml-4">
					<!-- search bar -->
					<div class="d-flex justify-content-center mb-2">
						<form class="" action="sBoardList.do">
							<div class="input-group">
								<input class="form-control" type="text" placeholder="Search" id="search_entry" name="search_entry">
								<div class="input-group-append">
									<button class="btn btn-outline-dark" type="submit">Search</button>  
								</div>
							</div>
						</form>
					</div>
					
					<!-- menu bar -->
					<div>
						<ul class="nav navbar-nav">
							<a href="fBoardList.do?boardNo=1"><li class="text-center border border-white font-white-package py-2" style="background-color: #24292e; border-radius: 15px 15px 0px 0px;">자유게시판</li></a>
							<c:forEach var="dto_boardType" items="${dtos_boardType}">
								<a href="iBoardList.do?boardNo=${dto_boardType.boardNo}"><li class="text-center border border-white font-white-package py-2" style="background-color: #24292e;">${dto_boardType.boardName}</li></a>
							</c:forEach>
							<a href="boardList.do?boardNo=0"><li class="text-center border border-white font-white-package py-2" style="background-color: #24292e; border-radius: 0px 0px 15px 15px;">게시판 요청</li></a>
							<c:if test="${session_rank eq 1}">
								<a id="btn_addBoardType" href=""><li class="text-center border border-white py-2 my-1" style="background-color: #24292e; color:#007bff; border-radius: 15px;">+</li></a>
								
								<!-- 회원가입 확인 Modal-->
								<div class="modal fade" id="modalAddBoardType" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
									<div class="modal-dialog" role="document">
										<div class="modal-content">
											<div class="modal-header">
												<h5 class="modal-title" id="exampleModalLabel">Add Board Type</h5>
												<button class="close" type="button" data-dismiss="modal" aria-label="Close">
												<span aria-hidden="true">X</span>
												</button>
											</div>
											
											<div class="modal-body">
												<div class="form py-5 px-1">
													<!-- Success Alert -->
													<div id="alert_success" class="alert alert-success" style="display:none;">
													<a onclick="alertClose('alert_success');" href="#" class="close" aria-label="close">×</a>
														<strong>Success!</strong> Added BoardType
													</div>
													
													<div class="input-group">
														<input onclick="alertClose('alert_success');" type="text" id="input_addBoardType" class="form-control" placeholder="Name">
														<div class="input-group-append">
															<button id="btn_addBoardTypeOnModal" class="btn btn-dark">Add</button>  
														</div>
													</div>
												</div>
											</div>
											<div class="modal-footer">
												<button class="btn" type="button" onclick="alertClose('alert_success');" data-dismiss="modal">Close</button>
											</div>
										</div>
									</div>
								</div>
							</c:if>
						</ul>
					</div>
				</div>
			</div>
			
			
			
			<!-- center -->
			<div class="col-10">
				<div class="container-fluid border-left border-right">
					<div class="container-fluid">
						<div class="m-5">
							<hr>
							<h2 class="text-dark">게시글 수정하기</h2>
							<hr>
							<form action="boardUpdate.do?boardNo=${param.boardNo}&no=${dto_board.no}" method="post" id="boardUpdateForm">
								<input type="hidden" id="write_no" name="write_no" value='${dto_board.no}'>
							<!-- CKEditor 이미지 기능 사용하려면 저런식으로 하라던데.... 맞는지는 모름 ㅋ -->
							<!-- <form action="boardInsert.do?boardNo=${param.boardNo}" method="get" enctype="multipart/form-data" id="boardInsertForm"> -->
								<div class="row justify-content-md-center">
									<div class="col-sm-3">
										<div class="input-group">
											<div class="input-group-prepend">
												<label class="input-group-text">Board</label>
											</div>
											<select class="custom-select" id="write_boardType" name="write_boardType">
												<c:choose>
													<c:when test="${param.boardNo eq '1'}">
														<option value="1" selected>자유게시판</option>
													</c:when>
													<c:otherwise>
														<c:forEach var="dto_boardType" items="${dtos_boardType}">
															<c:choose>
																<c:when test="${dto_boardType.boardNo eq param.boardNo}">
																	<option value="${dto_boardType.boardNo}" selected>${dto_boardType.boardName}</option>
																</c:when>
																<c:otherwise>
																</c:otherwise>
															</c:choose>
														</c:forEach>
													</c:otherwise>
												</c:choose>
											</select>
										</div>
									</div>
									<div class="col-sm-9">
										<div class="input-group">
											<div class="input-group-prepend">
												<label for="title" class="input-group-text">Title</label>
											</div>
											<input type="text" class="form-control" id="write_title" name="write_title" value="${dto_board.title}" required>
										</div>
									</div>
								</div>
						
								<hr>
						
								<div>
									<div class="col_c" style="margin-bottom: 30px">
										<div class="input-group">
											<textarea class="form-control" id="ckeditor4" name="ckeditor4" required></textarea>
											<input type="hidden" id="content" name="content" value='${dto_board.content}'>
										</div>
									</div>
								</div>
						
								<div class="row justify-content-md-center">
									<input type="button" class="btn btn-dark p-2 px-5" id="write_btnSubmit" value="글수정">&nbsp;
									<c:choose>
										<c:when test="${param.boardNo eq '1'}">
											<button type="button" class="btn btn-outline-dark p-2 px-5" onclick="location.href='fBoardList.do?boardNo=1'">&nbsp;목 록&nbsp;</button>
										</c:when>
										<c:otherwise>
											<button type="button" class="btn btn-outline-dark p-2 px-5" onclick="location.href='iBoardList.do?boardNo=${param.boardNo}'">&nbsp;목 록&nbsp;</button>
										</c:otherwise>
									</c:choose>
								</div>
							</form>
						</div>
					</div>
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