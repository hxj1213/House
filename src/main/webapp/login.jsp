<%--
  Created by IntelliJ IDEA.
  User: hxj
  Date: 17-8-9
  Time: 上午11:13
  To change this template use File | Settings | File Templates.
--%>
<%@page language="java" pageEncoding="UTF-8" contentType="text/html;UTF-8" isELIgnored="false" %>
<div id="loginDiv" style="position:relative;display:none;top:150px;left:380px;width: 400px;height: auto;padding-bottom:30px;box-shadow:1px 1px 15px orange;position: absolute;background: #FFFFFF;z-index: 11111111111">
    <img id="closeLoginDiv" style="cursor:pointer;position:absolute;right: 0" src="${pageContext.request.contextPath}/static/images/close_24px_1181428_easyicon.net.png">
    <div id="loginBar" style="width: 100%;height: 50px;border-bottom: solid 1px orange;line-height: 50px;color: orange;font-size: 18px;font-weight: bolder">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;登录窗口</div>
    <div>
        <div style="color: red;text-align: center;margin-top:30px" id="loginErrorDiv"></div>
        <form id="loginForm">
            <div style="text-align: center;color: #555;margin-top:10px">
                <label>用户名</label>
                <input style="width: 180px;height: 28px;border: solid 1px orange;margin-left: 10px;padding-left: 5px;color: darkgray" type="text" name="username">
            </div>
            <div style="text-align: center;color: #555;margin-top:30px">
                <label>密&nbsp;&nbsp;&nbsp;码</label>
                <input style="width: 180px;height: 28px;border: solid 1px orange;margin-left: 10px;padding-left: 5px;color: darkgray" type="password" name="password">
            </div>
            <div style="text-align: center;color: #555;margin-top:30px">
                <input style="outline:none;width: 100px;height: 28px;border: solid 1px #CCCCCC;margin-left: 10px;color: darkgray" id="loginSure" type="button" value="登录">
                <input style="outline:none;width: 100px;height: 28px;border: solid 1px #CCCCCC;margin-left: 10px;color: darkgray" type="reset" value="重置">
            </div>
        </form>
    </div>
</div>


<div id="registerDiv" style="position:relative;display:none;top:150px;left:380px;width: 400px;height: auto;padding-bottom:30px;box-shadow:1px 1px 15px orange;position: absolute;background: #FFFFFF;z-index: 11111111111">
    <img id="closeregisterDiv" style="cursor:pointer;position:absolute;right: 0" src="${pageContext.request.contextPath}/static/images/close_24px_1181428_easyicon.net.png">
    <div id="registerBar" style="width: 100%;height: 50px;border-bottom: solid 1px orange;line-height: 50px;color: orange;font-size: 18px;font-weight: bolder">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;登录窗口</div>
    <div>
        <div style="color: red;text-align: center;margin-top:30px" id="registerErrorDiv"></div>
        <form id="registerForm">
            <div style="text-align: center;color: #555;margin-top:10px">
                <label>用&nbsp;户&nbsp;名</label>
                <input style="width: 180px;height: 28px;border: solid 1px orange;margin-left: 10px;padding-left: 5px;color: darkgray" type="text" name="username">
            </div>
            <div style="text-align: center;color: #555;margin-top:30px">
                <label>密&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;码</label>
                <input style="width: 180px;height: 28px;border: solid 1px orange;margin-left: 10px;padding-left: 5px;color: darkgray" type="password" name="password">
            </div>
            <div style="text-align: center;color: #555;margin-top:30px">
                <label>确认密码</label>
                <input style="width: 180px;height: 28px;border: solid 1px orange;margin-left: 10px;padding-left: 5px;color: darkgray" type="password" name="repassword">
            </div>
            <div style="text-align: center;color: #555;margin-top:30px">
                <input style="outline:none;width: 100px;height: 28px;border: solid 1px #CCCCCC;margin-left: 10px;color: darkgray" id="registerSure" type="button" value="注册">
                <input style="outline:none;width: 100px;height: 28px;border: solid 1px #CCCCCC;margin-left: 10px;color: darkgray" type="reset" value="重置">
            </div>
        </form>
    </div>
</div>




<div id="covertDiv" style="display:none;background: #F9F9F9;opacity: 0.7;z-index:111;position: absolute;top: 0;left: 0"></div>

<div class="top" style="height:40px;position:relative;top:0;left:0;padding:20px 40px;background: lightgray;">
    <div style="float: left;font-size: 22px;color: orange;font-weight: 700;padding-left: 5px;text-shadow:1px 1px 15px orange">
        家馨置业
    </div>
    <div id="nologin" style="float: right;padding-top: 5px">
        <span class="orageBtn" id="clickLogin" style="width: 48px"><a href="javascript:;">登录</a></span>
        &nbsp;&nbsp;&nbsp;
        <span class="orageBtn" id="clickRegiste" style="width: 48px"><a href="javascript:;">注册</a></span>
    </div>
    <div id="haslogin" style="float: right;padding-top: 5px;display: none">
        欢迎你：<span id="usernameSpan">${sessionScope.loginName}</span>
        &nbsp;&nbsp;&nbsp;
        <span class="orageBtn" id="clicklogout" style="width: 48px"><a href="javascript:;">退出</a></span>
    </div>
