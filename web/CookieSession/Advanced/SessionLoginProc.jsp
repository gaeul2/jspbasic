<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
	<title>Title</title>
</head>
<body>
	<h2>세션 로그인처리 1</h2>
	<%
		request.setCharacterEncoding("UTF-8");

		String id = request.getParameter("id");
		String pass = request.getParameter("pass");

        //세션에 아이디와 패스워드 저장
        session.setAttribute("id", id);
        session.setAttribute("pass", pass);

        //세션의 유지시간 설정
		session.setMaxInactiveInterval(60*2);//60초
		response.sendRedirect("SessionMain.jsp");
		%>


</body>
</html>
