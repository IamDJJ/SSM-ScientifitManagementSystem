<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="com.util.*"%>
<%
request.setCharacterEncoding("gb2312");
DBO db=new DBO();
String   cqmc="",lx="",fj="",nr="",cqjb="",ytcg="",djr="",djsj="";
String keyid=(String)request.getParameter("keyid");
String sql="select * from zscq where zscqid="+keyid;
ResultSet rs=null;
db.open();
rs=db.query(sql);

/*
知识产权信息查看页面
*/
if(rs.next()){
 cqmc=rs.getString("cqmc");//变量赋值：产权名称
lx=rs.getString("lx");//变量赋值：类型
fj=rs.getString("fj");//变量赋值：附件
nr=rs.getString("nr");//变量赋值：内容
cqjb=rs.getString("cqjb");//变量赋值：产权级别
ytcg=rs.getString("ytcg");//变量赋值：依托成果
djr=rs.getString("djr");//变量赋值：登记人
djsj=rs.getString("djsj");//变量赋值：登记时间

}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<LINK href="../images/style.css" type=text/css rel=stylesheet>
<link rel="stylesheet" type="text/css" media="screen" href="../css/tinyTips.css" />

</head>
<body>
<form name="form" action="" method="post" >
<div class=formzone>
<DIV class=searchzone>

<TABLE height=30 cellSpacing=0 cellPadding=0 width="100%" border=0>
  <TBODY>
  <TR>
    <TD height=30>知识产权详细信息</TD>
    <TD align=right colSpan=2>&nbsp;</TD>
  </TR></TBODY></TABLE></DIV>
<div class=tablezone>
<div class=noticediv id=notice></div>
<TABLE cellSpacing=0 cellPadding=2 width="100%" align=center border=0>
  <TBODY>

		<tr >
<td align=middle width=100 height=30>产权名称</td><td height=30><%=cqmc%></td>
 
</tr>
<tr >
<td align=middle width=100 height=30>类型</td><td height=30><%=lx%></td>
 
</tr>
<tr >
<td align=middle width=100 height=30>附件</td><td height=30><a href="down.jsp?filename=<%=fj%>">下载</a></td>
 
</tr>
<tr >
<td align=middle width=100 height=30>内容</td><td height=30><%=nr%></td>
 
</tr>
<tr >
<td align=middle width=100 height=30>产权级别</td><td height=30><%=cqjb%></td>
 
</tr>
<tr >
<td align=middle width=100 height=30>依托成果</td><td height=30><%=ytcg%></td>
 
</tr>
<tr >
<td align=middle width=100 height=30>登记人</td><td height=30><%=djr%></td>
 
</tr>
<tr >
<td align=middle width=100 height=30>登记时间</td><td height=30><%=djsj%></td>
 
</tr>

</TBODY></TABLE>
</div>
<DIV class=adminsubmit> 
                      &nbsp;&nbsp;
              <INPUT class="button" type="button" value="返回" onClick="history.go(-1)"/> 
</div>
</div>
</form>


</body>
</html>
