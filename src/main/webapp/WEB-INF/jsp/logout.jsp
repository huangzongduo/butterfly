<%--
  Created by IntelliJ IDEA.
  User: Caleb
  Date: 2018/11/22
  Time: 9:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>

    <%
        response.setHeader("refresh", "0.1; URL = /butterfly/info/index");
        session.invalidate();
    %>
</body>
</html>
