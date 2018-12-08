<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="com.util.*"%>
<%
request.setCharacterEncoding("gb2312");//设置页面字符集
DBO db=new DBO();//初始数据链接
/*
用户信息添加页面
*/
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<LINK href="../images/style.css" type=text/css rel=stylesheet>
<link rel="stylesheet" type="text/css" media="screen" href="../css/tinyTips.css" />

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


form.action="yonghudo.jsp";
form.submit();
}
</script>

</head>
<body>
<form name="form" action="" method="post" >
<div class=formzone>
<DIV class=searchzone>

<TABLE height=30 cellSpacing=0 cellPadding=0 width="100%" border=0>
  <TBODY>
  <TR>
    <TD height=30>用户添加</TD>
    <TD align=right colSpan=2>&nbsp;</TD>
  </TR></TBODY></TABLE></DIV>
<div class=tablezone>
<div class=noticediv id=notice></div>
<TABLE cellSpacing=0 cellPadding=2 width="100%" align=center border=0>
  <TBODY>

		<tr >
<td align=middle width=100 height=30>用户名</td>
<td height=30><input type="text" class="input" style="FONT-SIZE: 12px; WIDTH: 300px" name="yhm" value=""></td>
 </tr>
<tr >
<td align=middle width=100 height=30>密码</td>
<td height=30><input type="text" class="input" style="FONT-SIZE: 12px; WIDTH: 300px" name="mm" value=""></td>
 </tr>
<tr >
<td align=middle width=100 height=30>姓名</td>
<td height=30><input type="text" class="input" style="FONT-SIZE: 12px; WIDTH: 300px" name="xm" value=""></td>
 </tr>
<tr >
<td align=middle width=100 height=30>学院</td>
<td height=30><input type="text" class="input" style="FONT-SIZE: 12px; WIDTH: 300px" name="xy" value=""></td>
 </tr>
<tr >
<td align=middle width=100 height=30>QQ</td>
<td height=30><input type="text" class="input" style="FONT-SIZE: 12px; WIDTH: 300px" name="QQ" value=""></td>
 </tr>
<tr >
<td align=middle width=100 height=30>电话</td>
<td height=30><input type="text" class="input" style="FONT-SIZE: 12px; WIDTH: 300px" name="dh" value=""></td>
 </tr>
<tr >
<td align=middle width=100 height=30>性别</td>
<td height=30>

 <select name="xb">
	 <option value="男">男</option>
	 <option value="女">女</option>
		 
	 </select>
</td>
 </tr>
<tr >
<td align=middle width=100 height=30>年龄</td>
<td height=30><input type="text" class="input" style="FONT-SIZE: 12px; WIDTH: 300px" name="nl" value=""></td>
 </tr>

</TBODY></TABLE>
</div>
<DIV class=adminsubmit> <input type="button" value="保存" name="B1" class="button" style="width:60px" onclick="checkDo()"  />
                      &nbsp;&nbsp;
                      <input type="reset" value="取消" style="width:60px" name="chanel" class="button" />
</div>
</div>
</form>



</body>
</html>
