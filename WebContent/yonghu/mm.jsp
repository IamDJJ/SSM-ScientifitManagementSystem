<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="com.util.*"%>
<%
request.setCharacterEncoding("gb2312");//����ҳ���ַ���
DBO db=new DBO();//���ݿ�����
String   yhm="",mm="",xm="";//��ʼ������
String keyid=(String)session.getAttribute("id");//����

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
alert("�����벻��Ϊ��");
return false;
form.mm1.focus();
}
if(form.mm2.value==""){
alert("�����벻��Ϊ��");
return false;
form.mm2.focus();
}

if(form.mm2.value!=form.mm1.value){
alert("�������벻һ��");
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
    <TD height=30>�����޸�</TD>
    <TD align=right colSpan=2>&nbsp;</TD>
  </TR></TBODY></TABLE></DIV>
<div class=tablezone>
<div class=noticediv id=notice></div>
<TABLE cellSpacing=0 cellPadding=2 width="100%" align=center border=0>
  <TBODY>


		<tr >
<td align=middle width=100 height=30>������</td><td height="30" ><input type="password"  class="input" style="FONT-SIZE: 12px; WIDTH: 300px" name=mm1 value="" ></td>
</tr>

		<tr >
<td align=middle width=100 height=30>ȷ��������</td><td height="30" ><input type="password"  class="input" style="FONT-SIZE: 12px; WIDTH: 300px" name=mm2 value="" ></td>
</tr>

</TBODY></TABLE>
</div>  <input type="hidden" name="keyid" value="<%=keyid%>">
<DIV class=adminsubmit> <input type="button" value="����" name="B1" class="button" style="width:60px" onclick="checkDo()"  />
                      &nbsp;&nbsp;
                      <input type="reset" value="ȡ��" style="width:60px" name="chanel" class="button" />
</div>
</div>
</form>
</body>
<%
db.close();
%>
</html>