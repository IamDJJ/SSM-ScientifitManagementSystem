<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<%
String kname=(String)request.getParameter("kname");
%>

<script language="javascript">
function check(){
if(form.upfile.value==""){
alert("文件不能为空");
return;
}
form.action="fileup_load.jsp?kname=<%=kname%>";
form.submit();
}

</script>
<form name="form" method="post" action="fileup_load.jsp?kname=<%=kname%>" enctype="multipart/form-data" onsubmit="return check();">
	  <input type="file" name="upfile" value="" />
	  <input type="hidden" name="kname" value="<%=kname%>">
	  <input type="button" value="上传" onclick="check();"/>
</form>


