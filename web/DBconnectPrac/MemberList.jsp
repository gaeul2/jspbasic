<%@ page import="Model.MemberDAO" %>
<%@ page import="java.util.Vector" %>
<%@ page import="Model.MemberBean" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
	<title>Title</title>
</head>
<body>
<!-- 1. DB에서 모든 회원의 정보를 가져옴
	2. table 태그를 이용하여 회원들의 정보출력-->
<%
	MemberDAO mdao = new MemberDAO();
    //회원수모르므로 가변길이가능한 ArrayList와 벡터중 여기선 벡터사용하여 DB저장
	Vector<MemberBean> vec = mdao.getAllMember();

%>
<h2> 모든 회원 보기 </h2>

<table width ="800" border="1">
	<tr height="50">
		<td align = "center" width = "150">아이디 </td>
		<td align = "center" width = "250">이메일 </td>
		<td align = "center" width = "200">전화번호 </td>
		<td align = "center" width = "200">취미 </td>
	</tr>
	<%
		for(int i = 0 ; i<vec.size();i++){
			MemberBean bean = vec.get(i);//백터에 담긴 빈 클래스를 하나씩 추출
	%>
		<tr height="50">
			<td align = "center" width = "150">
				<a href = "MemberInfo.jsp?id=<%=bean.getId()%>">
					<%=bean.getId()%></a>
			</td>
			<td align = "center" width = "250"><%=bean.getEmail()%></td>
			<td align = "center" width = "200"><%=bean.getTel()%></td>
			<td align = "center" width = "200"><%=bean.getHobby()%></td>
		</tr>
	<%
		}
	%>
</table>
</body>
</html>
