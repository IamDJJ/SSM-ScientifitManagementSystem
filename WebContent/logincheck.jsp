<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*"%>
<%@ page import="com.util.*"%>
<%
DBO db=new DBO();
request.setCharacterEncoding("gb2312");
String yhm=(String)request.getParameter("yhm");
String mm=(String)request.getParameter("mm");
String qx=(String)request.getParameter("qx");

String sql="";
 mm=StaticMethod.MD5(mm);
if(qx.equals("用户")){

sql="select * from yonghu where yhm='"+yhm+"' and mm='"+mm+"' ";
}else{
sql="select * from gly where yhm='"+yhm+"' and mm='"+mm+"' ";
}


System.out.println("sql="+sql);
db.open();
ResultSet rs=db.query(sql);
out.println("<script>");
if(rs.next()){
if(qx.equals("用户")){

session.setAttribute("id",rs.getString("yhid"));
}else{
session.setAttribute("id",rs.getString("glyid"));
}


session.setAttribute("yhm",rs.getString("yhm"));
session.setAttribute("mm",rs.getString("mm"));
session.setAttribute("qx",qx);


out.println("alert('登录成功');");
out.println("window.location='index.jsp'");
}else{
out.println("alert('用户名或者密码错误');");
out.println("window.location='login.jsp'");
}
out.println("</script>");
%>