</div>
<script>
    $(document).ready(function () {
        $("#covertDiv").css('width',document.body.clientWidth)
        $("#covertDiv").css('height',document.body.clientHeight+20)

        function checklogin() {
            $.ajax({
                type:'GET',
                url:'${pageContext.request.contextPath}/user/checklogin.action',
                success:function (resultData) {
                    var loginName = resultData.loginName;
                    $("#usernameSpan").html(loginName);
                    if(loginName!=null && loginName!=""){
                        $("#nologin").css('display','none');
                        $("#haslogin").css('display','inline');
                    }
                }
            })
        }

        checklogin();

        setInterval(function () {
            checklogin();
        },1000);

        $("#clickLogin").click(function () {
            $("#covertDiv").css('display','block')
            $("#loginDiv").css('display','block')
        })

        $("#closeLoginDiv").click(function () {
            $("#covertDiv").css('display','none')
            $("#loginDiv").css('display','none')
        })

        $("#clicklogout").click(function () {
            $.ajax({
                type:'POST',
                url:'${pageContext.request.contextPath}/user/logout.action',
                success:function (resultData) {
                    if(resultData=="success"){
                        $("#haslogin").css('display','none');
                        $("#nologin").css('display','inline');

                        var loginName = $("#usernameSpan").html();
                        console.log("---------logout---success-------"+loginName)
                        $("#usernameSpan").html('');
                    }
                }
            })
        })

    })

    /*
     *
     * login module
     *
     */
    $("input[name='username']").focus(function () {
        $("#loginErrorDiv").html('')
    })
    $("input[type='password']").focus(function () {
        $("#loginErrorDiv").html('')
    })

    $("#loginSure").click(function () {

        var uname = $("#loginForm  input[name='username']").val().trim();
        var passw = $("#loginForm  input[name='password']").val().trim();

        if(uname==null || uname==""){
            $("#loginErrorDiv").html('用户名不可为空');
            return false
        }
        if(passw==null || passw==""){
            $("#loginErrorDiv").html('密码不可为空');
            return false
        }
        alert(uname+"----------"+passw);
        $.ajax({
            type:'POST',
            url:'${pageContext.request.contextPath}/user/login.action',
            data:{username:uname,password:passw},
            dataType:'json',
            success:function (resultData) {
                console.log(resultData)
                if(resultData.flag=="success"){

                    $("#covertDiv").css('display','none');
                    $("#loginDiv").css('display','none');
                    $("#nologin").css('display','none');
                    $("#haslogin").css('display','inline');

                    $("#loginDiv input[name]").val('')

                    console.log(resultData.loginName)
                    $("#usernameSpan").html(resultData.loginName);

                }else if(resultData.flag=="fail"){

                    $("#loginErrorDiv").html('用户名或密码错误');

                }
            }
        })

    })


    /**
     *   注册模块
     */
    $("#clickRegiste").click(function () {
        $("#covertDiv").css('display','block');
        $("#registerDiv").css('display','block');
    })

    $("#closeregisterDiv").click(function () {
        $("#covertDiv").css('display','none');
        $("#registerDiv").css('display','none');
    })

    /*
     *
     * register module
     *
     */
    $("#registerForm input[name]").focus(function () {
        $("#registerErrorDiv").html('');
    })


    $("#registerSure").click(function () {

        alert("------------")

        var uname = $("#registerForm input[name='username']").val().trim();
        var passw = $("#registerForm input[name='password']").val().trim();
        var repassw = $("#registerForm input[name='repassword']").val().trim();

        if(uname==null || uname==""){
            $("#registerErrorDiv").html('用户名必填');
            return false
        }
        if(passw==null || passw==""){
            $("#registerErrorDiv").html('密码必填');
            return false
        }
        if(repassw==null || repassw==""){
            $("#registerErrorDiv").html('重复密码必填');
            return false
        }

        if(passw!=repassw){
            $("#registerErrorDiv").html('重复密码必须和密码相同');
            return false
        }

        $.ajax({
            type:'POST',
            url:'${pageContext.request.contextPath}/user/save.action',
            data:{username:uname,password:passw},
            success:function (resultData) {
                var flag = resultData.flag;
                console.log("flag:"+flag)
                if(flag=="success"){

                    $("#registerForm input[name]").val('');

                    $("#registerDiv").css('display','none');
                    $("#loginDiv").css('display','block');

                }else if(flag=="repeat"){

                    $("#registerErrorDiv").html('用户名已存在');

                }
            }
        })
    })



</script>
<script src="${pageContext.request.contextPath}/static/js/zxx.drag.1.0.js" type="text/javascript"></script>
<script type="text/javascript">
   $("#loginDiv").mousedown(function () {
       var loBox = document.getElementById("loginDiv");
       var loBar = document.getElementById("loginBar");
       startDrag(loBar,loBox);
   })

   $("#registerDiv").mousedown(function () {
       var roBox = document.getElementById("registerDiv");
       var roBar = document.getElementById("registerBar");
       startDrag(roBar,roBox);
   })

</script>
