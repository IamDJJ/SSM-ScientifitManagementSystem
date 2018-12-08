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
@RequestMapping(value="/cqjb")
public class cqjbAction {
	/**
	 * 自动注入业务逻辑层，注入方式使用了注解自动注入
	 */

	@Resource cqjbDao cqjbdao;
	@RequestMapping(value="/addPage")
	public String addPage(cqjb cqjb,HttpServletRequest request){
		Map<String,Object> map= new HashMap<String,Object>();
		
		System.out.println("addPageok");
		return "cqjb/cqjbadd";
	}
	
	@RequestMapping(value="/add")
	public String add(cqjb cqjb,HttpServletRequest request){
		Map<String,Object> map= new HashMap<String,Object>();
		//String name=(String)request.getParameter("name");

		map.put("cqjbid", cqjb.getCqjbid());//产权级别编号

		map.put("jb", cqjb.getJb());//级别

		cqjbdao.save(map);
		
		
		request.setAttribute("msg", "<script>alert('添加成功');</script>");
		System.out.println("addok");
		return "cqjb/cqjbadd";
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
		cqjbdao.del(id);
		return selectall(null,map,request);
	}
	/**
	 * 修改cqjb信息
	 */
	@RequestMapping(value="/update")
	public String update(cqjb cqjb,HttpServletRequest request,Map<String,Object> map1){
		Map<String,Object> map= new HashMap<String,Object>();
		map.put("cqjbid", cqjb.getCqjbid());//产权级别编号

		map.put("jb", cqjb.getJb());//级别

		request.setAttribute("msg", "<script>alert('修改成功');</script>");
		cqjbdao.update(map);
		return selectall(null,map1,request);
	}
	/**
	 * 查询cqjb信息
	 */
	@RequestMapping(value="/modify")
	public String modify(Integer id,Map<String,Object> map,HttpServletRequest request){
		String keyid=(String)request.getParameter("keyid");
		List<Map<String,Object>> list= new  ArrayList<Map<String,Object>>();
		list=cqjbdao.select(Integer.parseInt(keyid));
		request.setAttribute("cqjbid", list.get(0).get("cqjbid"));//产权级别编号

		request.setAttribute("jb", list.get(0).get("jb"));//级别

		
		return "cqjb/cqjbmodify";
	}
	
	@RequestMapping(value="/detail")
	public String detail(Integer id,Map<String,Object> map,HttpServletRequest request){
		String keyid=(String)request.getParameter("keyid");
		List<Map<String,Object>> list= new  ArrayList<Map<String,Object>>();
		list=cqjbdao.select(Integer.parseInt(keyid));
		request.setAttribute("cqjbid", list.get(0).get("cqjbid"));//产权级别编号

		request.setAttribute("jb", list.get(0).get("jb"));//级别

		return "cqjb/cqjbdetail";
	}
	
	/**
	 * 查询cqjb信息
	 */
	@RequestMapping(value="/selectall")
	public String selectall(Integer id,Map<String,Object> map,HttpServletRequest request){
		List<Map<String,Object>> list= new  ArrayList<Map<String,Object>>();
	Map<String,Object> map1= new HashMap<String,Object>();
		list=cqjbdao.selectAll(map1);
		System.out.println("listsize="+list.size());
		
		map.put("mylist", list);
		return "cqjb/cqjblist";
	}
}
