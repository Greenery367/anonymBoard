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
		display: center;
		text-align:center;
		justify-content: center;
	}
	.content-form{
		height:300px;
	}
	.submit{
		display:flex;
		justify-content: center;
		text-decoration: none;
		color: white;
		padding:20px;
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
		<h3><a href="../write-board" class="sub-title">글쓰기</a></h3>
	</div>
	<div class="main-board">
		<form action="delete-board" method="post">
		<div class="form-box">
			<h1>게시글 삭제하기</h1>
		</div>
		<div class="form-box">
			<p>해당 글을 정말 삭제하시겠습니까?</p>
		</div>
		<div class="form-box">
			<a href="../main/1" class="submit" onclick="alert('글이 삭제되었습니다.')">삭제하기</a>
		</div>
		<div class="form-box">
		<a href="../main/1" class="submit" onclick="alert('메인 화면으로 돌아갑니다.')">메인 화면으로 돌아가기</a>
		</div>
		</form>
	</div>
	<div class="footer">
		<p>@Songhyun</p>
	</div>
</div>

</body>
</html>