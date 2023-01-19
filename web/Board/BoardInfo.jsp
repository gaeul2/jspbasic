<%@ page import="Model.BoardDAO" %>
<%@ page import="Model.BoardBean" %>
<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
	<title>글보기</title>
</head>
<body>
	<%
		//String타입을 int형으로 변환
		int num = Integer.parseInt(request.getParameter("num").trim());

        //DB 접근
		BoardDAO bdao = new BoardDAO();
        //가방(bean)에 무슨타입으로 받을래?
		BoardBean bean = bdao.getOneBoard(num);
	%>
	<h2>게시글 보기</h2>
	<table width = "600" border = "1" bgcolor="skyblue">
		<tr height = "40">
			<td width = "100" align ="center">글번호 </td>
			<td width = "180" align ="left"><%= bean.getNum() %></td>
			<td width = "120" align ="center">조회수 </td>
			<td width = "180" align ="center"><%= bean.getReadcount() %></td>
		</tr>

		<tr height = "40">
			<td width = "100" align ="center">작성자 </td>
			<td width = "180" align ="left"><%= bean.getWriter() %></td>
			<td width = "120" align ="center">작성일 </td>
			<td width = "180" align ="center"><%= bean.getReg_date() %></td>
		</tr>

		<tr height = "40">
			<td width = "120" align ="center">이메일 </td>
			<td colspan = "3" align ="center"><%= bean.getEmail() %></td>
		</tr>

		<tr height = "40">
			<td width = "120" align ="center">제목 </td>
			<td colspan = "3" align ="center"><%= bean.getSubject() %></td>
		</tr>

		<tr height = "80">
			<td width = "120" align ="center">글 내용 </td>
			<td colspan = "3" align ="center"><%= bean.getContent() %></td>
		</tr>

		<tr height = "40">
			<td align ="center" colspan = "4">
<%--				num만 넘겨서 조회한뒤 거기서 ref,re_step,re_level써도 상관없음--%>
				<input type="button" value="답글쓰기"
					   onclick="location.href='BorderReWriteForm.jsp?re_step=<%=bean.getRe_step()%>&re_level=<%=bean.getRe_level()%>&num=<%= bean.getNum()%>&ref=<%= bean.getRef() %>'">
				<input type="button" value="수정하기" onclick="location.href='BoardUpdateForm.jsp?num=<%= bean.getNum() %>'">
				<input type="button" value="삭제하기" onclick="location.href='BoardDeleteForm.jsp?num=<%= bean.getNum() %>'">
				<input type="button" value="목록보기" onclick="location.href='BoardList.jsp'">
			</td>
		</tr>
	</table>

</body>
</html>
