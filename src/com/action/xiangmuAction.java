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
@RequestMapping(value="/xiangmu")
public class xiangmuAction {
	/**
	 * 自动注入业务逻辑层，注入方式使用了注解自动注入
	 */

	@Resource xiangmuDao xiangmudao;
	@RequestMapping(value="/addPage")
	public String addPage(xiangmu xiangmu,HttpServletRequest request){
		Map<String,Object> map= new HashMap<String,Object>();
		
		System.out.println("addPageok");
		return "xiangmu/xiangmuadd";
	}
	
	@RequestMapping(value="/add")
	public String add(xiangmu xiangmu,HttpServletRequest request){
		Map<String,Object> map= new HashMap<String,Object>();
		//String name=(String)request.getParameter("name");

		map.put("xmid", xiangmu.getXmid());//项目编号

		map.put("xmmc", xiangmu.getXmmc());//项目名称

		map.put("fzr", xiangmu.getFzr());//负责人

		map.put("xmjd", xiangmu.getXmjd());//项目阶段

		map.put("gs", xiangmu.getGs());//概述

		map.put("lxsj", xiangmu.getLxsj());//立项时间

		map.put("js", xiangmu.getJs());//介绍

		map.put("yh", xiangmu.getYh());//用户

		map.put("zt", xiangmu.getZt());//状态
		map.put("fj", xiangmu.getFj());//状态
		xiangmudao.save(map);
		
		
		request.setAttribute("msg", "<script>alert('添加成功');</script>");
		System.out.println("addok");
		return "xiangmu/xiangmuadd";
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
		xiangmudao.del(id);
		return selectall(null,map,request);
	}
	/**
	 * 修改xiangmu信息
	 */
	@RequestMapping(value="/update")
	public String update(xiangmu xiangmu,HttpServletRequest request,Map<String,Object> map1){
		Map<String,Object> map= new HashMap<String,Object>();
		map.put("xmid", xiangmu.getXmid());//项目编号

		map.put("xmmc", xiangmu.getXmmc());//项目名称

		map.put("fzr", xiangmu.getFzr());//负责人

		map.put("xmjd", xiangmu.getXmjd());//项目阶段

		map.put("gs", xiangmu.getGs());//概述

		map.put("lxsj", xiangmu.getLxsj());//立项时间

		map.put("js", xiangmu.getJs());//介绍

		map.put("yh", xiangmu.getYh());//用户

		map.put("zt", xiangmu.getZt());//状态

		map.put("fj", xiangmu.getFj());//状态
		request.setAttribute("msg", "<script>alert('修改成功');</script>");
		xiangmudao.update(map);
		return selectall(null,map1,request);
	}
	/**
	 * 查询xiangmu信息
	 */
	@RequestMapping(value="/modify")
	public String modify(Integer id,Map<String,Object> map,HttpServletRequest request){
		String keyid=(String)request.getParameter("keyid");
		List<Map<String,Object>> list= new  ArrayList<Map<String,Object>>();
		list=xiangmudao.select(Integer.parseInt(keyid));
		request.setAttribute("xmid", list.get(0).get("xmid"));//项目编号

		request.setAttribute("xmmc", list.get(0).get("xmmc"));//项目名称

		request.setAttribute("fzr", list.get(0).get("fzr"));//负责人

		request.setAttribute("xmjd", list.get(0).get("xmjd"));//项目阶段

		request.setAttribute("gs", list.get(0).get("gs"));//概述

		request.setAttribute("lxsj", list.get(0).get("lxsj"));//立项时间

		request.setAttribute("js", list.get(0).get("js"));//介绍

		request.setAttribute("yh", list.get(0).get("yh"));//用户

		request.setAttribute("zt", list.get(0).get("zt"));//状态

		request.setAttribute("fj", list.get(0).get("fj"));//状态
		return "xiangmu/xiangmumodify";
	}
	
	@RequestMapping(value="/detail")
	public String detail(Integer id,Map<String,Object> map,HttpServletRequest request){
		String keyid=(String)request.getParameter("keyid");
		List<Map<String,Object>> list= new  ArrayList<Map<String,Object>>();
		list=xiangmudao.select(Integer.parseInt(keyid));
		request.setAttribute("xmid", list.get(0).get("xmid"));//项目编号
	
		request.setAttribute("xmmc", list.get(0).get("xmmc"));//项目名称

		request.setAttribute("fzr", list.get(0).get("fzr"));//负责人

		request.setAttribute("xmjd", list.get(0).get("xmjd"));//项目阶段

		request.setAttribute("gs", list.get(0).get("gs"));//概述

		request.setAttribute("lxsj", list.get(0).get("lxsj"));//立项时间

		request.setAttribute("js", list.get(0).get("js"));//介绍

		request.setAttribute("yh", list.get(0).get("yh"));//用户

		request.setAttribute("zt", list.get(0).get("zt"));//状态
		request.setAttribute("fj", list.get(0).get("fj"));//状态
		return "xiangmu/xiangmudetail";
	}
	
	/**
	 * 查询xiangmu信息
	 */
	@RequestMapping(value="/selectall")
	public String selectall(Integer id,Map<String,Object> map,HttpServletRequest request){
		List<Map<String,Object>> list= new  ArrayList<Map<String,Object>>();
	Map<String,Object> map1= new HashMap<String,Object>();
		list=xiangmudao.selectAll(map1);
		System.out.println("listsize="+list.size());
		
		map.put("mylist", list);
		return "xiangmu/xiangmulist";
	}
	
	/**
	 * 查询xiangmu信息
	 */
	@RequestMapping(value="/myselectall")
	public String myselectall(Integer id,Map<String,Object> map,HttpServletRequest request){
		List<Map<String,Object>> list= new  ArrayList<Map<String,Object>>();
	Map<String,Object> map1= new HashMap<String,Object>();
String qx="",yhm="";
	
	if(request.getSession().getAttribute("yhm")!=null){
		qx=request.getSession().getAttribute("qx").toString();
		yhm=request.getSession().getAttribute("yhm").toString();
		if(!qx.equals("管理员"))
		map1.put("yhm", yhm);//标题
	}
	
	String xmmc=(String)request.getParameter("xmmc");
	System.out.println("xmmc="+xmmc);
	if(xmmc!=null&&!xmmc.equals("")){
		
		map1.put("xmmc", xmmc);//标题
	}
		list=xiangmudao.selectAll(map1);
		System.out.println("listsize="+list.size());
		
		map.put("mylist", list);
		return "xiangmu/xiangmumylist";
	}
}
