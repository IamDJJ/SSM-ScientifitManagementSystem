<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="com.util.*"%>
<%
request.setCharacterEncoding("gb2312");
String qx="";
if(session.getAttribute("qx")!=null){
qx=(String)session.getAttribute("qx");
}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<link href="css/css_menu.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="/js/jquery.js"></script>
<title>无标题文档</title>

<script language="javascript">


function getObject(objectId) {
 if(document.getElementById && document.getElementById(objectId)) {
 // W3C DOM
 return document.getElementById(objectId);
 }
 else if (document.all && document.all(objectId)) {
 // MSIE 4 DOM
 return document.all(objectId);
 }
 else if (document.layers && document.layers[objectId]) {
 // NN 4 DOM.. note: this won't find nested layers
 return document.layers[objectId];
 }
 else {
 return false;
 }
}

function showHide(objname){
    var obj = getObject(objname);
    if(obj.style.display == "none"){
		obj.style.display = "block";
	}else{
		obj.style.display = "none";
	}
}
</script>
</head>
<base target="main" />
<body>
<div class="infobox">

	
</div>
<div class="menu">


<%
if(qx.equals("管理员")){
%>
		<!-- Item 1 Strat -->
<dl>

<dt><a href="###" onclick="showHide('items1');" target="_self">用户管理</a></dt>
    <dd id="items1" style="display:none;">
        <ul>

	<li><a href='yonghu/addPage' target='main'>添加用户</a></li>
		<li><a href='yonghu/selectall' target='main'>用户列表</a></li>
        </ul>
    </dd>
</dl>
<!-- Item 1 End -->
<!-- Item 1 Strat -->
<dl>

<dt><a href="###" onclick="showHide('items2');" target="_self">管理员管理</a></dt>
    <dd id="items2" style="display:none;">
        <ul>

	<li><a href='gly/addPage' target='main'>添加管理员</a></li>
		<li><a href='gly/selectall' target='main'>管理员列表</a></li>
        </ul>
    </dd>
</dl>
<!-- Item 1 End -->

<%
}
%>
<!-- Item 1 Strat -->
<dl>

<dt><a href="###" onclick="showHide('items3');" target="_self">横向项目管理</a></dt>
    <dd id="items3" style="display:none;">
        <ul>

	<li><a href='hetong/addPage' target='main'>添加合同</a></li>
	
		<li><a href='hetong/myselectall' target='main'>我的合同</a></li>
		
<%
if(qx.equals("管理员")){
%>
		<li><a href='hetong/selectall' target='main'>合同列表</a></li>
			<li><a href='htbg/selectall' target='main'>合同变更列表</a></li>
			
			<% }%>
        </ul>
    </dd>
</dl>
<!-- Item 1 End -->

<!-- Item 1 Strat -->
<dl>

<dt><a href="###" onclick="showHide('items5');" target="_self">纵向项目管理</a></dt>
    <dd id="items5" style="display:none;">
        <ul>

	<li><a href='xiangmu/addPage' target='main'>添加项目</a></li>
			<li><a href='xiangmu/myselectall' target='main'>我的项目</a></li>
			
			
<%
if(qx.equals("管理员")){
%>
		<li><a href='xiangmu/selectall' target='main'>项目列表</a></li>
		<% }%>
			<li><a href='xmbg/addPage' target='main'>添加项目变更</a></li>
	
		<li><a href='xmbg/selectall' target='main'>项目变更列表</a></li>
		
			<li><a href='xmzj/addPage' target='main'>添加项目中检</a></li>
		<li><a href='xmzj/selectall' target='main'>项目中检列表</a></li>
			<li><a href='xmjx/addPage' target='main'>添加项目结项</a></li>
		<li><a href='xmjx/selectall' target='main'>项目结项列表</a></li>
        </ul>
    </dd>
</dl>
<!-- Item 1 End -->

<!-- Item 1 Strat -->
<dl>

<dt><a href="###" onclick="showHide('items11');" target="_self">知识产权管理</a></dt>
    <dd id="items11" style="display:none;">
        <ul>

<%
if(qx.equals("管理员")){
%>
	<li><a href='leixing/addPage' target='main'>添加类型</a></li>
		<li><a href='leixing/selectall' target='main'>类型列表</a></li>
			<li><a href='cqjb/addPage' target='main'>添加产权级别</a></li>
		<li><a href='cqjb/selectall' target='main'>产权级别列表</a></li>
		<% }%>
	<li><a href='zscq/addPage' target='main'>添加知识产权</a></li>
		<li><a href='zscq/selectall' target='main'>知识产权列表</a></li>
		
				<li><a href='zscq/zscq.jsp' target='main'>知识产权查询</a></li>
        </ul>
    </dd>
</dl>
<!-- Item 1 End -->


<!-- Item 1 Strat -->
<dl>

<dt><a href="###" onclick="showHide('items12');" target="_self">社科统计</a></dt>
    <dd id="items12" style="display:none;">
        <ul>


	<li><a href='tongji/hetong.jsp' target='main'>合同统计</a></li>
		<li><a href='tongji/xiangmu.jsp' target='main'>项目统计</a></li>
		<li><a href='tongji/zscq.jsp' target='main'>知识产权统计</a></li>
        </ul>
    </dd>
</dl>
<!-- Item 1 End -->

<!-- Item 1 Strat -->
<dl>

<dt><a href="###" onclick="showHide('items13');" target="_self">个人信息</a></dt>
    <dd id="items13" style="display:none;">
        <ul>
<%
if(qx.equals("用户")){
%>
	<li><a href='yonghu/modify.jsp' target='main'>个人信息</a></li>
	
	<% }%>
		<li><a href='yonghu/mm.jsp' target='main'>密码修改</a></li>

        </ul>
    </dd>
</dl>
<!-- Item 1 End -->
</div>
</body>
</html>
