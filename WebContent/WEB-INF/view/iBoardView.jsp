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
		
		.boardTitle {
			color: #24292e;
			font-size:1.2em;
			display: inline-block;
			text-overflow: ellipsis;
			white-space: nowrap;
			overflow: hidden;
			width:260px;
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
		.boardReply {
			color: #24292e;
			text-decoration: none;
		}
		.boardReply:link {
			color: #24292e;
			text-decoration: none;
		}
		.boardReply:hover {
			color: gray;
			text-decoration: underline;
		}
		.boardReply:visited {
			color: #24292e;
			text-decoration: none;
		}
		.boardReply:active {
			color: gray;
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
			
			$("#comment_btnSubmit").click(function () {
				var no = encodeURIComponent($("#hidden_boardNo").val());
				var content = $("#comment_content").val();
				if(content !== "") {
					$.ajax({
						url:'insertReply.on',
						type:'post',
						data: {"no":no, "content":content},
						async:true,
						success:function() {
							$("#comment_content").val("");
							reloadRpley();
						},
						error:function() {
							alert("페이지 오류 발생, 페이지를 다시 불러와주시길 바랍니다.");
						}
					});
				}
			});
			
			$("#comment_btnEditCancel").click(function() {
				$("#comment_btnEditRemove").html('<div id="comment_btnEdit" class="boardReply">수정</div>/<div id="comment_btnRemove" class="boardReply">삭제</div>');
			});
		});
		function alertClose(id) {
			$("#" + id).hide();
		}
		
		function reloadRpley() {
			var replyBoardNo = encodeURIComponent($("#hidden_boardNo").val());
			$.ajax({
				url:'reloadReply.on',
				type:'post',
				data: {"replyBoardNo": replyBoardNo},
				async:true,
				dataType:'json',
				contentType: "application/x-www-form-urlencoded; charset=UTF-8",
				success:function(data) {
					var comment_frame = "";
					
					for(var i in data){								
						comment_frame += '<div class="row p-2">';
						comment_frame += '<div class="col-1">';
						comment_frame += '<div class="pl-2 py-2">';
						comment_frame += '<img src="img/userProfile/' + data[i].profile_img + '" class="rounded-circle" width="40" height="40">';
						comment_frame += '</div>';
						comment_frame += '</div>';
						comment_frame += '<div class="col-11">';
						comment_frame += '<div class="d-flex justify-content-between">';
						comment_frame += '<div class="p-2">' + data[i].writer + '</div>';
						comment_frame += '<div class="p-2">';
						if(data[i].writer === "${session_id}") {
							comment_frame += '<div id="comment_btnEditRemove' + data[i].no + '" class="d-inline">';
							comment_frame += '<div onclick="comment_btnEdit(' + data[i].no + ')" class="boardReply d-inline">수정</div>/<div onclick="comment_btnRemove(' + data[i].no + ')" class="boardReply d-inline">삭제</div>';
							comment_frame += '</div>';
						}
						//<fmt:formatDate var="formatDateReplyRegdate" value="${dto_reply.regdate}" pattern="MM-dd HH:mm"/>${formatDateReplyRegdate}
						// 날짜 포맷은 AJAX 컨트롤러에서 미리 변환
						comment_frame += " " + data[i].regdate;
						comment_frame += '</div>';
						comment_frame += '</div>';
						comment_frame += '<input type="hidden" id="comment_hiddenContent' + data[i].no + '" name="comment_hiddenContent' + data[i].no + '" value="' + data[i].content + '">';
						comment_frame += '<div id="comment_content' + data[i].no + '" class="border rounded bg-white p-4">' + data[i].content + '</div>';
						comment_frame += '</div>';
						comment_frame += '</div>';
						
					}
					$('#comment_All').html(comment_frame);
					
					$.ajax({
						url:'countReply.on',
						type:'post',
						data: {"replyBoardNo": replyBoardNo},
						async:true,
						success:function(count) {
							$("#comment_Count").html('Comments('+count+')');
						},
						error:function() {
							alert("페이지 오류 발생, 페이지를 다시 불러와주시길 바랍니다.");
						}
					});
				},
				error:function() {
					alert("페이지 오류 발생, 페이지를 다시 불러와주시길 바랍니다.");
				}
			});
		}
		function comment_btnEdit(replyNo) {
			var old_content = $("#comment_hiddenContent" + replyNo).val();
			$("#comment_btnEditRemove" + replyNo).html('<div onclick="comment_btnEditCancel(' + replyNo + ')" class="boardReply d-inline">취소</div>/<div onclick="comment_btnRemove(' + replyNo + ')" class="boardReply d-inline">삭제</div>');
			
			var comment_content = '';
			comment_content += '<form id="comment_ModifyForm'+ replyNo +'" method="post">';
			comment_content += '<div class="d-flex justify-content-center">';
			comment_content += '<textarea class="form-control" placeholder="Comment" style="height:120px;" id="comment_contentModify' + replyNo + '" name="comment_contentModify' + replyNo + '">' + old_content + '</textarea>';
			comment_content += '</div>';
			comment_content += '<div class="d-flex justify-content-center">';
			comment_content += '<input onclick="comment_btnUpdate(' + replyNo + ')" class="form-control btn btn-dark" type="button" value="Modify" id="comment_btnModify' + replyNo + '" name="comment_btnModify' + replyNo + '">';
			comment_content += '</div>';
			comment_content += '</form>';
			$("#comment_content" + replyNo).html(comment_content);
		}
		
		function comment_btnEditCancel(replyNo) {
			var old_content = $("#comment_hiddenContent" + replyNo).val();
			$("#comment_btnEditRemove" + replyNo).html('<div onclick="comment_btnEdit(' + replyNo + ')" class="boardReply d-inline">수정</div>/<div onclick="comment_btnRemove(' + replyNo + ')" class="boardReply d-inline">삭제</div>');
			
			var comment_content = '';
			comment_content += old_content;
			$("#comment_content" + replyNo).html(comment_content);
		}
		
		function comment_btnRemove(replyNo) {
			var no = encodeURIComponent(replyNo);
			$.ajax({
				url:'removeReply.on',
				type:'post',
				data: {"replyNo": no},
				async:true,
				success:function() {
					reloadRpley();
				},
				error:function() {
					alert("페이지 오류 발생, 페이지를 다시 불러와주시길 바랍니다.");
				}
			});
		}
		
		function comment_btnUpdate(replyNo) {
			var no = encodeURIComponent(replyNo);
			var content = $("#comment_contentModify" + replyNo).val();
			$.ajax({
				url:'updateReply.on',
				type:'post',
				data: {"replyNo": no, "replyContent": content},
				async:true,
				success:function() {
					reloadRpley();
				},
				error:function() {
					alert("페이지 오류 발생, 페이지를 다시 불러와주시길 바랍니다.");
				}
			});
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
								<c:when test="${'1' eq param.boardNo}">
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
								<c:when test="${'0' eq param.boardNo}">
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
					<div class="container-fluid">
						<div class="m-5">
							<div class="border">
								<!-- View -->
								<div class="container">
									<div class="d-flex justify-content-between pt-1">
										<div class="p-2"><img src="img/userProfile/${dto_board.profile_img}" class="rounded-circle" width="40" height="40">&nbsp;&nbsp;${dto_board.writer}</div>
										<div class="p-2">
											<img src="img/eye.svg" width="30" height="30"> ${dto_board.hits}
											•
											<img src="img/clock.svg" width="20" height="20">
											<fmt:formatDate var="formatDateBoardRegdate" value="${dto_board.regdate}" pattern="MM-dd"/>${formatDateBoardRegdate}
										</div>
									</div>
									<div class="p-2"><h2>${dto_board.title}</h2></div>
									<hr>
									<div class="p-2">${dto_board.content}</div>
									<hr>
									<div class="d-flex justify-content-end p-3 pt-2 pb-4">
										<c:if test="${dto_board.writer eq session_id}">
											<input value="글수정" onclick="location.href='boardUpdateForm.do?boardNo=${param.boardNo}&no=${param.no}'" class="btn btn-outline-dark" type="button">&nbsp;
											<input value="글삭제" onclick="location.href='boardDelete.do?boardNo=${param.boardNo}&no=${param.no}'" class="btn btn-outline-dark" type="button">&nbsp;
										</c:if>
										<input value="목록" onclick="location.href='iBoardList.do?boardNo=${param.boardNo}'" class="btn btn-outline-dark" type="button">
									</div>
								</div>
								
								
							</div>
							
							<div class="border" style="background-color:#fbfbfb;">
								<!-- Comment -->
								<div id="comment" class="container">
									<input type="hidden" id="hidden_boardNo" name="hidden_boardNo" value="${dto_board.no}">
									<h4 id="comment_Count" class="p-2 py-4">Comments(${dto_countReply.countReply})</h4>
									<hr>
									<div class="container-fluid pb-3">
										<form id="comment_Form" method="post">
										  	<div class="d-flex justify-content-start">
										    	<div class="p-2"><img src="img/userProfile/${session_profileImg}" class="rounded-circle" width="40" height="40"></div>
										    	<div class="p-2 pt-3">${session_id}</div>
										    </div>
										  	<div class="d-flex justify-content-center">
										    	<textarea class="form-control" placeholder="Comment" style="height:120px;" id="comment_content" name="comment_content"></textarea>
										    </div>
										  	<div class="d-flex justify-content-center">
										  	  <input class="form-control btn btn-dark" type="button" value="Submit" id="comment_btnSubmit" name="comment_btnSubmit">
										    </div>
									    </form>
									</div>								
									<div id="comment_All" class="pb-5">
										<c:forEach var="dto_reply" items="${dtos_reply}">
											<div class="row p-2">
												<div class="col-1">
													<div class="pl-2 py-2">
														<img src="img/userProfile/${dto_reply.profile_img}" class="rounded-circle" width="40" height="40">
													</div>
												</div>
												<div class="col-11">
													<div class="d-flex justify-content-between">
														<div class="p-2">${dto_reply.writer}</div>
														<div class="p-2">
															<c:choose>
																<c:when test="${dto_reply.writer eq session_id}">
																	<div id="comment_btnEditRemove${dto_reply.no}" class="d-inline">
																		<div onclick="comment_btnEdit(${dto_reply.no})" class="boardReply d-inline">수정</div>/<div onclick="comment_btnRemove(${dto_reply.no})" class="boardReply d-inline">삭제</div>
																	</div>
																</c:when>
																<c:otherwise>
																	
																</c:otherwise>
															</c:choose>
															<fmt:formatDate var="formatDateReplyRegdate" value="${dto_reply.regdate}" pattern="MM-dd HH:mm"/>${formatDateReplyRegdate}
														</div>
													</div>
													<input type="hidden" id="comment_hiddenContent${dto_reply.no}" name="comment_hiddenContent${dto_reply.no}" value="${dto_reply.content}">
													<div id="comment_content${dto_reply.no}" class="border rounded bg-white p-4">${dto_reply.content}</div>
												</div>
											</div>
										</c:forEach>
									</div>
								</div>
							</div>
						</div>
					</div>
					
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
														조회수 ${dto_board.hits}회 •<fmt:formatDate var="formatDateBoardRegdate" value="${dto_board.regdate}" pattern="MM-dd"/> ${formatDateBoardRegdate}
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
							<div></div>
							
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