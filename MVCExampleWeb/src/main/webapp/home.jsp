<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="utf-8" />
    <title>右转俱乐部首页</title>
</head>
<body>
<c:if test="${user==null}">
    <h1 style="color: darkcyan; font-weight: bold;">欢迎粉丝${user.name}</h1>
    <h1 style="color:rebeccapurple; font-weight: bold;">光临本页面！</h1>
</c:if>

<c:if test="${user==null}">
    <h1><a href="${pageContext.request.contextPath}/login.jsp">你尚未登录请求登录</a></h1>
</c:if>
</body>
</html>
