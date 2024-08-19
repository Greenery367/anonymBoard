<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판</title>
</head>
<style>
body {
	margin: 0;
	padding: 0;
}

tr td {
	margin-top: 5px;
	margin-bottom: 5px;
	border-bottom: 1px solid #444444;
}

table {
	border-bottom: 1px solid #444444;
	border-top: 1px solid #444444;
	border-collapse: collapse;
}

.header {
	display: flex;
	text-align: center;
	align-items: center;
	padding: 20px;
	background: #343a40;
}

.title {
	color: white;
	padding: 10px;
	text-decoration: none;
}

.sub-title {
	color: #868e96;
	dont-size: 2em;
	text-decoration: none;
	padding: 20px;
	margin-top: 50px;
}

.main-board {
	display: flex;
	justify-content: center;
	margin: 40px;
	padding: 40px;
	margin-bottom: 50px;
}

.board-table {
	width: 900px;
	height: 450px;
}

.update {
	width: 70px;
	padding: 15px;
	border-radius: 5px;
	background-color: #FFB700;
	text-decoration: none;
	color: black;
	border: none;
}

.delete {
	width: 70px;
	padding: 15px;
	border-radius: 5px;
	background-color: #d32f2f;
	text-decoration: none;
	color: white;
	border: none;
}

.gray {
	background: lightgray;
}

.paging {
	height: 100px;
	display: flex;
	justify-content: center;
	align-items: center;
}

.page {
	border: 1px solid gray;
	padding: 10px;
	margin: 10px;
	text-decoration: none;
	border-radius: 7px;
}

.current-page {
	background: blue;
	color: white;
}

.stop {
	pointer-events: none;
}

.footer {
	display: flex;
	justify-content: center;
	padding: 20px;
	background: #343a40;
	color: white;
}
</style>
<body>
	<div class="main">
		<div class="header">
			<h1>
				<a href="" class="title">Metacoding</a>
			</h1>
			<h3>
				<a href="../write-board" class="sub-title">글쓰기</a>
			</h3>
		</div>
		<div class="main-board">
			<table class="board-table">
				<thead>
					<tr>
						<th><h2>번호</h2></th>
						<th><h2>제목</h2></th>
						<th><h2>내용</h2></th>
						<th><h2>작성자</h2></th>
						<th></th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${listForPagination}" var="board">
						<tr>
							<td>${board.id}</td>
							<td>${board.title}</td>
							<td>${board.content}</td>
							<td>${board.author}</td>
							<td><a class="update"
								href="../check-author/${board.id}?type=update">수정
									</button></td>
							<td><a class="delete"
								href="../check-author/${board.id}?type=delete">삭제
									</button></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		<div class="paging">

			<a class="page disable <c:if test="${currentPage==1}"> stop </c:if>"
				href="${currentPage-1}">prev</a>

			<c:forEach begin="1" end="${totalPages}" var="i">
				<a
					class="page <c:if test="${i==currentPage}"> current-page </c:if> href="${i}">${i}</a>
			</c:forEach>

			<a class="page <c:if test="${currentPage==totalPages}"> stop </c:if>"
				href="${currentPage+1}">next</a>
		</div>
		<div class="footer">
			<p>@Songhyun</p>
		</div>
	</div>

</body>
</html>