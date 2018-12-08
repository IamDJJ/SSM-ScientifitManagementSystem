<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="com.util.*"%>
<%
request.setCharacterEncoding("gb2312");

%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<head>


<LINK href="<%=request.getContextPath()%>/images/style.css" type=text/css rel=stylesheet>
<link rel="stylesheet" type="text/css" media="screen" href="<%=request.getContextPath()%>/css/tinyTips.css" />
<title>用户管理</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<script language="javascript">
function checkDo(){
if(form.yhm.value==""){
alert("用户名不能为空");
return false;
form.yhm.focus();
}

if(form.mm.value==""){
alert("密码不能为空");
return false;
form.mm.focus();
}

if(form.xm.value==""){
alert("姓名不能为空");
return false;
form.xm.focus();
}

if(form.xy.value==""){
alert("学院不能为空");
return false;
form.xy.focus();
}

if(form.QQ.value==""){
alert("QQ不能为空");
return false;
form.QQ.focus();
}

if(form.dh.value==""){
alert("电话不能为空");
return false;
form.dh.focus();
}

if(form.xb.value==""){
alert("性别不能为空");
return false;
form.xb.focus();
}

if(form.nl.value==""){
alert("年龄不能为空");
return false;
form.nl.focus();
}


form.action="<%=request.getContextPath()%>/yonghu/update";
form.submit();
}
</script>

<body >


<form name="form" action="" method="post" >
<div class=formzone>
<DIV class=searchzone>

<TABLE height=30 cellSpacing=0 cellPadding=0 width="100%" border=0>
  <TBODY>
  <TR>
    <TD height=30>用户修改</TD>
    <TD align=right colSpan=2>&nbsp;</TD>
  </TR></TBODY></TABLE></DIV>
<div class=tablezone>
<div class=noticediv id=notice></div>
<TABLE cellSpacing=0 cellPadding=2 width="100%" align=center border=0>
  <TBODY>

         <tr>
     <td align=middle width=30% height=30>用户名:</td>
     <td ><input type="text"   name="yhm" placeholder="输入用户名"  class="input" style="FONT-SIZE: 12px; WIDTH: 300px"  value="${yhm}"    /><i>	 <font color="red">*</font> </i></li></td>
	 
	 </tr>
  	         <tr>
     <td align=middle width=30% height=30>密码:</td>
     <td ><input type="text"   name="mm" placeholder="输入密码"  class="input" style="FONT-SIZE: 12px; WIDTH: 300px"  value="${mm}"    /><i>	 <font color="red">*</font> </i></li></td>
	 
	 </tr>
  	         <tr>
     <td align=middle width=30% height=30>姓名:</td>
     <td ><input type="text"   name="xm" placeholder="输入姓名"  class="input" style="FONT-SIZE: 12px; WIDTH: 300px"  value="${xm}"    /><i>	 <font color="red">*</font> </i></li></td>
	 
	 </tr>
  	         <tr>
     <td align=middle width=30% height=30>学院:</td>
     <td ><input type="text"   name="xy" placeholder="输入学院"  class="input" style="FONT-SIZE: 12px; WIDTH: 300px"  value="${xy}"    /><i>	 <font color="red">*</font> </i></li></td>
	 
	 </tr>
  	         <tr>
     <td align=middle width=30% height=30>QQ:</td>
     <td ><input type="text"   name="QQ" placeholder="输入QQ"  class="input" style="FONT-SIZE: 12px; WIDTH: 300px"  value="${QQ}"    /><i>	 <font color="red">*</font> </i></li></td>
	 
	 </tr>
  	         <tr>
     <td align=middle width=30% height=30>电话:</td>
     <td ><input type="text"   name="dh" placeholder="输入电话"  class="input" style="FONT-SIZE: 12px; WIDTH: 300px"  value="${dh}"    /><i>	 <font color="red">*</font> </i></li></td>
	 
	 </tr>
  	         <tr>
     <td align=middle width=30% height=30>性别:</td>
     <td ><input type="text"   name="xb" placeholder="输入性别"  class="input" style="FONT-SIZE: 12px; WIDTH: 300px"  value="${xb}"    /><i>	 <font color="red">*</font> </i></li></td>
	 
	 </tr>
  	         <tr>
     <td align=middle width=30% height=30>年龄:</td>
     <td ><input type="text"   name="nl" placeholder="输入年龄"  class="input" style="FONT-SIZE: 12px; WIDTH: 300px"  value="${nl}"    /><i>	 <font color="red">*</font> </i></li></td>
	 
	 </tr>
  	     <input type="hidden" name="yhid" value="${yhid}">
</TBODY></TABLE>
</div>
<DIV class=adminsubmit> <input type="button" value="保存" name="B1" class="button" style="width:60px" onclick="checkDo()"  />
                      &nbsp;&nbsp;
                      <input type="reset" value="取消" style="width:60px" name="chanel" class="button" />
</div>
</div>
</form>



${msg}







</body>
</html>

