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

tr th {
	margin-top: 5px;
	margin-bottom: 5px;
}

input {
	width: 300px;
	height: 30px;
	border-radius: 5px;
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

.password {
	input: invalid;
}

.main-board {
	display: flex;
	justify-content: center;
	align-items: center;
	padding: 40px;
	height: 50vh;
	width: 100%;
	margin-bottom: 100px;
	margin-top: 100px;
}

.board {
	width: 700px;
}

.form-box {
	padding: 10px;
	margin: 10px;
	display: flex;
	justify-content: center;
}

.content-form {
	height: 300px;
}

.submit {
	display: flex;
	justify-content: center;
	padding: 12px;
	border: none;
	border-radius: 5px;
	background-color: #4caf50;
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
				<a href="../main/1" class="title">Metacoding</a>
			</h1>
			<h3>
				<a href="../write-board" class="sub-title">글쓰기</a>
			</h3>
		</div>
		<div class="main-board">
			<div class="board">
				<div class="form-box">
					<H1>비밀번호 확인하기</H1>
				</div>
				<form action="${boardId}?type=${type}" method="post">
					<div class="form-box">
						<label>비밀번호 확인: </label> <input class="password" type="number"
							placeholder="비밀번호를 입력해주세요" name="password" id="password" required>
					</div>
					<div class="form-box">
						<button type="submit" class="submit">전송하기</button>
					</div>
				</form>
			</div>
		</div>
		<div class="footer">
			<p>@Songhyun</p>
		</div>
	</div>

</body>
</html>