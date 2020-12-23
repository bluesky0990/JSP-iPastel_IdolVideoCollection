<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<title>iPastel :: Idol</title>
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
		
		.boardTitle {
			color: #24292e;
			font-size:1.2em;
			display: inline-block;
			text-overflow: ellipsis;
			white-space: nowrap;
			overflow: hidden;
			width:245px;
		}
		.boardTitle:link {
			color: #24292e;
			font-size:1.2em;
		}
		.boardTitle:hover {
			color: #000;
			font-size:1.2em;
		}
		.boardTitle:visited {
			color: #24292e;
			font-size:1.2em;
		}
		.boardTitle:active {
			color: #000;
			font-size:1.2em;
		}
		
		.boardTitleAnother {
			color: gray;
			font-size:0.8em;
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
		});
		function alertClose(id) {
			$("#" + id).hide();
		}
		function PageMove(page){
			location.href = "iBoardList.do?boardNo=3&page="+page;
		}
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
							<c:choose>
								<c:when test="${dto_boardType.boardNo eq param.boardNo}">
									<a href="fBoardList.do?boardNo=1"><li class="text-center border border-white font-white-package py-2" style="background-color: #2B3B3A; border-radius: 15px 15px 0px 0px;">자유게시판</li></a>
								</c:when>
								<c:otherwise>
									<a href="fBoardList.do?boardNo=1"><li class="text-center border border-white font-white-package py-2" style="background-color: #24292e; border-radius: 15px 15px 0px 0px;">자유게시판</li></a>
								</c:otherwise>
							</c:choose>
							<c:forEach var="dto_boardType" items="${dtos_boardType}">
								<c:choose>
									<c:when test="${dto_boardType.boardNo eq param.boardNo}">
										<a href="iBoardList.do?boardNo=${dto_boardType.boardNo}"><li class="text-center border border-white font-white-package py-2" style="background-color: #2B3B3A;">${dto_boardType.boardName}</li></a>
									</c:when>
									<c:otherwise>
										<a href="iBoardList.do?boardNo=${dto_boardType.boardNo}"><li class="text-center border border-white font-white-package py-2" style="background-color: #24292e;">${dto_boardType.boardName}</li></a>
									</c:otherwise>
								</c:choose>
							</c:forEach>
							<c:choose>
								<c:when test="${dto_boardType.boardNo eq param.boardNo}">
									<a href="rBoard.do?boardNo=0&no=380"><li class="text-center border border-white font-white-package py-2" style="background-color: #2B3B3A; border-radius: 0px 0px 15px 15px;">게시판 요청</li></a>
								</c:when>
								<c:otherwise>
									<a href="rBoard.do?boardNo=0&no=380"><li class="text-center border border-white font-white-package py-2" style="background-color: #24292e; border-radius: 0px 0px 15px 15px;">게시판 요청</li></a>
								</c:otherwise>
							</c:choose>
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
				<div class="container-fluid border-right">
					<div class="m-5">
						<!-- 320x180 p1 m2, 12개, 최신순 -->
						<div class="container-fluid">
							<c:forEach var="dto_board" items="${dtos_board}">
								<div class="d-inline-block m-2">
									<a href="boardView.do?boardNo=${dto_board.boardNo}&no=${dto_board.no}"><img class="rounded" src="http://i.ytimg.com/vi/${dto_board.youtubeCode}/mqdefault.jpg" width="320" height="180"></a>
									<div class="row">
										<div class="col-2">
											<div class="pt-2"><img class="rounded-circle" src="img/userProfile/${dto_board.profile_img}" width="40" height="40"></div>
										</div>
										<div class="col-10">
											<div class="pt-2">
												<div class="d-flex justify-content-start">
													<div><a class="boardTitle" href="boardView.do?boardNo=${dto_board.boardNo}&no=${dto_board.no}">${dto_board.title}</a></div>
												</div>
												
												<div class="d-flex justify-content-start">
													<div class="boardTitleAnother">${dto_board.writer}</div>
												</div>
												
												<div class="d-flex justify-content-start">
													<div class="boardTitleAnother">
														<fmt:formatDate var="formatDateRegdate" value="${dto_board.regdate}" pattern="MM-dd"/>
														조회수 ${dto_board.hits}회 • ${formatDateRegdate}
													</div>
												</div>
											</div>
										</div>
										
									</div>
								</div>
							</c:forEach>
						</div>
					</div>
					<!-- Board Bottom (페이징 및 버튼) -->
					<div class="container-fluid px-4 pb-5">
						<div class="d-flex justify-content-between">
							<!-- space -->
							<div></div>
							
							<!-- 페이징 -->
							<!-- 페이징 1트
							<div>
								<ul class="pagination">
									<li class="btn btn-outline-dark rounded-0"><a href="javascript:void(0);">PREV</a></li>
									<li class="btn btn-dark rounded-0"><a href="javascript:void(0);">1</a></li>
									<li class="btn btn-outline-dark rounded-0"><a href="javascript:void(0);">2</a></li>
									<li class="btn btn-outline-dark rounded-0"><a href="javascript:void(0);">3</a></li>
									<li class="btn btn-outline-dark rounded-0"><a href="javascript:void(0);">4</a></li>
									<li class="btn btn-outline-dark rounded-0"><a href="javascript:void(0);">5</a></li>
									<li class="btn btn-outline-dark rounded-0"><a href="javascript:void(0);">NEXT</a></li>
									
									<c:if test="${currentPageNum > 5}">
										<li class="btn btn-outline-dark rounded-0"><a href="iBoardList.do?boardNo=${param.boardNo}&page=${blockStartNum - 1}">PREV</a></li>
									</c:if>
									<c:forEach var="i" begin="${blockStartNum}" end="${blockLastNum}">
										<c:choose>
											<c:when test="${i > lastPageNum}">
												<li class="btn btn-outline-dark rounded-0">${i}</li>
											</c:when>
											<c:when test="${i eq currentPageNum}">
												<li class="btn btn-dark rounded-0">${i}</li>
											</c:when>
											<c:otherwise>
												<li class="btn btn-outline-dark rounded-0"><a href="iBoardList.do?boardNo=${param.boardNo}&page=${i}">${i}</a></li>
											</c:otherwise>
										</c:choose>
									</c:forEach>
									
									<c:if test="${currentPageNum > 5}">
										<li class="btn btn-outline-dark rounded-0"><a href="iBoardList.do?boardNo=${param.boardNo}&page=${blockLastNum + 1}">NEXT</a></li>
									</c:if>
								</ul>
							</div>
							 -->
							 
							 <!-- 페이징 2트
							<div class="toolbar-bottom">
							  <div class="toolbar mt-lg">
							    <div class="sorter">
							      <ul class="pagination">
							        <li><a href="javascript:PageMove(${paging.firstPageNo})">맨앞으로</a></li>
							        <li><a href="javascript:PageMove(${paging.prevPageNo})">앞으로</a></li>
							              <c:forEach var="i" begin="${paging.startPageNo}" end="${paging.endPageNo}" step="1">
							                  <c:choose>
							                      <c:when test="${i eq paging.pageNo}">
							      			          <li class="active"><a href="javascript:PageMove(${i})">${i}</a></li>
							                      </c:when>
							                      <c:otherwise>
													<li><a href="javascript:PageMove(${i})">${i}</a></li>
							                      </c:otherwise>
							                  </c:choose>
							              </c:forEach>
							        <li><a href="javascript:PageMove(${paging.nextPageNo})">뒤로</a></li>
							        <li><a href="javascript:PageMove(${paging.finalPageNo})">맨뒤로</a></li>
							      </ul>
							    </div>
							  </div>
							</div>
							 -->

							
							<!-- 버튼 -->
							<div>
								<c:choose>
									<c:when test="${state eq 'login'}">
										<button onclick="location.href='boardWriteForm.do?boardNo=${param.boardNo}'" class="btn btn-dark">글작성</button>&nbsp;
									</c:when>
									<c:otherwise>
									</c:otherwise>
								</c:choose>
							</div>
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