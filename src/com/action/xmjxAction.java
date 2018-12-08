package com.action;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import com.bean.*;
import com.dao.*;
import com.util.DBO;
@Controller
@RequestMapping(value="/xmjx")
public class xmjxAction {
	/**
	 * 自动注入业务逻辑层，注入方式使用了注解自动注入
	 */

	@Resource xmjxDao xmjxdao;
	@RequestMapping(value="/addPage")
	public String addPage(xmjx xmjx,HttpServletRequest request){
		Map<String,Object> map= new HashMap<String,Object>();
		
		System.out.println("addPageok");
		return "xmjx/xmjxadd";
	}
	
	@RequestMapping(value="/add")
	public String add(xmjx xmjx,HttpServletRequest request){
		Map<String,Object> map= new HashMap<String,Object>();
		//String name=(String)request.getParameter("name");

		map.put("xmjxid", xmjx.getXmjxid());//项目结项编号

		map.put("xm", xmjx.getXm());//项目

		map.put("jxsm", xmjx.getJxsm());//结项说明

		map.put("yh", xmjx.getYh());//用户

		map.put("sj", xmjx.getSj());//时间

		map.put("bz", xmjx.getBz());//备注

		xmjxdao.save(map);

		try{
		String sql="update xiangmu set xmjd='结项' where xmid='"+xmjx.getXm()+"'";
		DBO db=new DBO();
		db.update(sql);
		}catch(Exception e){
			
			e.printStackTrace();
		}
		
		request.setAttribute("msg", "<script>alert('添加成功');</script>");
		System.out.println("addok");
		return "xmjx/xmjxadd";
	}
	
	/**删除 
	 * 
	 */
	@RequestMapping(value="/del")
	public String  del(Integer id,HttpServletRequest request,Map<String,Object> map){
	//	Map<String,Object> map= new HashMap<String,Object>();
		String a=(String)request.getParameter("keyid");
		id=Integer.parseInt(a);
		request.setAttribute("msg", "<script>alert('删除成功');</script>");
		xmjxdao.del(id);
		return selectall(null,map,request);
	}
	/**
	 * 修改xmjx信息
	 */
	@RequestMapping(value="/update")
	public String update(xmjx xmjx,HttpServletRequest request,Map<String,Object> map1){
		Map<String,Object> map= new HashMap<String,Object>();
		map.put("xmjxid", xmjx.getXmjxid());//项目结项编号

		map.put("xm", xmjx.getXm());//项目

		map.put("jxsm", xmjx.getJxsm());//结项说明

		map.put("yh", xmjx.getYh());//用户

		map.put("sj", xmjx.getSj());//时间

		map.put("bz", xmjx.getBz());//备注

		request.setAttribute("msg", "<script>alert('修改成功');</script>");
		xmjxdao.update(map);
		return selectall(null,map1,request);
	}
	/**
	 * 查询xmjx信息
	 */
	@RequestMapping(value="/modify")
	public String modify(Integer id,Map<String,Object> map,HttpServletRequest request){
		String keyid=(String)request.getParameter("keyid");
		List<Map<String,Object>> list= new  ArrayList<Map<String,Object>>();
		list=xmjxdao.select(Integer.parseInt(keyid));
		request.setAttribute("xmjxid", list.get(0).get("xmjxid"));//项目结项编号

		request.setAttribute("xm", list.get(0).get("xm"));//项目

		request.setAttribute("jxsm", list.get(0).get("jxsm"));//结项说明

		request.setAttribute("yh", list.get(0).get("yh"));//用户

		request.setAttribute("sj", list.get(0).get("sj"));//时间

		request.setAttribute("bz", list.get(0).get("bz"));//备注

		
		return "xmjx/xmjxmodify";
	}
	
	@RequestMapping(value="/detail")
	public String detail(Integer id,Map<String,Object> map,HttpServletRequest request){
		String keyid=(String)request.getParameter("keyid");
		List<Map<String,Object>> list= new  ArrayList<Map<String,Object>>();
		list=xmjxdao.select(Integer.parseInt(keyid));
		request.setAttribute("xmjxid", list.get(0).get("xmjxid"));//项目结项编号

		request.setAttribute("xm", list.get(0).get("xm"));//项目

		request.setAttribute("jxsm", list.get(0).get("jxsm"));//结项说明

		request.setAttribute("yh", list.get(0).get("yh"));//用户

		request.setAttribute("sj", list.get(0).get("sj"));//时间

		request.setAttribute("bz", list.get(0).get("bz"));//备注

		return "xmjx/xmjxdetail";
	}
	
	/**
	 * 查询xmjx信息
	 */
	@RequestMapping(value="/selectall")
	public String selectall(Integer id,Map<String,Object> map,HttpServletRequest request){
		List<Map<String,Object>> list= new  ArrayList<Map<String,Object>>();
	Map<String,Object> map1= new HashMap<String,Object>();
String qx="",yhm="";
	
	if(request.getSession().getAttribute("yhm")!=null){
		qx=request.getSession().getAttribute("qx").toString();
		yhm=request.getSession().getAttribute("yhm").toString();
		if(!qx.equals("管理员"))
		map1.put("yhm", yhm);//标题
	}
		list=xmjxdao.selectAll(map1);
		System.out.println("listsize="+list.size());
		
		map.put("mylist", list);
		return "xmjx/xmjxlist";
	}
}
