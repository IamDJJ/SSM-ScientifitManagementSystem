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
<title>项目管理</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<script language="javascript">
function checkDo(){
if(form.xmmc.value==""){
alert("项目名称不能为空");
return false;
form.xmmc.focus();
}

if(form.fzr.value==""){
alert("负责人不能为空");
return false;
form.fzr.focus();
}

if(form.xmjd.value==""){
alert("项目阶段不能为空");
return false;
form.xmjd.focus();
}

if(form.gs.value==""){
alert("概述不能为空");
return false;
form.gs.focus();
}

if(form.lxsj.value==""){
alert("立项时间不能为空");
return false;
form.lxsj.focus();
}

if(form.js.value==""){
alert("介绍不能为空");
return false;
form.js.focus();
}

if(form.yh.value==""){
alert("用户不能为空");
return false;
form.yh.focus();
}

if(form.zt.value==""){
alert("状态不能为空");
return false;
form.zt.focus();
}

if(form.fj.value==""){
alert("附件不能为空");
return false;
form.fj.focus();
}


form.action="<%=request.getContextPath()%>/xiangmu/add";
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
    <TD height=30>项目添加</TD>
    <TD align=right colSpan=2>&nbsp;</TD>
  </TR></TBODY></TABLE></DIV>
<div class=tablezone>
<div class=noticediv id=notice></div>
<TABLE cellSpacing=0 cellPadding=2 width="100%" align=center border=0>
  <TBODY>

         <tr>
     <td align=middle width=30% height=30>项目名称:</td>
     <td ><input type="text"   name="xmmc" placeholder="输入项目名称"  class="input" style="FONT-SIZE: 12px; WIDTH: 300px"  value=""  /><i>	 <font color="red">*</font> </i></li></td>
	 
	 </tr>
         <tr>
     <td align=middle width=30% height=30>负责人:</td>
     <td ><input type="text"   name="fzr" placeholder="输入负责人"  class="input" style="FONT-SIZE: 12px; WIDTH: 300px"  value=""  /><i>	 <font color="red">*</font> </i></li></td>
	 
	 </tr>
         <tr>
     <td align=middle width=30% height=30>项目阶段:</td>
     <td ><input type="text"   name="xmjd" placeholder="输入项目阶段"  class="input" style="FONT-SIZE: 12px; WIDTH: 300px"  value="立项"  /><i>	 <font color="red">*</font> </i></li></td>
	 
	 </tr>
         <tr>
     <td align=middle width=30% height=30>概述:</td>
     <td >
	 
	 	 <textarea name="gs" cols="80" rows="5" placeholder="输入概述"></textarea>
<i>	 <font color="red">*</font> </i></li></td>
	 
	 </tr>
         <tr>
     <td align=middle width=30% height=30>立项时间:</td>
     <td ><input type="text"   name="lxsj" placeholder="输入立项时间"  class="input" style="FONT-SIZE: 12px; WIDTH: 300px"  value="<%=StaticMethod.getStringDate()%>"  /><i>	 <font color="red">*</font> </i></li></td>
	 
	 </tr>
         <tr>
     <td align=middle width=30% height=30>介绍:</td>
     <td >
	 
	 	 	 <textarea name="js" cols="80" rows="5" placeholder="输入介绍"></textarea>
<i>	 <font color="red">*</font> </i></li></td>
	 
	 </tr>
         <tr>
     <td align=middle width=30% height=30>用户:</td>
     <td ><input type="text"   name="yh" placeholder="输入用户"  class="input" style="FONT-SIZE: 12px; WIDTH: 300px"  value="<%=session.getAttribute("yhm")%>"  /><i>	 <font color="red">*</font> </i></li></td>
	 
	 </tr>
         <tr>
     <td align=middle width=30% height=30>状态:</td>
     <td ><input type="text"   name="zt" placeholder="输入状态"  class="input" style="FONT-SIZE: 12px; WIDTH: 300px"  value="未审核" readonly=""  /><i>	 <font color="red">*</font> </i></li></td>
	 
	 </tr>
	 
	     <tr>
     <td align=middle width=30% height=30>上传合同:</td>
     <td ><input type="text"   name="fj" placeholder="输入附件"  class="input" style="FONT-SIZE: 12px; WIDTH: 300px"  value=""  /> <iframe id="ifr" name="ifr" width="400" height="40" frameborder="no" scrolling="no" src="<%=request.getContextPath()%>/zscq/fileupload.jsp?kname=fj"></iframe><i>	 <font color="red">*</font> </i></li></td>
	 
	 </tr>
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

