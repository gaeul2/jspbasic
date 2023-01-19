<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
	<title>Title</title>
</head>
<body>
<%
	//Center값을 변경해주기 위해 request객체 이용
	String center = request.getParameter("center");

    //처음 SessionMain.jsp를 실행하면 center가 null이므로 처리
	if ( center == null){
		center = "Center.jsp";
	}
%>
<center>
	<table border="1" width = "800">
		<!-- Top -->
		<tr height="150">
			<td align="center" colspan="2">
				<jsp:include page="Top.jsp" />
			</td>
		</tr>

		<tr height="400">
			<!-- Left -->
			<td align="center" width = "200"><jsp:include page="Left.jsp"/></td>
			<!-- Center -->
			<td align="center" width = "600"><jsp:include page ="<%=center %>" /></td>
		</tr>

		<!--Buttom-->
		<tr height="100">
			<td align="center" colspan="2"><jsp:include page= "Buttom.jsp" /></td>
		</tr>
	</table>
</center>


</body>
</html>
