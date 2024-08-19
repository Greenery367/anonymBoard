<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${statusCode} Error - Page Not Found</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<style type="text/css">
	body {
		display: flex;
		justify-content: center;
		align-items: center;
		height: 100vh;
	}
	
	.error--message {
		text-align: center;
		margin-bottom: 20px;
	}
	
</style>
</head>
<body>
	<div class="container">
		<div class="text-center">
			<h1>${statusCode}</h1>
			<p class="error--message"> Page Not Found </p>
			<p>${message}</p>
			<a href="/index" class="btn btn-primary">Go to Home Page</a>
		</div>
	</div>
</body>
</html>

