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
@RequestMapping(value="/leixing")
public class leixingAction {
	/**
	 * 自动注入业务逻辑层，注入方式使用了注解自动注入
	 */

	@Resource leixingDao leixingdao;
	@RequestMapping(value="/addPage")
	public String addPage(leixing leixing,HttpServletRequest request){
		Map<String,Object> map= new HashMap<String,Object>();
		
		System.out.println("addPageok");
		return "leixing/leixingadd";
	}
	
	@RequestMapping(value="/add")
	public String add(leixing leixing,HttpServletRequest request){
		Map<String,Object> map= new HashMap<String,Object>();
		//String name=(String)request.getParameter("name");

		map.put("lxid", leixing.getLxid());//类型编号

		map.put("lx", leixing.getLx());//类型

		leixingdao.save(map);
		
		
		request.setAttribute("msg", "<script>alert('添加成功');</script>");
		System.out.println("addok");
		return "leixing/leixingadd";
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
		leixingdao.del(id);
		return selectall(null,map,request);
	}
	/**
	 * 修改leixing信息
	 */
	@RequestMapping(value="/update")
	public String update(leixing leixing,HttpServletRequest request,Map<String,Object> map1){
		Map<String,Object> map= new HashMap<String,Object>();
		map.put("lxid", leixing.getLxid());//类型编号

		map.put("lx", leixing.getLx());//类型

		request.setAttribute("msg", "<script>alert('修改成功');</script>");
		leixingdao.update(map);
		return selectall(null,map1,request);
	}
	/**
	 * 查询leixing信息
	 */
	@RequestMapping(value="/modify")
	public String modify(Integer id,Map<String,Object> map,HttpServletRequest request){
		String keyid=(String)request.getParameter("keyid");
		List<Map<String,Object>> list= new  ArrayList<Map<String,Object>>();
		list=leixingdao.select(Integer.parseInt(keyid));
		request.setAttribute("lxid", list.get(0).get("lxid"));//类型编号

		request.setAttribute("lx", list.get(0).get("lx"));//类型

		
		return "leixing/leixingmodify";
	}
	
	@RequestMapping(value="/detail")
	public String detail(Integer id,Map<String,Object> map,HttpServletRequest request){
		String keyid=(String)request.getParameter("keyid");
		List<Map<String,Object>> list= new  ArrayList<Map<String,Object>>();
		list=leixingdao.select(Integer.parseInt(keyid));
		request.setAttribute("lxid", list.get(0).get("lxid"));//类型编号

		request.setAttribute("lx", list.get(0).get("lx"));//类型

		return "leixing/leixingdetail";
	}
	
	/**
	 * 查询leixing信息
	 */
	@RequestMapping(value="/selectall")
	public String selectall(Integer id,Map<String,Object> map,HttpServletRequest request){
		List<Map<String,Object>> list= new  ArrayList<Map<String,Object>>();
	Map<String,Object> map1= new HashMap<String,Object>();
		list=leixingdao.selectAll(map1);
		System.out.println("listsize="+list.size());
		
		map.put("mylist", list);
		return "leixing/leixinglist";
	}
}
