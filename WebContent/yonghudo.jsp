<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="com.util.*"%>

<%
/*
用户添加后台
*/
DBO db=new DBO();//初始数据库链接
request.setCharacterEncoding("gb2312");//设置字符集
ResultSet rs=null;//声明结果集
	String keyid =(String)request.getParameter("keyid");
String yhm=(String)request.getParameter("yhm");//变量:用户名
String mm=(String)request.getParameter("mm");//变量:密码
String xm=(String)request.getParameter("xm");//变量:姓名
String xy=(String)request.getParameter("xy");//变量:学院
String QQ=(String)request.getParameter("QQ");//变量:QQ
String dh=(String)request.getParameter("dh");//变量:电话
String xb=(String)request.getParameter("xb");//变量:性别
String nl=(String)request.getParameter("nl");//变量:年龄

String sql="";//声明sql
 sql="insert into yonghu(yhm,mm,xm,xy,QQ,dh,xb,nl) values('"+yhm+"','"+mm+"','"+xm+"','"+xy+"','"+QQ+"','"+dh+"','"+xb+"','"+nl+"')";
;//用户SQL 语句
int row=1;///定义执行结果
		
try{

	
		//int row =0;
		row=db.update(sql);
}catch(Exception e){
System.out.println(e.toString());}
if(row==1){
out.println("<script>");
out.println("alert('操作成功');");
out.println("window.location='yonghuadd.jsp'");
out.println("</script>");
}else{
out.println("<script>");
out.println("alert('操作失败');");
out.println("window.location='yonghuadd.jsp'");
out.println("</script>");
}
db.close();
%>

