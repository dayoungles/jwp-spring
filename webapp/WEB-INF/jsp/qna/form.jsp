<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%><%@ include file="/include/tags.jspf"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/include/header.jspf"%>
</head>
<body>
	<%@ include file="/include/top.jspf"%>

	<div id="main">
		<form:form modelAttribute="question" action="/questions" method="post">
			<c:choose>
				<c:when test="${empty question}">
					<table>
				<tr>
					<td width="150">글쓴이</td>
					<td>
						<form:input path="writer" size="40"/>
						<form:errors path="writer" cssClass="error" />
					</td>
				</tr>			
				<tr>
					<td width="150">제목</td>
					<td>
						<form:input path="title" size="70" value=""/>
						<form:errors path="title" cssClass="error" />					
					</td>
				</tr>
				<tr>
					<td width="150">내용</td>
					<td>
						<form:textarea path="contents" rows="5" cols="130"/>
						<form:errors path="contents" cssClass="error" /></td>
				</tr>
			</table></c:when>
				<c:otherwise>
					<table>
						<tr>
							<td width="150">글쓴이</td>
							<td><form:input path="writer" size="40" /> <form:errors
									path="writer" cssClass="error" /></td>
						</tr>
						<tr>
							<td width="150">제목</td>
							<td><form:input path="title" size="70"
									value="${question.title}" /> <form:errors path="title"
									cssClass="error" /></td>
						</tr>
						<tr>
							<td width="150">내용</td>
							<td><form:textarea path="contents" rows="5" cols="130" value="${question.contents }"/> <form:errors
									path="contents" cssClass="error" /></td>
						</tr>
					</table>
				</c:otherwise>
			</c:choose>
			<input type="submit" value="질문하기" />
		</form:form>
	</div>
</body>
</html>