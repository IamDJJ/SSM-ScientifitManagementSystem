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
@RequestMapping(value="/xmzj")
public class xmzjAction {
	/**
	 * 自动注入业务逻辑层，注入方式使用了注解自动注入
	 */

	@Resource xmzjDao xmzjdao;
	@RequestMapping(value="/addPage")
	public String addPage(xmzj xmzj,HttpServletRequest request){
		Map<String,Object> map= new HashMap<String,Object>();
		
		System.out.println("addPageok");
		return "xmzj/xmzjadd";
	}
	
	@RequestMapping(value="/add")
	public String add(xmzj xmzj,HttpServletRequest request){
		Map<String,Object> map= new HashMap<String,Object>();
		//String name=(String)request.getParameter("name");

		map.put("xmzjid", xmzj.getXmzjid());//项目中检编号

		map.put("xm", xmzj.getXm());//项目

		map.put("zjnr", xmzj.getZjnr());//中检内容

		map.put("yh", xmzj.getYh());//用户

		map.put("sj", xmzj.getSj());//时间

		xmzjdao.save(map);
		
		try{
		String sql="update xiangmu set xmjd='中检' where xmid='"+xmzj.getXm()+"'";
		DBO db=new DBO();
		db.update(sql);
		}catch(Exception e){
			
			e.printStackTrace();
		}
		
		
		request.setAttribute("msg", "<script>alert('添加成功');</script>");
		System.out.println("addok");
		return "xmzj/xmzjadd";
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
		xmzjdao.del(id);
		return selectall(null,map,request);
	}
	/**
	 * 修改xmzj信息
	 */
	@RequestMapping(value="/update")
	public String update(xmzj xmzj,HttpServletRequest request,Map<String,Object> map1){
		Map<String,Object> map= new HashMap<String,Object>();
		map.put("xmzjid", xmzj.getXmzjid());//项目中检编号

		map.put("xm", xmzj.getXm());//项目

		map.put("zjnr", xmzj.getZjnr());//中检内容

		map.put("yh", xmzj.getYh());//用户

		map.put("sj", xmzj.getSj());//时间

		request.setAttribute("msg", "<script>alert('修改成功');</script>");
		xmzjdao.update(map);
		return selectall(null,map1,request);
	}
	/**
	 * 查询xmzj信息
	 */
	@RequestMapping(value="/modify")
	public String modify(Integer id,Map<String,Object> map,HttpServletRequest request){
		String keyid=(String)request.getParameter("keyid");
		List<Map<String,Object>> list= new  ArrayList<Map<String,Object>>();
		list=xmzjdao.select(Integer.parseInt(keyid));
		request.setAttribute("xmzjid", list.get(0).get("xmzjid"));//项目中检编号

		request.setAttribute("xm", list.get(0).get("xm"));//项目

		request.setAttribute("zjnr", list.get(0).get("zjnr"));//中检内容

		request.setAttribute("yh", list.get(0).get("yh"));//用户

		request.setAttribute("sj", list.get(0).get("sj"));//时间

		
		return "xmzj/xmzjmodify";
	}
	
	@RequestMapping(value="/detail")
	public String detail(Integer id,Map<String,Object> map,HttpServletRequest request){
		String keyid=(String)request.getParameter("keyid");
		List<Map<String,Object>> list= new  ArrayList<Map<String,Object>>();
		list=xmzjdao.select(Integer.parseInt(keyid));
		request.setAttribute("xmzjid", list.get(0).get("xmzjid"));//项目中检编号

		request.setAttribute("xm", list.get(0).get("xm"));//项目

		request.setAttribute("zjnr", list.get(0).get("zjnr"));//中检内容

		request.setAttribute("yh", list.get(0).get("yh"));//用户

		request.setAttribute("sj", list.get(0).get("sj"));//时间

		return "xmzj/xmzjdetail";
	}
	
	/**
	 * 查询xmzj信息
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
		list=xmzjdao.selectAll(map1);
		System.out.println("listsize="+list.size());
		
		map.put("mylist", list);
		return "xmzj/xmzjlist";
	}
}
