<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<br/>
	<div align="center">
	<div class="w3-card-4" style="width:50%;">
		<div class="w3-container w3-black" >
			<h2>공지사항 작성</h2>
		</div>
		<form class="w3-container" action="/insertInfo.do" enctype="multipart/form-data" method="post">
			<p>
				<label class="w3-text-black"><b>공지사항 제목</b></label> 
				<input class="w3-input w3-border w3-sand" name="title" type="text" />
			</p>
			<p>
				<label class="w3-text-black"><b>내용 작성</b></label> 
				<textarea rows="8" cols="40" name="content" class="w3-input w3-border w3-sand" style="resize:none;"></textarea>
			</p>
			<p>
				<input type="file" name="infoFile" class="w3-btn w3-black"/>
			</p>
			<p>
				<button class="w3-btn w3-black" type="submit">Register</button>
				<a href="/info.do?num=1&page=1&viewPage=1"><button type="button" class="w3-btn w3-black">Cancel</button></a>
			</p>
		</form>
	</div>
	</div>
</body>
</html>