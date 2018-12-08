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

</head>


<body>

<form name="form" action="" method="post" >
<table class="border" width="98%" border="0" align="center" cellpadding="1" cellspacing="0">
  <tr>
    <td height="565" align="center" valign="top" class="bg_low"><table width="100%" height="25" border="0" cellpadding="0" cellspacing="0">
      <tr>
        <td align="center" valign="middle" class="bgtop"><font color=""><b>合同列表</b></font> 合同名称<input type="text" name="htmc">
		
		<input type="submit"  value="查询"></td>
      </tr>
    </table>
<TABLE cellSpacing=0 cellPadding=3 width="100%" align=center border=1  bordercolor="#33CCCC">
  <TBODY>
 
				  <tr align="center" bgcolor="#ebf0f7">
			  <td>序号 </td>
			
					         <td width="9%" height="25"><strong>合同标题</strong></td>
			
					         <td width="9%" height="25"><strong>合同编号</strong></td>
			
					         <td width="9%" height="25"><strong>起草时间</strong></td>
			
					         <td width="9%" height="25"><strong>起草人</strong></td>
			
					         <td width="9%" height="25"><strong>乙方</strong></td>
			
					         <td width="9%" height="25"><strong>乙方联系方式</strong></td>
			
					         <td width="9%" height="25"><strong>状态</strong></td>
      
                <th>操作</th>
              </tr>
			
					
	  <c:forEach items="${mylist}" var="mymap" varStatus="status">  
              <tr align='center' bgcolor='#FFFFFF' onmouseover='this.style.background="#F2FDFF"' onmouseout='this.style.background="#FFFFFF"'>
			          <td  align="center" height="28" >${status.count}</td>
			  
					        <td  align="center" height="28">${mymap.htbt}</td>
					        <td  align="center" height="28">${mymap.htbh}</td>
					        <td  align="center" height="28">${mymap.qcsj}</td>
					        <td  align="center" height="28">${mymap.qcr}</td>
					        <td  align="center" height="28">${mymap.yf}</td>
					        <td  align="center" height="28">${mymap.yflxfs}</td>
					        <td  align="center" height="28">${mymap.zt}</td>
					
                <td >
				
					<c:if test="${mymap.zt!='变更未审核'}">
<a href="<%= request.getContextPath()%>/hetong/modifya?keyid=${mymap.htid}"  >修改</a>|

</c:if>
<a href="<%= request.getContextPath()%>/hetong/detail?keyid=${mymap.htid}"  >详情</a></td>
              </tr>
			  </c:forEach> 
    </TBODY></TABLE></td></tr></table>
</DIV>


</div>
</form>


    ${msg}



</body>

</html>
