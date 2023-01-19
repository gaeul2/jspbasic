<%@ page import="Model.MemberBean" %>
<%@ page import="Model.MemberDAO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>

<%
    request.setCharacterEncoding("utf-8");

//    이렇게 받던걸 한번에 받기위해 useBean사용
//    String id = request.getParameter("id");
//    String email = request.getParameter("email");
//    String tel = request.getParameter("tel");
//    String pass1 = request.getParameter("pass1");
%>
<jsp:useBean id="mbean" class="Model.MemberBean">
    <jsp:setProperty name="mbean" property="*"/>
</jsp:useBean>
<%
//    String pass1 = mbean.getPass1();
//    String email = mbean.getEmail();
//    String tel = mbean.getTel();

    MemberDAO mdao = new MemberDAO();
    /*    굳이 아래처럼 안하고,
        String memberPass = mdao.getOneMember(id).getPass1(); 로 해도됨.
     */
    String memberPass = mdao.getPass(mbean.getId());
//    MemberBean bean = mdao.getOneMember(id);

    if(mbean.getPass1().equals(memberPass)){
        //mbean으로 받았기때문에 mbean을 넘겨주면 되어서 편함 굿굿
        mdao.updateMemberInfo(mbean);
        response.sendRedirect("MemberList.jsp");
    } else {
%>
<script>
    alert("비밀번호가 일치하지 않습니다.");
    history.go(-1);
</script>
<%
    }
%>
</body>
</html>
