<%@ page import="Model.BoardDAO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
	<title>Title</title>
</head>
<body>
<%--작성자 :write 제목 :subject 이메일 :email 비밀번호 :password 글내용: content --%>

<%
	request.setCharacterEncoding("UTF-8");
%>
<!--게시판 작성한 데이터를 한번에 읽어들이기-->
	<%-- useBean -> id :이름처럼 생각 class :위치 --%>
	<%-- setProperty -> name :Bean클래스이름 propertu :가져올 것들. 꼭 setProperty다.
 		 Bean에서 맵핑한 데이터를 딱 하고 맞춰준다고 생각하자.--%>
<jsp:useBean id="boardbean" class="Model.BoardBean">
	<jsp:setProperty name="boardbean" property="*"/>
</jsp:useBean>

<!--DB에 Bean클래스를 넘겨줌-->
<<%
	//DB와 소통하는 BoardDAO객체생성
	BoardDAO bdao = new BoardDAO();

    //메서드로 처리하자. (내가 만들어야해)
	bdao.insertBoard(boardbean);

    //게시글 저장후 전체게시글 보기
	response.sendRedirect("BoardList.jsp");
%>

%>
</body>
</html>
