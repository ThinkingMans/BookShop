<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<div class="fragment">
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="resources/css/user_qna_selectproduct.css" rel="stylesheet">
<script src="resources/js/jquery-3.6.0.js"></script>
<script type="text/javascript">

let pd_num = 0;
let pd_subject = "";

function pageMove(page){
	let searchObject = $(".searchObject2").val()
		$.ajax({
			type:"get",
			url:"UserQnaSelectProduct.us",
			data:{"qnaPageNum":page,
					   "productObject":searchObject},
			dataType:"text"
		}).done(function(fragment){
			$(".fragment").replaceWith(fragment)
		}).fail(function(){
			
		})
	
}

function select(num,subject) {
	
	pd_num = num;
	pd_subject = subject;
	
	$(".selected").html(
			"선택한 상품 <input type='text' id='child_select' value='"+ subject +"'>"+
			"<input type='button' value='선택' class='select_end' onclick='useProduct()'>"+
			"<input type='hidden' id='child_select' value='"+ num +"'>"
	)
	
}


function useProduct(){
	
	window.opener.document.fr.pd_subject.value=pd_subject;
	window.opener.document.fr.pd_num.value=pd_num;
	
	window.close();
}



function search(){
	
		let searchObject = $(".searchObject").val()
		$.ajax({
			type:"get",
			url:"UserQnaSelectProduct.us",
			data:{"productObject":searchObject},
			dataType:"text"
		}).done(function(fragment){
			$(".fragment").replaceWith(fragment)
		}).fail(function(){
			alert("실패 ㅜ");
		})


}


</script>
</head>
<body>
	<div class="pd_list">
	<h1>상품을 선택하세요.</h1>
			<div class="pd_search">
				<input type="text" placeholder="검색할 상품명을 입력하세요." class="searchObject"> <input type="button" class="button" value="찾기" onclick="search()"><p class="selected"></p>
			</div>
	<div class="pd_list">
		<c:forEach var="pd" items="${productList }">
				<div class="pd_set">
					<div class="pd_file"><img src="resources/upload/${pd.pd_file }" onclick="select('${pd.pd_num}','${pd.pd_subject }')"></div>
					<div class="pd_subject">${pd.pd_subject }</div>
				</div>
		</c:forEach>
	</div>
</div>

    <div class="page" >
		<c:choose>
			<c:when test="${qnaPageInfo.pageNum > 1}">
				<input type="button" class="num" id="pageButton"value="이전" onclick="pageMove('${qnaPageInfo.pageNum - 1}')">
			</c:when>
			<c:otherwise>
				<input type="button" class="num noClick" id="pageButton"value="이전">
			</c:otherwise>
		</c:choose>	
			
		<c:forEach var="i" begin="${qnaPageInfo.startPage }" end="${qnaPageInfo.endPage }">
			<c:choose>
				<c:when test="${qnaPageInfo.pageNum eq i}">
					<strong class="num noClick">${i }</strong>
				</c:when>
				<c:otherwise>
					<a class="num" href="javascript:void(0)" onclick="pageMove(${i})">${i }</a>
				</c:otherwise>
			</c:choose>
		</c:forEach>

		<c:choose>
			<c:when test="${qnaPageInfo.pageNum < qnaPageInfo.maxPage}">
				<input type="button" class="num noClick" value="다음"   id="pageButton" onclick="pageMove('${qnaPageInfo.pageNum + 1}')">
			</c:when>
			<c:otherwise>
				<input type="button" class="num" id="pageButton" value="다음">
			</c:otherwise>
		</c:choose>
	</div>
		<input type="hidden" class="searchObject2"  value="${productObject2 }">
	</div>
</body>
</html>