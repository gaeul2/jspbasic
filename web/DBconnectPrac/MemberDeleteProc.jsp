<%@ page import="Model.MemberDAO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
	<title>Title</title>
</head>
<body>
<jsp:useBean id="mbean" class="Model.MemberBean">
	<jsp:setProperty name="mbean" property="*" />
</jsp:useBean>
<%
	MemberDAO mdao = new MemberDAO();
	String pass = mdao.getPass(mbean.getId());
	if(mbean.getPass1().equals(pass)){
        mdao.deleteMember(mbean.getId());
        response.sendRedirect("MemberList.jsp");
	} else {
%>
		<script>
			alert("비밀번호가 다릅니다");
			history.go(-1);
		</script>
<%
	}
%>
</body>
</html>
