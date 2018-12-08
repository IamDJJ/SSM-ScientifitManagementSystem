<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="com.util.*"%>
<%
request.setCharacterEncoding("gb2312");//设置页面字符集
DBO db=new DBO();//数据库链接
String   yhm="",mm="",xm="";//初始化变量
String keyid=(String)session.getAttribute("id");//主键

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<LINK href="../images/style.css" type=text/css rel=stylesheet>
<link rel="stylesheet" type="text/css" media="screen" href="../css/tinyTips.css" />

<script language="javascript">
function checkDo(){


if(form.mm1.value==""){
alert("新密码不能为空");
return false;
form.mm1.focus();
}
if(form.mm2.value==""){
alert("新密码不能为空");
return false;
form.mm2.focus();
}

if(form.mm2.value!=form.mm1.value){
alert("两次密码不一致");
return false;
form.mm2.focus();
}



form.action="mmdo.jsp";
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
    <TD height=30>密码修改</TD>
    <TD align=right colSpan=2>&nbsp;</TD>
  </TR></TBODY></TABLE></DIV>
<div class=tablezone>
<div class=noticediv id=notice></div>
<TABLE cellSpacing=0 cellPadding=2 width="100%" align=center border=0>
  <TBODY>


		<tr >
<td align=middle width=100 height=30>新密码</td><td height="30" ><input type="password"  class="input" style="FONT-SIZE: 12px; WIDTH: 300px" name=mm1 value="" ></td>
</tr>

		<tr >
<td align=middle width=100 height=30>确认新密码</td><td height="30" ><input type="password"  class="input" style="FONT-SIZE: 12px; WIDTH: 300px" name=mm2 value="" ></td>
</tr>

</TBODY></TABLE>
</div>  <input type="hidden" name="keyid" value="<%=keyid%>">
<DIV class=adminsubmit> <input type="button" value="保存" name="B1" class="button" style="width:60px" onclick="checkDo()"  />
                      &nbsp;&nbsp;
                      <input type="reset" value="取消" style="width:60px" name="chanel" class="button" />
</div>
</div>
</form>
</body>
<%
db.close();
%>
</html>
