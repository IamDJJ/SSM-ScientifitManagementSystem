package com.action;
import java.sql.ResultSet;
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
import com.util.StaticMethod;
@Controller
@RequestMapping(value="/gly")
public class glyAction {
	/**
	 * 自动注入业务逻辑层，注入方式使用了注解自动注入
	 */

	@Resource glyDao glydao;
	@RequestMapping(value="/addPage")
	public String addPage(gly gly,HttpServletRequest request){
		Map<String,Object> map= new HashMap<String,Object>();
		
		System.out.println("addPageok");
		return "gly/glyadd";
	}
	
	@RequestMapping(value="/add")
	public String add(gly gly,HttpServletRequest request){
		Map<String,Object> map= new HashMap<String,Object>();
		//String name=(String)request.getParameter("name");

		map.put("glyid", gly.getGlyid());//管理员编号

		map.put("yhm", gly.getYhm());//用户名

		map.put("mm", StaticMethod.MD5(gly.getMm()));//密码

		map.put("xm", gly.getXm());//姓名

		
		
		
		String sql="select count(1) as num from gly where yhm='"+gly.getYhm()+"'";
		ResultSet rs=null;
		int a=0;
		DBO db=new DBO();
		try{
			rs=db.query(sql);
			if(rs.next()){
				a=rs.getInt("num");
				
			}
			
			if(a==0){
				
				glydao.save(map);
				
				
				request.setAttribute("msg", "<script>alert('添加成功');</script>");
			}else{
				
				
				request.setAttribute("msg", "<script>alert('添加失败、用户名重复');</script>");
			}
			
		}catch(Exception e){
			e.printStackTrace();
		}
		
		
		
		//request.setAttribute("msg", "<script>alert('添加成功');</script>");
		System.out.println("addok");
		return "gly/glyadd";
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
		glydao.del(id);
		return selectall(null,map,request);
	}
	/**
	 * 修改gly信息
	 */
	@RequestMapping(value="/update")
	public String update(gly gly,HttpServletRequest request,Map<String,Object> map1){
		Map<String,Object> map= new HashMap<String,Object>();
		map.put("glyid", gly.getGlyid());//管理员编号

		map.put("yhm", gly.getYhm());//用户名

		map.put("mm", gly.getMm());//密码

		map.put("xm", gly.getXm());//姓名

		request.setAttribute("msg", "<script>alert('修改成功');</script>");
		glydao.update(map);
		return selectall(null,map1,request);
	}
	/**
	 * 查询gly信息
	 */
	@RequestMapping(value="/modify")
	public String modify(Integer id,Map<String,Object> map,HttpServletRequest request){
		String keyid=(String)request.getParameter("keyid");
		List<Map<String,Object>> list= new  ArrayList<Map<String,Object>>();
		list=glydao.select(Integer.parseInt(keyid));
		request.setAttribute("glyid", list.get(0).get("glyid"));//管理员编号

		request.setAttribute("yhm", list.get(0).get("yhm"));//用户名

		request.setAttribute("mm", list.get(0).get("mm"));//密码

		request.setAttribute("xm", list.get(0).get("xm"));//姓名

		
		return "gly/glymodify";
	}
	
	@RequestMapping(value="/detail")
	public String detail(Integer id,Map<String,Object> map,HttpServletRequest request){
		String keyid=(String)request.getParameter("keyid");
		List<Map<String,Object>> list= new  ArrayList<Map<String,Object>>();
		list=glydao.select(Integer.parseInt(keyid));
		request.setAttribute("glyid", list.get(0).get("glyid"));//管理员编号

		request.setAttribute("yhm", list.get(0).get("yhm"));//用户名

		request.setAttribute("mm", list.get(0).get("mm"));//密码

		request.setAttribute("xm", list.get(0).get("xm"));//姓名

		return "gly/glydetail";
	}
	
	/**
	 * 查询gly信息
	 */
	@RequestMapping(value="/selectall")
	public String selectall(Integer id,Map<String,Object> map,HttpServletRequest request){
		List<Map<String,Object>> list= new  ArrayList<Map<String,Object>>();
	Map<String,Object> map1= new HashMap<String,Object>();
		list=glydao.selectAll(map1);
		System.out.println("listsize="+list.size());
		
		map.put("mylist", list);
		return "gly/glylist";
	}
}
