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
		//�����ð��� 0���� ���������� session���������
		session.setMaxInactiveInterval(0);
	}
	//������ �̿��� id ������
	String id = (String) session.getAttribute("id");

    //�α��� �ȵǾ������� ���� null
	if( id == null){
		id = "�մ�";
	}
%>
		<!--Top  -->
		<table width = "800"> 
			<tr height="100">
			<!--�ΰ� �̹���  -->
				<td colspan = "2" align = "center" width= "200">
					<img alt = "" src = "images/1.png" width="200" height="70">
				</td>
				
				<td colspan = "4" align = "center">
					<font size= "10">���� ķ�� </font>
				</td>
			</tr>
			<tr height="50">
				<td width = "100" align = "center">��Ʈ</td>
				<td width = "100" align = "center">����</td>
				<td width = "100" align = "center">�ı��</td>
				<td width = "100" align = "center">ħ��</td>
				<td width = "100" align = "center">���̺�</td>
				<td width = "100" align = "center"></td>

				<%  if(id.equals("�մ�")){ %>
					<%= id +"��" %>
					<a href="SessionMain.jsp?center=SessionLoginForm.jsp"><button>�α����ϱ�</button></a>
				<% } else { %>
					<a href="SessionMain.jsp?logout=1"><button>�α׾ƿ�</button></a>
				<% }%>
<%--				%session.setAttribute("id", null);--%>
				<td width = "200" align = "center"><%= id +"��" %></td>
			</tr>
		</table>
</body>
</html>