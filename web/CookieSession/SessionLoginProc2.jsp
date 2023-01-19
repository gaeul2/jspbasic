<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
	<title>Title</title>
</head>
<body>
	<h2>세션 로그인처리 2</h2>
	<%
		request.setCharacterEncoding("UTF-8");

        //세션을 이용하여 데이터 불러옴
		String id = session.getAttribute("id").toString();
		String pass = session.getAttribute("pass").toString();

        //혹은 (String)으로 다운캐스팅
//		String id = (String) session.getAttribute("id");
//		String pass = (String) session.getAttribute("pass");

	%>
	<h2>당신의 아이디는 <%= id %></h2>
	<h2>당신의 비밀번호는 <%= pass %></h2>


</body>
</html>
