<%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 2020/4/19
  Time: 20:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" %>
<html>
<head>
    <title>右转粉丝登录界面</title>
</head>
<body>
<div id="box" align="center">
    <div style="color: red">
        <%=request.getAttribute("msg")==null?"": request.getAttribute("msg")%>
    </div>
    <form action="/login" method="post" onsubmit="checkInfo()">
        <table border="1" cellspacing="0" cellpadding="1" align="center" width="600px" height="400px">
            <h1 align="center">粉丝登录表</h1>
            <tr>
                <td style="font-weight: 600; font-size: 20px;" align="center">昵称</td>
                <td align="center" colspan="2">
                    <input type="text" id="userName" name="userName" placeholder="请输入6位以内用户名" maxlength="6" oninput="checkName()" />
                    <span id="nameSpan"></span>
                </td>
            </tr>
            <tr>
                <td style="font-weight: 600; font-size: 20px;" align="center">暗号</td>
                <td align="center" colspan="2">
                    <input type="password" id="password" name="password" placeholder="请输入6~16位用户名" maxlength="16" oninput="checkPassword()" />
                    <span id="pswSpan"></span>
                </td>
            </tr>
            <tr>
                <td style="font-weight: 400; font-size: 10px;" align="center">
                    <img src="/image" id="yzmImg" name="yzmImg" onclick="changeYzm()">
                </td>
                <td align="center">
                    <input type="text" id="yzm" name="yzm" placeholder="请输入验证码" maxlength="4" />
                    <span id="yzmSpan"></span>
                </td>
                <td>
                    <a href="javascript:void(0)"  onclick="changeYzm()">看不清,换一张</a>
                </td>
            </tr>
            <tr>
                <td style="font-weight: 600; font-size: 20px;" align="center">暗号备忘(非必选)</td>
                <td colspan="2" align="center">
                    <input type="radio" name="remember" value="7">记住一周
                    <input type="radio" name="remember" value="30">记住一月
                </td>
            </tr>
            <tr>
                <td  colspan="2" style="font-weight: 600; font-size: 20px;" align="center">初来乍到？少侠请<a href="${pageContext.request.contextPath}/regiest.jsp">点击这里进行注册</a></td>
                <td align="center">
                    <input type="submit" value="登录" />
                </td>
            </tr>
        </table>
    </form>
</div>
</body>
<script type="text/javascript">
    function checkInfo() {
        if (!checkName() || !checkPassword()) {
            alert("信息填写有误！请仔细检查");
            return false;
        }
    }

    function checkName() {
        var username = document.getElementById("userName").value.trim();
        var length = username.length;
        var flag = length>0 ? true : false;
        var nameSpan = document.getElementById("nameSpan");
        if (flag) {
            nameSpan.innerHTML = "<b style='color:green'>✔用户名规则正确</b>";
            return true;
        } else {
            nameSpan.innerHTML = "<b style='color:red'>✘用户名规则错误</b>";
            return false;
        }
    }

    function checkPassword() {
        var password = document.getElementById("password").value.trim();
        var regx = /^[0-9a-z]{6,18}$/i;
        var flag = regx.test(password);
        var passSpan = document.getElementById("pswSpan");
        if (flag) {
            passSpan.innerHTML = "<b style='color:green'>✔密码规则正确</b>";
            return true;
        } else {
            passSpan.innerHTML = "<b style='color:red'>✘密码规则错误</b>";
            return false;
        }
    }

    function changeYzm() {
        document.getElementById("yzmImg").src="/loginProject/image?url="+new Date().getTime();
    }
</script>