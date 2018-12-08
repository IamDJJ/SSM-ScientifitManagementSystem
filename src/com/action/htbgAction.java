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
@RequestMapping(value="/htbg")
public class htbgAction {
	/**
	 * 自动注入业务逻辑层，注入方式使用了注解自动注入
	 */

	@Resource htbgDao htbgdao;
	@RequestMapping(value="/addPage")
	public String addPage(htbg htbg,HttpServletRequest request){
		Map<String,Object> map= new HashMap<String,Object>();
		
		System.out.println("addPageok");
		return "htbg/htbgadd";
	}
	
	@RequestMapping(value="/add")
	public String add(htbg htbg,HttpServletRequest request){
		Map<String,Object> map= new HashMap<String,Object>();
		//String name=(String)request.getParameter("name");

		map.put("htbgid", htbg.getHtbgid());//合同变更编号

		map.put("htbh", htbg.getHtbh());//合同编号

		map.put("bgsmbgr", htbg.getBgsmbgr());//变更说明变更人

		map.put("sj", htbg.getSj());//时间

		map.put("zt", htbg.getZt());//状态

		htbgdao.save(map);
		
		
		request.setAttribute("msg", "<script>alert('添加成功');</script>");
		System.out.println("addok");
		return "htbg/htbgadd";
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
		htbgdao.del(id);
		return selectall(null,map,request);
	}
	/**
	 * 修改htbg信息
	 */
	@RequestMapping(value="/update")
	public String update(htbg htbg,HttpServletRequest request,Map<String,Object> map1){
		Map<String,Object> map= new HashMap<String,Object>();
		map.put("htbgid", htbg.getHtbgid());//合同变更编号

		map.put("htbh", htbg.getHtbh());//合同编号

		map.put("bgsmbgr", htbg.getBgsmbgr());//变更说明变更人

		map.put("sj", htbg.getSj());//时间

		map.put("zt", htbg.getZt());//状态
		
		String zt=(String)htbg.getZt();
		DBO db=new DBO();
		System.out.println("zt="+zt);
		
		
		String sql="";
		
		try{
			if(!zt.equals("未审核")){
				
				sql="update hetong set zt='"+zt+"' where htbh='"+htbg.getHtbh()+"'";
				System.out.println(sql);
				db.update(sql);
			}
			
		}catch(Exception e){
			e.printStackTrace();
			
		}
		request.setAttribute("msg", "<script>alert('修改成功');</script>");
		htbgdao.update(map);
		return selectall(null,map1,request);
	}
	/**
	 * 查询htbg信息
	 */
	@RequestMapping(value="/modify")
	public String modify(Integer id,Map<String,Object> map,HttpServletRequest request){
		String keyid=(String)request.getParameter("keyid");
		List<Map<String,Object>> list= new  ArrayList<Map<String,Object>>();
		list=htbgdao.select(Integer.parseInt(keyid));
		request.setAttribute("htbgid", list.get(0).get("htbgid"));//合同变更编号

		request.setAttribute("htbh", list.get(0).get("htbh"));//合同编号

		request.setAttribute("bgsmbgr", list.get(0).get("bgsmbgr"));//变更说明变更人

		request.setAttribute("sj", list.get(0).get("sj"));//时间

		request.setAttribute("zt", list.get(0).get("zt"));//状态
	
		
		
		
		
		return "htbg/htbgmodify";
	}
	
	@RequestMapping(value="/detail")
	public String detail(Integer id,Map<String,Object> map,HttpServletRequest request){
		String keyid=(String)request.getParameter("keyid");
		List<Map<String,Object>> list= new  ArrayList<Map<String,Object>>();
		list=htbgdao.select(Integer.parseInt(keyid));
		request.setAttribute("htbgid", list.get(0).get("htbgid"));//合同变更编号

		request.setAttribute("htbh", list.get(0).get("htbh"));//合同编号

		request.setAttribute("bgsmbgr", list.get(0).get("bgsmbgr"));//变更说明变更人

		request.setAttribute("sj", list.get(0).get("sj"));//时间

		request.setAttribute("zt", list.get(0).get("zt"));//状态

		return "htbg/htbgdetail";
	}
	
	/**
	 * 查询htbg信息
	 */
	@RequestMapping(value="/selectall")
	public String selectall(Integer id,Map<String,Object> map,HttpServletRequest request){
		List<Map<String,Object>> list= new  ArrayList<Map<String,Object>>();
	Map<String,Object> map1= new HashMap<String,Object>();
		list=htbgdao.selectAll(map1);
		System.out.println("listsize="+list.size());
		
		map.put("mylist", list);
		return "htbg/htbglist";
	}
}
