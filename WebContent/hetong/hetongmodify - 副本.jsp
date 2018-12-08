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
<title>合同管理</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<script language="javascript">
function checkDo(){
if(form.htbt.value==""){
alert("合同标题不能为空");
return false;
form.htbt.focus();
}

if(form.htbh.value==""){
alert("合同编号不能为空");
return false;
form.htbh.focus();
}

if(form.htnr.value==""){
alert("合同内容不能为空");
return false;
form.htnr.focus();
}

if(form.qcsj.value==""){
alert("起草时间不能为空");
return false;
form.qcsj.focus();
}

if(form.qcr.value==""){
alert("起草人不能为空");
return false;
form.qcr.focus();
}

if(form.jf.value==""){
alert("甲方不能为空");
return false;
form.jf.focus();
}

if(form.jflxfs.value==""){
alert("甲方联系方式不能为空");
return false;
form.jflxfs.focus();
}

if(form.yf.value==""){
alert("乙方不能为空");
return false;
form.yf.focus();
}

if(form.yflxfs.value==""){
alert("乙方联系方式不能为空");
return false;
form.yflxfs.focus();
}

if(form.zt.value==""){
alert("状态不能为空");
return false;
form.zt.focus();
}


form.action="<%=request.getContextPath()%>/hetong/update";
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
    <TD height=30>合同修改</TD>
    <TD align=right colSpan=2>&nbsp;</TD>
  </TR></TBODY></TABLE></DIV>
<div class=tablezone>
<div class=noticediv id=notice></div>
<TABLE cellSpacing=0 cellPadding=2 width="100%" align=center border=0>
  <TBODY>

         <tr>
     <td align=middle width=30% height=30>合同标题:</td>
     <td ><input type="text"   name="htbt" placeholder="输入合同标题"  class="input" style="FONT-SIZE: 12px; WIDTH: 300px"  value="${htbt}"    /><i>	 <font color="red">*</font> </i></li></td>
	 
	 </tr>
  	         <tr>
     <td align=middle width=30% height=30>合同编号:</td>
     <td ><input type="text"   name="htbh" placeholder="输入合同编号"  class="input" style="FONT-SIZE: 12px; WIDTH: 300px"  value="${htbh}"    /><i>	 <font color="red">*</font> </i></li></td>
	 
	 </tr>
  	         <tr>
     <td align=middle width=30% height=30>合同内容:</td>
     <td ><input type="text"   name="htnr" placeholder="输入合同内容"  class="input" style="FONT-SIZE: 12px; WIDTH: 300px"  value="${htnr}"    /><i>	 <font color="red">*</font> </i></li></td>
	 
	 </tr>
  	         <tr>
     <td align=middle width=30% height=30>起草时间:</td>
     <td ><input type="text"   name="qcsj" placeholder="输入起草时间"  class="input" style="FONT-SIZE: 12px; WIDTH: 300px"  value="${qcsj}"    /><i>	 <font color="red">*</font> </i></li></td>
	 
	 </tr>
  	         <tr>
     <td align=middle width=30% height=30>起草人:</td>
     <td ><input type="text"   name="qcr" placeholder="输入起草人"  class="input" style="FONT-SIZE: 12px; WIDTH: 300px"  value="${qcr}"    /><i>	 <font color="red">*</font> </i></li></td>
	 
	 </tr>
  	         <tr>
     <td align=middle width=30% height=30>甲方:</td>
     <td ><input type="text"   name="jf" placeholder="输入甲方"  class="input" style="FONT-SIZE: 12px; WIDTH: 300px"  value="${jf}"    /><i>	 <font color="red">*</font> </i></li></td>
	 
	 </tr>
  	         <tr>
     <td align=middle width=30% height=30>甲方联系方式:</td>
     <td ><input type="text"   name="jflxfs" placeholder="输入甲方联系方式"  class="input" style="FONT-SIZE: 12px; WIDTH: 300px"  value="${jflxfs}"    /><i>	 <font color="red">*</font> </i></li></td>
	 
	 </tr>
  	         <tr>
     <td align=middle width=30% height=30>乙方:</td>
     <td ><input type="text"   name="yf" placeholder="输入乙方"  class="input" style="FONT-SIZE: 12px; WIDTH: 300px"  value="${yf}"    /><i>	 <font color="red">*</font> </i></li></td>
	 
	 </tr>
  	         <tr>
     <td align=middle width=30% height=30>乙方联系方式:</td>
     <td ><input type="text"   name="yflxfs" placeholder="输入乙方联系方式"  class="input" style="FONT-SIZE: 12px; WIDTH: 300px"  value="${yflxfs}"    /><i>	 <font color="red">*</font> </i></li></td>
	 
	 </tr>
  	         <tr>
     <td align=middle width=30% height=30>状态:</td>
     <td ><input type="text"   name="zt" placeholder="输入状态"  class="input" style="FONT-SIZE: 12px; WIDTH: 300px"  value="${zt}"    /><i>	 <font color="red">*</font> </i></li></td>
	 
	 </tr>
  	     <input type="hidden" name="htid" value="${htid}">
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

