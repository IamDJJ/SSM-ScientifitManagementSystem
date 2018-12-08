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
<title>项目变更管理</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<script language="javascript">
function checkDo(){
if(form.xm.value==""){
alert("项目不能为空");
return false;
form.xm.focus();
}

if(form.bgnr.value==""){
alert("变更内容不能为空");
return false;
form.bgnr.focus();
}

if(form.xmsm.value==""){
alert("项目说明不能为空");
return false;
form.xmsm.focus();
}


form.action="<%=request.getContextPath()%>/xmbg/update";
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
    <TD height=30>项目变更修改</TD>
    <TD align=right colSpan=2>&nbsp;</TD>
  </TR></TBODY></TABLE></DIV>
<div class=tablezone>
<div class=noticediv id=notice></div>
<TABLE cellSpacing=0 cellPadding=2 width="100%" align=center border=0>
  <TBODY>

     <input type="hidden"   name="xm" placeholder="输入项目"  class="input" style="FONT-SIZE: 12px; WIDTH: 300px"  value="${xm}"    />
  	         <tr>
     <td align=middle width=30% height=30>变更内容:</td>
     <td >
	 
	  <textarea name="bgnr" cols="80" rows="5" placeholder="输入变更内容">${bgnr}</textarea>
	<i>	 <font color="red">*</font> </i></li></td>
	 
	 </tr>
  	         <tr>
     <td align=middle width=30% height=30>用户:</td>
     <td ><input type="text"   name="xmsm" placeholder="输入用户"  class="input" style="FONT-SIZE: 12px; WIDTH: 300px"  value="${xmsm}"    /><i>	 <font color="red">*</font> </i></li></td>
	 
	 </tr>
  	     <input type="hidden" name="xmbgid" value="${xmbgid}">
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

