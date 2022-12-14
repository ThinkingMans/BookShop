<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link href="resources/css/user_qna_detail.css" rel="stylesheet">
<link href="resources/css/sidebar.css" rel="stylesheet">
<link href="resources/css/header.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="resources/js/jquery-3.6.0.js"></script>
<script type="text/javascript">
$(function(){
	if("${qna.qna_accesspermission}" == "private"){
		if("${sessionScope.sId}" != "${qna.qna_user_email}"){
			alert("비공개 qna는 본인만 볼수 있습니다");
			history.go(-1);
		}
	}
})
</script>
</head>
<body>
<jsp:include page="/WEB-INF/views/inc/sidebar.jsp"/>
<jsp:include page="/WEB-INF/views/inc/header.jsp"/>
	<div class="wrapper">
		<div class="name_subject">${qna.qna_user } 님의 작성 문의입니다.</div>
		<div class="main_subject">
			<div class="subject">제목 : ${qna.qna_subject }</div>
			<div class="subject">날짜 : ${qna.qna_date }</div>
			
		</div>
					<div class="content">
					<div class="qna_content_subject">문의 내용</div>
						<div class="qna_content">
							${qna.qna_content }
						</div>
					</div>
					
				<c:choose>
					<c:when test="${not empty qna.qna_rep }">
							<div class="qna_content_subject">답변</div>
							<div class="qna_content">
							${qna.qna_rep }
							</div>
					</c:when>
					<c:otherwise>
						<div class="qna_content_subject">답변</div>
							<div class="qna_content">
							답변  대기중 입니다.....
							</div>
					</c:otherwise>
				</c:choose>	
				<div id="buttons">
					<input type="button" value="뒤로가기" id="button" onclick="history.go(-1)">
					<input type="button" value="문의하기" id="button" onclick="location.href='QnaWrite.us'">
				</div>
	</div>
	<jsp:include page="/WEB-INF/views/inc/footer.jsp"/>
</body>
</html>








