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
@Controller
@RequestMapping(value="/xmbg")
public class xmbgAction {
	/**
	 * 自动注入业务逻辑层，注入方式使用了注解自动注入
	 */

	@Resource xmbgDao xmbgdao;
	@RequestMapping(value="/addPage")
	public String addPage(xmbg xmbg,HttpServletRequest request){
		Map<String,Object> map= new HashMap<String,Object>();
		
		System.out.println("addPageok");
		return "xmbg/xmbgadd";
	}
	
	@RequestMapping(value="/add")
	public String add(xmbg xmbg,HttpServletRequest request){
		Map<String,Object> map= new HashMap<String,Object>();
		//String name=(String)request.getParameter("name");

		map.put("xmbgid", xmbg.getXmbgid());//项目变更编号

		map.put("xm", xmbg.getXm());//项目

		map.put("bgnr", xmbg.getBgnr());//变更内容

		map.put("xmsm", xmbg.getXmsm());//项目说明

		xmbgdao.save(map);
		
		
		request.setAttribute("msg", "<script>alert('添加成功');</script>");
		System.out.println("addok");
		return "xmbg/xmbgadd";
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
		xmbgdao.del(id);
		return selectall(null,map,request);
	}
	/**
	 * 修改xmbg信息
	 */
	@RequestMapping(value="/update")
	public String update(xmbg xmbg,HttpServletRequest request,Map<String,Object> map1){
		Map<String,Object> map= new HashMap<String,Object>();
		map.put("xmbgid", xmbg.getXmbgid());//项目变更编号

		map.put("xm", xmbg.getXm());//项目

		map.put("bgnr", xmbg.getBgnr());//变更内容

		map.put("xmsm", xmbg.getXmsm());//项目说明

		request.setAttribute("msg", "<script>alert('修改成功');</script>");
		xmbgdao.update(map);
		return selectall(null,map1,request);
	}
	/**
	 * 查询xmbg信息
	 */
	@RequestMapping(value="/modify")
	public String modify(Integer id,Map<String,Object> map,HttpServletRequest request){
		String keyid=(String)request.getParameter("keyid");
		List<Map<String,Object>> list= new  ArrayList<Map<String,Object>>();
		list=xmbgdao.select(Integer.parseInt(keyid));
		request.setAttribute("xmbgid", list.get(0).get("xmbgid"));//项目变更编号

		request.setAttribute("xm", list.get(0).get("xm"));//项目

		request.setAttribute("bgnr", list.get(0).get("bgnr"));//变更内容

		request.setAttribute("xmsm", list.get(0).get("xmsm"));//项目说明

		
		return "xmbg/xmbgmodify";
	}
	
	@RequestMapping(value="/detail")
	public String detail(Integer id,Map<String,Object> map,HttpServletRequest request){
		String keyid=(String)request.getParameter("keyid");
		List<Map<String,Object>> list= new  ArrayList<Map<String,Object>>();
		list=xmbgdao.select(Integer.parseInt(keyid));
		request.setAttribute("xmbgid", list.get(0).get("xmbgid"));//项目变更编号

		request.setAttribute("xm", list.get(0).get("xm"));//项目

		request.setAttribute("bgnr", list.get(0).get("bgnr"));//变更内容

		request.setAttribute("xmsm", list.get(0).get("xmsm"));//项目说明

		return "xmbg/xmbgdetail";
	}
	
	/**
	 * 查询xmbg信息
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
		list=xmbgdao.selectAll(map1);
		System.out.println("listsize="+list.size());
		
		map.put("mylist", list);
		return "xmbg/xmbglist";
	}
}
