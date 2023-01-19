<%@ page import="Model.BoardDAO" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="Model.BoardBean" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
	<title>Title</title>
</head>
<body>
	<%
		//전체게시글의 내용을 jsp쪽으로 가져오기
		BoardDAO bdao = new BoardDAO();

        /*가방에다가 데이터 집어넣어서 가방들을 박스에다 담자.
        	박스가 벡터, ArrayList가 되고 가방이 Bean
        	전체게시글을 리턴 받아주는 소스*/
		//모든 게시글 불러오는 메서드 연결
		ArrayList<BoardBean> alist = bdao.getAllBoard();
	%>
	<h2>전체게시글 보기</h2>
	<table width = "700" border = "1" bgcolor="skyblue">
		<tr height = "40">
			<td align ="right" colspan = "5">
				<input type="button" value="글쓰기" onclick="location.href='BoardWriteForm.jsp'">
			</td>
		</tr>

		<tr height = "40">
			<td width = "50" align ="center">번호 </td>
			<td width = "320" align ="center">제목</td>
			<td width = "100" align ="center">작성자 </td>
			<td width = "150" align ="center">작성일 </td>
			<td width = "80" align ="center">조회수</td>
		</tr>
<%--		반복문돌려서 게시글들 보여줘야함--%>
		<%
			for(int i=0; i<alist.size(); i++){
//              가방 들고 와야징 ->arrayList에 있는 빈클래스를 하나씩 추출
				BoardBean bean = alist.get(i);
		%>

		<tr height = "40">
<%--			여기서 bean.getNum()하면 번호가 꼬임. 그냥 게시글 숫자용이므로 i+1로 하자!--%>
			<td width = "50" align ="center"><%= i+1 %></td>
			<td width = "320" align ="left">
				<a href= "BoardInfo.jsp?num=<%= bean.getNum() %>" style ="text-decoration:none;"><%= bean.getSubject() %></a>
			</td>
			<td width = "100" align ="center"><%= bean.getWriter() %></td>
			<td width = "150" align ="center"><%= bean.getReg_date() %></td>
			<td width = "80" align ="center"><%= bean.getReadcount() %></td>
		</tr>
		<% } %>

	</table>
</body>
</html>
