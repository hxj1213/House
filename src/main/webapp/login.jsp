<%@page language="java" contentType="text/html;UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<html>
<body>

<form action="${pageContext.request.contextPath}/save">
    用户名:<input type="text" name="username"><br>
    密码:<input type="password" name="password"><br>
    手机号:<input type="text" name="phone"><br>
    邮箱:<input type="text" name="email"><br>
    <input type="submit" value="新增">
</form>

<form action="${pageContext.request.contextPath}/login" method="post">
    用户名:<input type="text" name="username"><br>
    密码:<input type="password" name="password"><br>
    <input type="submit" value="登录">
</form>

</body>
</html>
