<%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 2020/4/19
  Time: 21:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" %>
<html>
<head>
    <title>右转粉丝注册界面</title>
</head>
<body>
<form action="/regiest" method="post" onsubmit="checkInfo()">
    <table border="1" cellspacing="0" cellpadding="1" align="center" width="600" height="400">
        <h1 align="center">粉丝信息录入表</h1>
        <tr>
            <td style="font-weight: 600; font-size: 20px;" align="center">昵称</td>
            <td>
                <input type="text" id="name" name="name" placeholder="请输入6位以内用户名" maxlength="6" oninput="checkName()" onblur="checkPresent(this)"/>
                <span id="nameSpan"></span>
            </td>
        </tr>
        <tr>
            <td style="font-weight: 600; font-size: 20px;" align="center">暗号</td>
            <td>
                <input type="password" id="password" name="password" placeholder="请输入6~18位密码" maxlength="18" oninput="checkPassword()" />
                <span id="passSpan"></span>
            </td>
        </tr>
        <tr>
            <td style="font-weight: 600; font-size: 20px;" align="center">确认暗号</td>
            <td>
                <input type="password" id="ensure" value="" placeholder="请再次确认密码" maxlength="18" oninput="ensurePassword()" />
                <span id="ensureSpan"></span>
            </td>
        </tr>
        <tr>
            <td style="font-weight: 600; font-size: 20px;" align="center">性别</td>
            <td>
                <input type="radio" name="sex" id="male" value="1" /><label for="male">男</label>
                <input type="radio" name="sex" id="female" value="-1" /><label for="female">女</label>
                <input type="radio" name="sex" id="unknow" value="0" /><label for="unknow">机器人</label>
                <span id="sexSpan"></span>
            </td>
        </tr>
        <tr>
            <td style="font-weight: 600; font-size: 20px;" align="center">破壳日</td>
            <td>
                <select id="year">
                    creatYears();
                    <option value="0" onchange="creatDays()">-请选择出生年份-</option>
                </select>年
                <select id="month" onchange="creatDays()">
                    <option value="0">-请选择出生月份-</option>
                </select>月
                <select id="date">
                    <option value="0">-请选择出生日期-</option>
                </select>日
                <span id="birthSpan"></span>
            </td>
        </tr>
        <tr>
            <td style="font-weight: 600; font-size: 20px;" align="center">爱好</td>
            <td>
                <input type="checkbox" name="hobbies" id="au" value="0" /><label for="au">氪金</label>
                <input type="checkbox" name="hobbies" id="ag" value="1" /><label for="ag">售银</label>
                <input type="checkbox" name="hobbies" id="cu" value="2" /><label for="cu">炼铜</label>
                <input type="checkbox" name="hobbies" id="al" value="3" /><label for="al">铝装</label>
                <input type="checkbox" name="hobbies" id="fe" value="4" /><label for="fe">投铁</label>
                <span id="hobbyId"></span>
            </td>
        </tr>
        <tr>
            <td style="font-weight: 600; font-size: 20px;" align="center">个人简介</td>
            <td>
                <textarea id="overview" placeholder="请简述自己(不少于50字)" oninput="checkOverview(), checkHobbies()"></textarea>
                <span id="ovSpan"></span>
            </td>
        </tr>
        <tr>
            <td>
                <input type="submit" value="确认注册" />
                <input type="reset" value="重置" />
            </td>
        </tr>
    </table>
