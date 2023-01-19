<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
	<title>Title</title>
</head>
<body>
<h2>1~10까지의 숫자를 화면에 표시</h2>
<%
	//1~10까지의 숫자를 화면에 출력 php랑 같음..
	for(int i = 1; i < 11; i++){
		System.out.println(i); //브라우저가아닌 콘솔에 나타남
%>
<%= i %><br>
<%	}
%>
</body>
</html>
