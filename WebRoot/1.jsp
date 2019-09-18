<%@page import="model.Platform"%>
<%@page import="java.util.List"%>
<%@page import="dao.PlatformDaoImpl"%>
<%@page import="dao.IPlatformDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <meta charset="utf-8">
  <title>layui</title>
  <meta name="renderer" content="webkit">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
  <link rel="stylesheet" href="layui/css/layui.css"  media="all">
  <!-- 注意：如果你直接复制所有代码到本地，上述css路径需要改成你本地的 -->
</head>
<body>
          


<form class="layui-form" action="1.jsp" method="get">
<table border="1" width="100%">
<tr class="layui-inline">
<td >
  <select name="platformtech" lay-verify="required" lay-search="">
          <option value="">技术类型</option>
          <option value="重点实验室">重点实验室</option>
          <option value="工程技术研究中心">工程技术研究中心</option>
          <option value="产业技术研究院">产业技术研究院</option>   
        </select>
</td>
<td >
  <select name="platformjibie" lay-verify="required" lay-search="">
          <option value="">平台级别</option>
          <option value="国家级">国家级 </option>
          <option value="省级">省级</option>   
        </select>
</td>
<td >
  <select name="jingjinji" lay-verify="required" lay-search="">
          <option value="">京津冀共建</option>
          <option value="是">是 </option>
          <option value="否">否</option>   
        </select>
</td>
<td >
  <select name="gongjiandujian" lay-verify="required" lay-search="">
          <option value="多单位联合共建">多单位联合共建</option>
          <option value="依托单位独自建设">依托单位独自建设</option>
        </select>
</td>
<td>
 <button class="layui-btn" >搜索</button>
 </td>
</tr>
</table>
</form>
<%
	String platformtech=request.getParameter("platformtech");
	String platformjibie=request.getParameter("platformjibie");
	String jingjinji=request.getParameter("jingjinji");
	String gongjiandujian=request.getParameter("gongjiandujian");
	if(platformtech!=null)
	{	
		platformtech= new String(platformtech.getBytes("ISO-8859-1"));
	}
	else 
	if(platformjibie!=null)
	{	
		platformjibie= new String(platformjibie.getBytes("ISO-8859-1"));
	}
	if(jingjinji!=null)
	{	
		jingjinji= new String(jingjinji.getBytes("ISO-8859-1"));
	}
	if(gongjiandujian!=null)
	{	
		gongjiandujian= new String(gongjiandujian.getBytes("ISO-8859-1"));
	}
	IPlatformDao platformDao = new PlatformDaoImpl();
	List<Platform> platforms=null;
	if(platformtech!=null&&platformjibie!=null&&jingjinji!=null&&gongjiandujian!=null)
	{
	 platforms = platformDao.load(platformtech, platformjibie, jingjinji, gongjiandujian);
	//获取登录用户
%>

 
<table class="layui-table" lay-data="{width: 878, height:472,  page:true, id:'idTest'}" lay-filter="demo">
  <thead>
    <tr>
      <th lay-data="{type:'checkbox', fixed: 'left'}"></th>
      <th lay-data="{field:'id', width:80, sort: true, fixed: true}">ID</th>
      <th lay-data="{field:'platformid', width:110}">平台编号</th>
       <th lay-data="{field:'password', width:80}">密码</th>
      <th lay-data="{field:'platformname, width:120, sort: true}">平台名称</th>
      <th lay-data="{field:'platformdate', width:120}">批准年号</th>
      <th lay-data="{field:'platformpizhunnum', width:120}">批准文号</th>
      <th lay-data="{field:'platformtechnology', width:130, sort: true}">技术领域</th>
      <th lay-data="{fixed: 'right', width:180, align:'center', toolbar: '#barDemo'}">操作</th>
    </tr>  
  </thead>
	<tbody>
</tr>
		<%
			for( Platform platform : platforms ){
		%>
		<tr>
			<td> <%=platform.getId() %></td>
			<td> <%=platform.getPlatformid() %></td>
			<td> <%=platform.getPassword() %></td>
			<td> <%=platform.getPlatformname() %></td>
			<td><%=platform.getPlatformdate() %></td>
			<td><%=platform.getPlatformpizhunnum() %></td>
			<td><%=platform.getPlatformtechnology() %></td>
			<%
			}
			 %>
</tr>
	</tbody>
</table>
 <%
 }
 System.out.println(platformtech+platformjibie+jingjinji+gongjiandujian);
  %>
<script type="text/html" id="barDemo">
  <a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="detail" >查看</a>
  <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
  <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del" >删除</a>
</script>
               
          
<script src="layui/layui.js" charset="utf-8"></script>
<!-- 注意：如果你直接复制所有代码到本地，上述js路径需要改成你本地的 -->
<script>
layui.use('table', function(){
  var table = layui.table;
  //监听表格复选框选择
  table.on('checkbox(demo)', function(obj){
    console.log(obj)
  });
  //监听工具条
  table.on('tool(demo)', function(obj){
    var data = obj.data;
    if(obj.event === 'detail'){
      layer.msg('ID：'+ data.id + ' 的查看操作');
    } else if(obj.event === 'del'){
      layer.confirm('真的删除行么', function(index){
        obj.del();
        layer.close(index);
      });
    } else if(obj.event === 'edit'){
      layer.alert('编辑行：<br>'+ JSON.stringify(data))
    }
  });
  
  var $ = layui.$, active = {
    getCheckData: function(){ //获取选中数据
      var checkStatus = table.checkStatus('idTest')
      ,data = checkStatus.data;
      layer.alert(JSON.stringify(data));
    }
    ,getCheckLength: function(){ //获取选中数目
      var checkStatus = table.checkStatus('idTest')
      ,data = checkStatus.data;
      layer.msg('选中了：'+ data.length + ' 个');
    }
    ,isAll: function(){ //验证是否全选
      var checkStatus = table.checkStatus('idTest');
      layer.msg(checkStatus.isAll ? '全选': '未全选')
    }
  };
  
  $('.demoTable .layui-btn').on('click', function(){
    var type = $(this).data('type');
    active[type] ? active[type].call(this) : '';
  });
});
</script>
   
<script src="layui/layui.js" charset="utf-8"></script>
<!-- 注意：如果你直接复制所有代码到本地，上述js路径需要改成你本地的 -->
<script>
layui.use(['form', 'layedit', 'laydate'], function(){
  var form = layui.form
  ,layer = layui.layer
  ,layedit = layui.layedit
  ,laydate = layui.laydate;
  
  //日期
  laydate.render({
    elem: '#date'
  });
  laydate.render({
    elem: '#date1'
  });
  
  //创建一个编辑器
  var editIndex = layedit.build('LAY_demo_editor');
 
  //自定义验证规则
  form.verify({
    title: function(value){
      if(value.length < 5){
        return '标题至少得5个字符啊';
      }
    }
    ,pass: [/(.+){6,12}$/, '密码必须6到12位']
    ,content: function(value){
      layedit.sync(editIndex);
    }
  });
  
  //监听指定开关
  form.on('switch(switchTest)', function(data){
    layer.msg('开关checked：'+ (this.checked ? 'true' : 'false'), {
      offset: '6px'
    });
    layer.tips('温馨提示：请注意开关状态的文字可以随意定义，而不仅仅是ON|OFF', data.othis)
  });
  
  //监听提交
  form.on('submit(demo1)', function(data){
    layer.alert(JSON.stringify(data.field), {
      title: '最终的提交信息'
    })
    return false;
  });
  
  
});
</script>

</body>
</html>