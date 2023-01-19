<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
	<title>Title</title>
</head>
<body>
<%--보통 로그인은 쿠키를 이용해서 하고
세션은 로그인 이후사용함 ex) 장바구니 등등--%>
	<h2> 세션 로그인 </h2>
	<form action ="SessionLoginProc.jsp" method="post">
		<table width="400" border = "1">
			<tr height="50">
				<td width="150">아이디</td>
				<td width="150"><input type = "text" name = "id"></td>
			</tr>

			<tr height="50">
				<td width="150">패스워드</td>
				<td width="150"><input type = "password" name = "pass"></td>
			</tr>

			<tr height="50">
				<td colspan ="2" align ="center"><input type ="submit" value = "로그인 "></td>
			</tr>

		</table>
	</form>
</body>
</html>
