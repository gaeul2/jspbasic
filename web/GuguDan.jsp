<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
	<title>Title</title>
</head>
<body>
	<% 	for (int i = 2; i < 10; i++){
       		for (int j = 1; j < 10; j++) { %>
				<%= i %> + <%= j %> = <%= i * j%> &nbsp;&nbsp;
			<%
        	}
        	%>
	<br>
	<%
    	}
    %>
</body>
</html>
