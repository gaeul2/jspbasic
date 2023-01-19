<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
	<title>Title</title>
</head>
<body>
    <% request.setCharacterEncoding("utf-8");

      String save = request.getParameter("save");

      String id = request.getParameter("id");

      //체크되었는지 비교 판단
      if (save != null) { //null이아니라면 아이디저장이 눌린것
          /*쿠키사용하려면 쿠키클래스를 생성해주어야 함.
            첫번째 인자 키, 두번째 인자 값
           */
          Cookie cookie = new Cookie("id", id);
          //쿠키 유효시간 설정
          cookie.setMaxAge(60*10);//10분간 유효

          response.addCookie(cookie);

          out.write("쿠키생성완료");
      }
    %>


</body>
</html>
