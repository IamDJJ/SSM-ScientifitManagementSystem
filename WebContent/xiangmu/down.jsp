<%@ page contentType="text/html; charset=GB2312" %>
<%@ page import="com.jspsmart.upload.*" %>
<%@ page import="java.io.*" %>
<%@ page import="com.util.*"%>
<%  //String pathone=request.getParameter("PATH");
  String flags="";
  OutputStream os=response.getOutputStream();
  DBO db=new DBO();//初始数据库链接
request.setCharacterEncoding("gb2312");//设置字符集
  try{ 
  


	


    String savePath="";
    savePath="upload\\";
    // System.out.println("savePath="+savePath);
    String filename=request.getParameter("filename");
       byte[] tempByte = filename.getBytes("ISO8859_1"); 
    filename = new String(tempByte,"GB2312");
		// 新建一个SmartUpload对象
	SmartUpload su = new SmartUpload(); 
		// 初始化
	su.initialize(pageContext);
		// 设定contentDisposition为null以禁止浏览器自动打开文件，
		//保证点击链接后是下载文件。若不设定，则下载的文件扩展名为
		//doc时，浏览器将自动用word打开它。扩展名为pdf时，
		//浏览器将用acrobat打开。
	su.setContentDisposition(null);
	String aa=request.getRealPath("/")+savePath+filename;
System.out.println("aaaaaaaaa=="+aa);
		// 下载文件
su.setAllowedFilesList("doc,txt,zip,xls");
	su.downloadFile(aa);
	//System.out.println("successs!!!!!!");
	flags="0";
	}catch(Exception ex){
		flags="1";
		out.println("没有找到0文件，可能该文件已经被删除，或者，上传之后您没有保存");
	}
	 os.flush();  
             os.close();  

%>