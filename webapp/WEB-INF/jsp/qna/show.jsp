<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%><%@ include file="/include/tags.jspf"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/include/header.jspf"%>
</head>
<body>
    <%@ include file="/include/top.jspf"%>
     
    <div id="main">
	<div class="post">
	    <h2 class="post-title">
	        <a href="">${question.title}</a>
	    </h2>
	    <div class="post-metadata">
	        <span class="post-author">${question.writer}</span>,
	        <span class="post-date"><fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${question.createdDate}" /></span>
	    </div>
	    <div class="post-content">
	        <div class="about">내용 : </div>
	        ${nf:hbr(question.contents)}
	    </div>
	</div>    

	<div class="buttons">
		<a href="/questions/${question.questionId}/form">수정</a>&nbsp;<a href="/questions/${question.questionId}/delete">삭제</a>&nbsp;<a href="/questions">목록으로</a>
		<%-- <button id="delete" url="/questions/${question.questionId}/delete">삭제 </button> --%>
	</div>

	<h3>답변</h3>
	<div class="answerWrite">
		<form method="post">
		<input type="hidden" name="questionId" value="${question.questionId}">
	    <p>
	        <label for="author">이름: </label>
	        <input type="text" name="writer" id="writer" />
	    </p>
	    <p>
	        <label for="content">내용 : </label>
	        <textarea name="content" id="content"></textarea>
	    </p>
	    <p>
	        <input type="submit" value="저장" />
	    </p>
	    </form>
    </div>
    
    <!-- comments start -->
	<div class="comments" id="comments">
	    <h3 id="numAnswers">댓글 수 : ${question.countOfComment}</h3>
    	<c:forEach items="${question.answers}" var="each">
        <div class="comment id_${question.questionId}_${each.answerId}">
            <div class="comment-metadata">
                <span class="comment-author">by ${each.writer},</span>
                <span class="comment-date">
                   	<fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${each.createdDate}" />
                </span>
            </div>
            <div class="comment-content">
                <div class="about">내용 : </div>
                ${nf:hbr(each.contents)}
            </div>
            <div class="btn-delete">
            	<a href="#" data-ids="${question.questionId}_${each.answerId}">삭제</a>
            </div>
        </div>		    	
    	</c:forEach>    
	</div>
	<!-- comments end -->
	
    </div>
    <%@ include file="/include/footer.jspf"%>
</body>
</html>