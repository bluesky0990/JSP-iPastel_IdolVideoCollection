<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
</head>
<body>
	<c:forEach items="${list }" var="v">
		<table>
			<tr>
				<td>
				<jsp:useBean id="today" class="java.util.Date"></jsp:useBean>
					<fmt:parseNumber value="${today.time / (1000 * 60 * 60 * 24)}" var="nowDays" integerOnly="true" />
					<fmt:parseNumber value="${v.reg_date.time / (1000 * 60 * 60 * 24)}" var="regDays" integerOnly="true" />
					<c:set value="${nowDays - regDays }" var="dayDiff" />
					<c:choose>
						<c:when test="${dayDiff == 0 }">
							<fmt:formatDate value="${v.reg_date }" pattern="HH:mm:ss"/>
						</c:when>
						<c:otherwise>
							<fmt:formatDate value="${v.reg_date }" pattern="yyyy.MM.dd"/>
				  		</c:otherwise>
					</c:choose>
				</td>
			</tr>
		</table>
	</c:forEach>
	<jsp:useBean id="today" class="java.util.Date"></jsp:useBean>
	<fmt:parseNumber value="${today.time / (1000 * 60 * 60 * 24)}" var="nowDays" integerOnly="true" /> <fmt:parseNumber value="${v.reg_date.time / (1000 * 60 * 60 * 24)}" var="regDays" integerOnly="true" />
	<c:set value="${nowDays - regDays }" var="dayDiff" />
	<c:choose>
		<c:when test="${dayDiff == 0 }">
			<fmt:formatDate value="${v.reg_date }" pattern="HH:mm:ss"/>
		</c:when>
		<c:otherwise> 
			<fmt:formatDate value="${v.reg_date }" pattern="yyyy.MM.dd"/>
		</c:otherwise>
	</c:choose>
</body>
</html>