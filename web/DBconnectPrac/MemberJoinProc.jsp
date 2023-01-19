<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="Model.MemberDAO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
	<title>Title</title>
</head>
<body>


	<%
		request.setCharacterEncoding("UTF-8");

		String[] hobby = request.getParameterValues("hobby");
		String texthobby = "";

        for (int i = 0; i < hobby.length; i++){
            texthobby += hobby[i] + " ";
		}
	%>

	<jsp:useBean id="mbean" class="Model.MemberBean">
		<jsp:setProperty name="mbean" property="*"/>
	</jsp:useBean>

	<%
	mbean.setHobby(texthobby);
	%>
	<!--다듬은 후 -->
	<%
	//DB클래스 객체생성
	MemberDAO mDAO = new MemberDAO();
    mDAO.insertMember(mbean);
    //회원가입이 되었다면 회원정보를 보여주는 페이지로 이동시킴
    response.sendRedirect("MemberList.jsp");
	%>






	<!--다듬기 전 -->

<%--    String dbID = "system";--%>
<%--	String dbPassword = "1234";--%>
<%--    String dbURL = "jdbc:oracle:thin:@localhost:1521:XE";--%>


<%--	try {--%>
<%--		Class.forName("oracle.jdbc.driver.OracleDriver");--%>
<%--        Connection conn = DriverManager.getConnection(dbURL, dbID, dbPassword);--%>

<%--		String SQL = "INSERT INTO MEMBER VALUES(?,?,?,?,?,?,?,?)";--%>

<%--		PreparedStatement pstmt = conn.prepareStatement(SQL);--%>

<%--		pstmt.setString(1, mbean.getId());--%>
<%--		pstmt.setString(2, mbean.getPass1());--%>
<%--		pstmt.setString(3, mbean.getEmail());--%>
<%--		pstmt.setString(4, mbean.getTel());--%>
<%--		pstmt.setString(5, mbean.getHobby());--%>
<%--		pstmt.setString(6, mbean.getJob());--%>
<%--		pstmt.setString(7, mbean.getInfo());--%>
<%--		pstmt.setString(8, mbean.getAge());--%>

<%--		pstmt.executeUpdate();//DML시 사용하는 메소드--%>

<%--		conn.close();--%>
<%--	} catch (Exception e) {--%>
<%--		e.printStackTrace();--%>
<%--	}--%>

<%--	%>--%>
<%--	저장 완료.--%>
</body>
</html>
