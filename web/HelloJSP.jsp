<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%!
String str1 = "JSP";
String str2 = "안녕하세요..";
%>
<html>
<head>
    <title>HelloJSP</title>
</head>
<body>
    <h2> 처음 만들어보는 <%= str1 %></h2>
    <p>
        <%
        out.println(str2 + str1 + "입니다. 열공합시다^^*");
        %>
    </p>
</body>
</html>
