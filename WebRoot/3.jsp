<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>jQuery鼠标点击弹出登录框代码 - 站长素材</title>

<script type="text/javascript" src="registerui/js/jquery-1.11.2.min.js"></script>
<script type="text/javascript" src="registerui/js/login.js"></script>
<script src="layui/layui.js" charset="utf-8"></script>
<link rel="stylesheet" type="text/css"  href="registerui/css/style.css"/>
 <link rel="stylesheet" href="layui/css/layui.css"  media="all">
</head>
<body>


<table>
<tr><td class="login-header"><a href="javascript:void(0);"><img src="images/login_06.jpg" ></img></a></td></tr>
</table>
<div class="login">
    <div class="login-title">注册平台<span><a href="javascript:void(0);" class="close-login">关闭</a></span></div>
  <form action="logininput.jsp" methed="get">
  <table  width="100%" >
  <tr>
  <td>平台编号：</td>
  <td><input type="text" name="platformid" lay-verify="title" class="layui-input"></td>
  </tr> 
   <tr>
   <td align="center">密码：</td>
   <td><input type="password" lay-verify="title" class="layui-input"></td>
   </tr>  
   <tr>
   <td >平台类型：</td>
   <td><br><input type="radio" name="sex" value="男" title="男" checked=""  >重点实验室
   <input type="radio" name="sex" value="女" title="女"  >工程技术研究中心
   <input type="radio" name="sex" value="女" title="女"  >产业技术研究院<br>
   </td>
   </tr> 
   <tr>
   <td>平台名称：</td>
    <td><input type="text"  lay-verify="title" class="layui-input"></td>
    </tr> 
    <tr><td>批准文号：</td>
    <td><input type="text"  lay-verify="title" class="layui-input"></td>
    </tr> 
    <tr>
    <td colspan="2" align="center"><br/><input type="submit" value="注册" class="layui-btn"></td>
    </tr>
    </table>
    </form>

</div>



</body>
</html>