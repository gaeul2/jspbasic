<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%
	String logout = request.getParameter("logout");
    if( logout != null ){
		session.setAttribute("id", null);
		session.setAttribute("pass", null);
		//유지시간을 0으로 만들어버려도 session사라지겠지
		session.setMaxInactiveInterval(0);
	}
	//세션을 이용해 id 가져옴
	String id = (String) session.getAttribute("id");

    //로그인 안되어있으면 세션 null
	if( id == null){
		id = "손님";
	}
%>
		<!--Top  -->
		<table width = "800"> 
			<tr height="100">
			<!--로고 이미지  -->
				<td colspan = "2" align = "center" width= "200">
					<img alt = "" src = "images/1.png" width="200" height="70">
				</td>
				
				<td colspan = "4" align = "center">
					<font size= "10">낭만 캠핑 </font>
				</td>
			</tr>
			<tr height="50">
				<td width = "100" align = "center">텐트</td>
				<td width = "100" align = "center">의자</td>
				<td width = "100" align = "center">식기류</td>
				<td width = "100" align = "center">침낭</td>
				<td width = "100" align = "center">테이블</td>
				<td width = "100" align = "center"></td>

				<%  if(id.equals("손님")){ %>
					<%= id +"님" %>
					<a href="SessionMain.jsp?center=SessionLoginForm.jsp"><button>로그인하기</button></a>
				<% } else { %>
					<a href="SessionMain.jsp?logout=1"><button>로그아웃</button></a>
				<% }%>
<%--				%session.setAttribute("id", null);--%>
				<td width = "200" align = "center"><%= id +"님" %></td>
			</tr>
		</table>
</body>
</html>