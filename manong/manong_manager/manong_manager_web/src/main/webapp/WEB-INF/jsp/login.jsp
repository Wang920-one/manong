<%--  Created by IntelliJ IDEA.--%>
<%--  User: Lenovo--%>
<%--  Date: 2019/6/16--%>
<%--  Time: 15:48--%>
<%--  To change this template use File | Settings | File Templates.--%>
<%--<%@ page contentType="text/html;charset=UTF-8" language="java" %>--%>
<%--<html lang="en">--%>
<%--<head>--%>
<%--    <meta charset="UTF-8">--%>
<%--    <title>登录页面</title>--%>

<%--    <link rel="stylesheet" type="text/css" href="/css/login.css"/>--%>
<%--    <script type="text/javascript" src="/js/login.js"></script>--%>
<%--</head>--%>

<%--<body>--%>
<%--<div id="login_frame">--%>

<%--    <p id="image_logo"><img src="/images/pp.svg" width="50"  height="26"></p>--%>

<%--    <form method="post" action="/js/login.js">--%>

<%--        <p><label class="label_input">用户名</label><input type="text" id="username" class="text_field"/></p>--%>
<%--        <p><label class="label_input">密码</label><input type="text" id="password" class="text_field"/></p>--%>

<%--        <div id="login_control">--%>
<%--            <input type="button" id="btn_login" value="登录" onclick="login();"/>--%>
<%--            <a id="forget_pwd" href="forget_pwd.html">忘记密码？</a>--%>
<%--        </div>--%>
<%--    </form>--%>
<%--</div>--%>

<%--</body>--%>
<%--</html>--%>

  <%@ page contentType="text/html;charset=UTF-8" language="java" %>
  <html lang="en">
  <head>
      <meta charset="UTF-8">
      <title>登录页面</title>

      <link rel="stylesheet" type="text/css" href="/css/login.css"/>
      <link rel="stylesheet" type="text/css" href="css/themes/default/easyui.css">
      <link rel="stylesheet" type="text/css" href="css/themes/icon.css">
      <script type="text/javascript" src="js/jquery.min.js"></script>
      <script type="text/javascript" src="js/jquery.easyui.min.js"></script>
  </head>

  <body>
  <div id="login_frame">

      <p id="image_logo"><img src="/images/pp.svg" width="50"  height="26"></p>

      <form id="ff" method="post" action="/checkUser">

          <p><label class="label_input">用户名</label><input type="text" name="username" id="username" class="text_field"/></p>
          <p><label class="label_input">密码</label><input type="password" name="password" id="password" class="text_field"/></p>

          <div id="login_control">
              <input type="button" id="btn_login" value="登录" onclick="login();"/>
              <a id="forget_pwd" href="forget_pwd.html">忘记密码？</a>
          </div>
      </form>
  </div>

  </body>

  <script type="text/javascript" >

      function login() {

          var username = document.getElementById("username");
          var pass = document.getElementById("password");

          if (username.value == "") {

              alert("请输入用户名");

          } else if (pass.value  == "") {

              alert("请输入密码");

          }else {

              $('#ff').form({

                  success:function(data){
                      var data = eval('(' + data + ')');
                      if (data.status == 200){
                          alert("登录成功")
                          location.replace("/index");
                      }else {
                          alert("登录失败")
                      }
                  }
              });
              $('#ff').submit();
          }
      }

  </script>
  </html>