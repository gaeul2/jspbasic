<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
	<title>Title</title>
</head>
<body>

	<h2>게시글 쓰기</h2>
	<form action="BoardWriteProc.jsp" method="post">
		<table width="600" border="1" bordercolor="gray" bgcolor="skyblue">
			<tr height = "40">
				<td width="150" align="center"> 작성자</td>
				<td width="450"><input type ="text" name="writer" size ="60"></td>
			</tr>

			<tr height = "40">
				<td width="150" align="center">제목</td>
				<td width="450"><input type ="text" name="subject"  value ="" size ="60"></td>
			</tr>

			<tr height = "40">
				<td width="150" align="center">이메일</td>
				<td width="450"><input type ="email" name="email" size ="60"></td>
			</tr>

			<tr height = "40">
				<td width="150" align="center">비밀 번호</td>
				<td width="450"><input type ="password" name="password" size ="60"></td>
			</tr>

			<tr height = "40">
				<td width="150" align="center">글 내용</td>
				<td width="450"><textarea rows="10" cols="60" name="content"></textarea></td>
			</tr>

			<!--form에서 사용자로부터 입력바지 않고 데이터를 넘김 -->
			<tr height ="40">
				<td align ="center" colspan="2">
					<input type="hidden" name ="ref" value="">
					<input type="hidden" name ="re_stop" value="">
					<input type="hidden" name ="re_level" value="">
					<input type="submit" value="글 쓰기 완료">&nbsp;&nbsp;
					<input type="reset" value="취소">
					<input type="button" onclick="location.href='BoardList.jsp'" value="전체글보기">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>
