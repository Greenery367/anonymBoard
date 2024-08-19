<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판</title>
</head>
<style>
	body{
		margin: 0;
		padding: 0;
	}
	tr th{
		margin-top:5px;
		margin-bottom:5px;
	}
	input {
		width: 500px;
		height:30px;
		border-radius: 5px;
	}
	
	
	.header{
		display: flex;
		text-align: center;
		align-items:center;
		padding: 20px;
		background: #343a40;
	}
	.title{
		color: white;
		padding: 10px;
		text-decoration: none;
	}
	.sub-title{
		color: #868e96;
		dont-size: 2em;
		text-decoration: none;
		padding: 20px;
		margin-top:50px;
	}
	.main-board{
		display: flex;
		justify-content:center;
		align-items:center;
		margin: 40px;
		padding: 40px;
		height: 50vh;
		width:1200px;
		margin-bottom: 100px;
		margin-top: 100px;
	}
	.form-box{
		padding:10px;
		margin:10px;
	}
	.content-form{
		height:300px;
	}
	.submit{
		display:flex;
		justify-content: right;
		padding:12px;
		border:none;
		border-radius:5px;
		background-color:#4caf50; 
	}
	.footer{
		display: flex;
		justify-content:center;
		padding: 20px;
		background: #343a40;
		color: white;
	}
</style>
<body>
<div class="main">
	<div class="header">
		<h1><a href="../main" class="title">Metacoding</a></h1>
		<h3><a href="write-board" class="sub-title">글쓰기</a></h3>
	</div>
	<div class="main-board">
		<form action="../update-board/${boardId}" method="post">
		<div class="form-box">
			<h1>게시글 수정하기</h1>
		</div>
		<div class="form-box">
			<label>글 제목 : </label>
			<input type="text" placeholder="제목을 입력해주세요" name="title" id="title" required>
		</div>
		<div class="form-box">
			<label>글 내용 : </label>
			<input class="content-form" type="textarea" placeholder="내용을 입력해주세요" name="content" id="content" required>
		</div>
		<div class="form-box">
			<button type="submit" class="submit">게시하기</button>
		</div>
		</form>
	</div>
	<div class="footer">
		<p>@Songhyun</p>
	</div>
</div>

</body>
</html>