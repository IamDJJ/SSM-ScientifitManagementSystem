<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="com.jspsmart.upload.*" %>
<%@ page import="java.util.Date"%>
<%
		request.setCharacterEncoding("gb2312");
		String kname=(String)request.getParameter("kname");
		System.out.println("kname="+kname);
		String savePath="upload/";
		String ext="";
		String trace="";
			String filename="";
		try {  
		//实例化上载bean
    SmartUpload mySmartUpload=new SmartUpload();
    //初始化

    mySmartUpload.initialize(pageContext);
    //设置上载的最大值
   
    mySmartUpload.setMaxFileSize(500 * 1024*1024);
    
    //上载文件
	 mySmartUpload.upload();
   //循环取得所有上载的文件
    
     for (int i=0;i<mySmartUpload.getFiles().getCount();i++){
   //取得上载的文件
   com.jspsmart.upload.File myFile = mySmartUpload.getFiles().getFile(i);
  
   if (!myFile.isMissing())
    {
   //取得上载的文件的文件名
    String myFileName=myFile.getFileName();
    //取得不带后缀的文件名
    //String  suffix=name;
  // System.out.println("myFileName="+myFileName);
    String  suffix=myFileName.substring(0,myFileName.lastIndexOf('.')); //取得后缀名
	//System.out.println("suffix="+suffix);
	String   exta=   mySmartUpload.getFiles().getFile(0).getFileExt();  
		mySmartUpload.setAllowedFilesList("doc,ppt,xls,jpg,gif,png");   
		if(true){//exta.equals("flv")||exta.equals("avi")||exta.equals("wmv")||exta.equals("jpg")||exta.equals("gif")||exta.equals("png") 
		 ext = myFileName.substring(myFileName.lastIndexOf('.')+1,myFileName.length());
    //取得文件的大小
    int fileSize=myFile.getSize();
    //保存路径
    String path=request.getRealPath("/")+savePath;
	System.out.println(path);
	//path="/files/";
	Date date = new Date();
String a=String.valueOf(date.getTime());
	 filename=a+"."+ext;
	String explain=(String)mySmartUpload.getRequest().getParameter("text");
    String send=(String)mySmartUpload.getRequest().getParameter("send");
    //将文件保存在服务器端
	    trace=path+filename;
    myFile.saveAs(trace,mySmartUpload.SAVE_PHYSICAL);
	
	
	 }
   else{
   
     out.println(("上载失败！！！").toString()); }
   }//与前面的if对应
	  
	  
	  }
	  
	 %>
	 <script language="javascript">
	 alert("上传成功");
	 parent.document.form.<%=kname%>.value="<%=filename%>";
	 
	 window.location="fileupload.jsp";
	 </script>
	 <%
	   }
    catch (Exception ex) {
      out.print(ex.toString());
    }	
%>


