<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="com.util.*"%>
<%
request.setCharacterEncoding("gb2312");//设置页面字符集
DBO db=new DBO();//初始链接数据库类
String sql="select * from zscq where 1=1 ";//查询 知识产权sql语句

String cqmc=(String)request.getParameter("cqmc");
if(cqmc!=null&&!cqmc.equals("")){
sql+=" and cqmc like '%"+cqmc+"%'";
}
db.open();//打开数据库链接
ResultSet rs=db.query(sql);//查询结果
//知识产权信息查询
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>知识产权列表</title>
</head>
<LINK href="../images/style.css" type=text/css rel=stylesheet>
<LINK href="<%=request.getContextPath()%>/images/style.css" type=text/css rel=stylesheet>
<link rel="stylesheet" type="text/css" media="screen" href="<%=request.getContextPath()%>/css/tinyTips.css" />

<body>
<form name="form" action="" method="post" >
<table class="border" width="98%" border="0" align="center" cellpadding="1" cellspacing="0">
  <tr>
    <td height="565" align="center" valign="top" class="bg_low"><table width="100%" height="25" border="0" cellpadding="0" cellspacing="0">
      <tr>
        <td align="left" valign="middle" class="bgtop"><font color=""><b>知识产权列表</b></font> 产权名称<input type="text" name="cqmc" value="">
		
		<input type="submit" value="查询">
		</td>
      </tr>
    </table>
<TABLE cellSpacing=0 cellPadding=3 width="100%" align=center border=1 bordercolor="#33CCCC" id="table1">
  <TBODY id="table2">
 
				 		<tr align="center" bgcolor="#ebf0f7">
 <td width="9%" height="25" >知识产权编号</td>
 <td width="9%" height="25" >产权名称</td>
 <td width="9%" height="25" >类型</td>
 <td width="9%" height="25" >产权级别</td>
 <td width="9%" height="25" >登记人</td>
 <td width="9%" height="25" >登记时间</td>
 <td width="10%">操作</td>
</tr>

			
					<%
					if(rs!=null){
					while(rs.next()){
					%>
                  	  <tr align='center' bgcolor='#FFFFFF' onmouseover='this.style.background="#F2FDFF"' onmouseout='this.style.background="#FFFFFF"'>
 <td height="24" ><%=rs.getString("zscqid")%></td>
 <td height="24" ><%=rs.getString("cqmc")%></td>
 <td height="24" ><%=rs.getString("lx")%></td>
 <td height="24" ><%=rs.getString("cqjb")%></td>
 <td height="24" ><%=rs.getString("djr")%></td>
 <td height="24" ><%=rs.getString("djsj")%></td>
<td >|<a href="detail.jsp?keyid=<%=rs.getString("zscqid")%>">查看</a></td>
</tr>

                 <%
				 }
				 }
				 %>
    </TBODY></TABLE>
	 <span id="spanFirst">第一页</span> <span id="spanPre">上一页</span> <span id="spanNext">下一页</span> <span id="spanLast">最后一页</span> 第<span id="spanPageNum"></span>页/共<span id="spanTotalPage"></span>页
	</td></tr></table>
	  <script>
      var theTable = document.getElementById("table2");
      var totalPage = document.getElementById("spanTotalPage");
      var pageNum = document.getElementById("spanPageNum");


      var spanPre = document.getElementById("spanPre");
      var spanNext = document.getElementById("spanNext");
      var spanFirst = document.getElementById("spanFirst");
      var spanLast = document.getElementById("spanLast");


      var numberRowsInTable = theTable.rows.length;
      var pageSize = 20;
      var page = 1;


      //下一页
     function next() {


          hideTable();


          currentRow = pageSize * page;
          maxRow = currentRow + pageSize;
          if (maxRow > numberRowsInTable) maxRow = numberRowsInTable;
          for (var i = currentRow; i < maxRow; i++) {
              theTable.rows[i].style.display = '';
          }
          page++;


          if (maxRow == numberRowsInTable) { nextText(); lastText(); }
          showPage();
          preLink();
          firstLink();
      }


      //上一页
     function pre() {


          hideTable();


          page--;


          currentRow = pageSize * page;
          maxRow = currentRow - pageSize;
          if (currentRow > numberRowsInTable) currentRow = numberRowsInTable;
          for (var i = maxRow; i < currentRow; i++) {
              theTable.rows[i].style.display = '';
          }




          if (maxRow == 0) { preText(); firstText(); }
          showPage();
          nextLink();
          lastLink();
      }


      //第一页
     function first() {
          hideTable();
          page = 1;
          for (var i = 0; i < pageSize; i++) {
              theTable.rows[i].style.display = '';
          }
          showPage();


          preText();
          nextLink();
          lastLink();
      }


      //最后一页
     function last() {
          hideTable();
          page = pageCount();
          currentRow = pageSize * (page - 1);
          for (var i = currentRow; i < numberRowsInTable; i++) {
              theTable.rows[i].style.display = '';
          }
          showPage();


          preLink();
          nextText();
          firstLink();
      }


      function hideTable() {
          for (var i = 0; i < numberRowsInTable; i++) {
              theTable.rows[i].style.display = 'none';
          }
      }


      function showPage() {
          pageNum.innerHTML = page;
      }


      //总共页数
     function pageCount() {
          var count = 0;
          if (numberRowsInTable % pageSize != 0) count = 1;
          return parseInt(numberRowsInTable / pageSize) + count;
      }


      //显示链接
     function preLink() { spanPre.innerHTML = "<a href='javascript:pre();'>上一页</a>"; }
      function preText() { spanPre.innerHTML = "上一页"; }


      function nextLink() { spanNext.innerHTML = "<a href='javascript:next();'>下一页</a>"; }
      function nextText() { spanNext.innerHTML = "下一页"; }


      function firstLink() { spanFirst.innerHTML = "<a href='javascript:first();'>第一页</a>"; }
      function firstText() { spanFirst.innerHTML = "第一页"; }


      function lastLink() { spanLast.innerHTML = "<a href='javascript:last();'>最后一页</a>"; }
      function lastText() { spanLast.innerHTML = "最后一页"; }


      //隐藏表格
     function hide() {
          for (var i = pageSize; i < numberRowsInTable; i++) {
              theTable.rows[i].style.display = 'none';
          }


          totalPage.innerHTML = pageCount();
          pageNum.innerHTML = '1';


          nextLink();
          lastLink();
      }


      hide();
 </script> 
</DIV>


</div>
</form>


</body>
<%
db.close();
%>
</html>