</form>
</body>
<script type="text/javascript">
    function checkInfo() {
        if (checkName() && checkPassword() && ensurePassword() && checkOverview() && checkBirthday() && checkSex() && checkHobbies() && xmlhttp.responseText!="no") {
            alert("注册成功！准备进入俱乐部首页...");
            return true;
        } else {
            alert("信息填写有误！请仔细检查");
            return false;
        }
    }

    function checkName() {
        var username = document.getElementById("name").value;
        var regx = /^.{1,6}$/i;
        var flag = regx.test(username);
        var nameSpan = document.getElementById("nameSpan");
        if (!flag) {
            nameSpan.innerHTML = "<b style='color:red'>✘用户名规则错误</b>";
            return false;
        }
    }

    //创建异步请求对象
    var xmlhttp = new XMLHttpRequest();
    function checkUsername(obj){
        var username=obj.value;
        //发送异步请求，检验用户名是否存在
        xmlhttp.open("GET", "${pageContext.request.contextPath}/check?username="+username, true);
        xmlhttp.send();
    }

    //接收后台响应的数据
    xmlhttp.onreadystatechange = function () {
        if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
            var msg=xmlhttp.responseText;
            if(msg=="no"){
                document.getElementById("nameSpan").innerHTML="<span style='color:red'>✘用户名已经存在</span>"
            }else{
                document.getElementById("nameSpan").innerHTML = "<span style='color:green'>✔用户名可以使用</span>"
            }
        }
    }

    function checkPassword() {
        var password = document.getElementById("password").value;
        var regx = /^[0-9a-z]{6,18}$/i;
        var flag = regx.test(password);
        var passSpan = document.getElementById("passSpan");
        if (flag) {
            passSpan.innerHTML = "<b style='color:green'>✔密码规则正确</b>";
            return true;
        } else {
            passSpan.innerHTML = "<b style='color:red'>✘密码规则错误</b>";
            return false;
        }
    }

    function ensurePassword() {
        var password = document.getElementById("password").value;
        var ensurepass = document.getElementById("ensure").value;
        var flag = password == ensurepass;
        var ensureSpan = document.getElementById("ensureSpan");
        if (flag) {
            ensureSpan.innerHTML = "<b style='color:green'>✔</b>";
            return true;
        } else {
            ensureSpan.innerHTML = "<b style='color:red'>✘两次输入的密码不一致</b>";
            return false;
        }
    }

    function checkSex() {
        var sexSpan = document.getElementById("sexSpan");
        var sexs = document.getElementsByName("sex");
        for (var i = 0; i < sexs.length; i++) {
            if (sexs[i].checked) {
                return true;
            }
        }
        sexSpan.innerHTML = "<b style='color:red'>✘请选择</b>"
        return false;
    }

    function checkOverview() {
        var overview = document.getElementById("overview").value;
        var flag = overview.length > 49;
        var ovSpan = document.getElementById("ovSpan");
        if (flag) {
            ovSpan.innerHTML = "<b style='color:green'>✔</b>";
            return true;
        } else {
            ovSpan.innerHTML = "<b style='color:red'>✘字数少于50字</b>";
            return false;
        }
    }

    function checkHobbies() {
        var hobbies = document.getElementsByName("hobbies");
        var hobbySpan = document.getElementById("hobbyId");
        for (var i = 0; i < hobbies.length; i++) {
            if (hobbies[i].checked) {
                hobbySpan.innerHTML = null;
                return true;
            }
        }
        hobbySpan.innerHTML = "<b style='color:red'>✘至少选择一项爱好</b>";
        return false;
    }

    year = document.getElementById("year");
    month = document.getElementById("month");
    date = document.getElementById("date");
    (function creatYears() {
        var date = new Date();
        var yearValue = date.getFullYear();
        var startYear = yearValue - 80;

        for (var i = 0; i < 80; i++) {
            //创建option标签
            var option = document.createElement("option");
            //创建文本对象
            var text = document.createTextNode(startYear + i);
            //把文本放到option标签之间
            option.appendChild(text);
            //把option标签放到select标签之间
            year.appendChild(option);
        }
    }());

    (function creatMonths() {
        var date = new Date();
        month.length = 1;

        for (var i = 1; i < 13; i++) {
            var monthStr = 100 + i + "";
            //创建option标签
            var option = document.createElement("option");
            //创建文本对象
            var text = document.createTextNode(monthStr.substring(1));
            //把文本放到option标签之间
            option.appendChild(text);
            //把option标签放到select标签之间
            month.appendChild(option);
        }
    }());

    function creatDays() {
        date.length = 1;

        var yearIndex = year.selectedIndex;
        var monthIndex = month.selectedIndex;
        var yearStr = year.options[yearIndex].text;
        var monthStr = month.options[monthIndex].text;
        var lastDate = 30;

        var yearValue = parseInt(yearStr);
        if ((+monthStr) == 1 || (+monthStr) == 3 || (+monthStr) == 5 || (+monthStr) == 7 || (+monthStr) == 8 || (+monthStr) ==
            10 || (+monthStr) == 12) {
            lastDate = 31;
        } else if ((+monthStr) == 2) {
            if (((yearValue % 4) == 0) && ((yearValue % 1000) != 0)) {
                lastDate = 29;
            } else {
                lastDate = 28;
            }
        }
        for (var i = 1; i <= lastDate; i++) {
            var dayStr = 100 + i + "";
            //创建option标签
            var option = document.createElement("option");
            //创建文本对象
            var text = document.createTextNode(dayStr.substring(1));
            //把文本放到option标签之间
            option.appendChild(text);
            //把option标签放到select标签之间
            date.appendChild(option);
        }
    };

    function checkBirthday() {
        var birthSpan = document.getElementById("birthSpan");
        var dayIndex = date.selectedIndex;
        if (dayIndex == 0) {
            birthSpan.innerHTML = "<b style='color:red'>✘请选择</b>";
            return false;
        }
        return true;
    }
</script>