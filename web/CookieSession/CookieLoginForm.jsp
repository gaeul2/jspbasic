<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
	<title>Title</title>
</head>
<body>
	<%  request.setCharacterEncoding("utf-8");
		//사용자 컴퓨터의 쿠키저장소로부터 쿠키값을 읽어들임. 쿠키저장소에는 무수히 많은 쿠키들이 있음.
		//따라서 배열을 이용하여 쿠키값 저장 - 애초에 request.getCookies()는 배열로 값 반환함
		Cookie[] cookies = request.getCookies();
        String id = "";
        //null처리
		if (cookies != null){
            for (int i = 0; i<cookies.length; i++){
                if( cookies[i].getName().equals("id")){
					id = cookies[i].getValue();
                    break; // 우리가 원하는 데이터를 찾았으니 반복문 빠져나옴
				}
			}
		}
	%>
	<h2> 쿠키 로그인 </h2>
	<form action ="CookieLoginProc.jsp" method="post">
		<table width="400" border = "1">
			<tr height="50">
				<td width="150">아이디</td>
				<td width="150"><input type = "text" name = "id" value="<%= id %>"></td>
			</tr>

			<tr height="50">
				<td width="150">패스워드</td>
				<td width="150"><input type = "password" name = "pass"></td>
			</tr>

			<tr height="50">
				<td colspan ="2" align ="center"><input type ="checkbox" name = "save" value = "1">아이디 저장</td>
			</tr>

			<tr height="50">
				<td colspan ="2" align="center"><input type ="submit" value = "로그인"></td>
			</tr>
		</table>
	</form>
</body>
</html>
