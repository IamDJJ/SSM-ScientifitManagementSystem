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
@RequestMapping(value="/zscq")
public class zscqAction {
	/**
	 * 自动注入业务逻辑层，注入方式使用了注解自动注入
	 */

	@Resource zscqDao zscqdao;
	@RequestMapping(value="/addPage")
	public String addPage(zscq zscq,HttpServletRequest request){
		Map<String,Object> map= new HashMap<String,Object>();
		
		System.out.println("addPageok");
		return "zscq/zscqadd";
	}
	
	@RequestMapping(value="/add")
	public String add(zscq zscq,HttpServletRequest request){
		Map<String,Object> map= new HashMap<String,Object>();
		//String name=(String)request.getParameter("name");

		map.put("zscqid", zscq.getZscqid());//知识产权编号

		map.put("cqmc", zscq.getCqmc());//产权名称

		map.put("lx", zscq.getLx());//类型

		map.put("fj", zscq.getFj());//附件

		map.put("nr", zscq.getNr());//内容

		map.put("cqjb", zscq.getCqjb());//产权级别

		map.put("ytcg", zscq.getYtcg());//依托成果

		map.put("djr", zscq.getDjr());//登记人

		map.put("djsj", zscq.getDjsj());//登记时间

		zscqdao.save(map);
		
		
		request.setAttribute("msg", "<script>alert('添加成功');</script>");
		System.out.println("addok");
		return "zscq/zscqadd";
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
		zscqdao.del(id);
		return selectall(null,map,request);
	}
	/**
	 * 修改zscq信息
	 */
	@RequestMapping(value="/update")
	public String update(zscq zscq,HttpServletRequest request,Map<String,Object> map1){
		Map<String,Object> map= new HashMap<String,Object>();
		map.put("zscqid", zscq.getZscqid());//知识产权编号

		map.put("cqmc", zscq.getCqmc());//产权名称

		map.put("lx", zscq.getLx());//类型

		map.put("fj", zscq.getFj());//附件

		map.put("nr", zscq.getNr());//内容

		map.put("cqjb", zscq.getCqjb());//产权级别

		map.put("ytcg", zscq.getYtcg());//依托成果

		map.put("djr", zscq.getDjr());//登记人

		map.put("djsj", zscq.getDjsj());//登记时间

		request.setAttribute("msg", "<script>alert('修改成功');</script>");
		zscqdao.update(map);
		return selectall(null,map1,request);
	}
	/**
	 * 查询zscq信息
	 */
	@RequestMapping(value="/modify")
	public String modify(Integer id,Map<String,Object> map,HttpServletRequest request){
		String keyid=(String)request.getParameter("keyid");
		List<Map<String,Object>> list= new  ArrayList<Map<String,Object>>();
		list=zscqdao.select(Integer.parseInt(keyid));
		request.setAttribute("zscqid", list.get(0).get("zscqid"));//知识产权编号

		request.setAttribute("cqmc", list.get(0).get("cqmc"));//产权名称

		request.setAttribute("lx", list.get(0).get("lx"));//类型

		request.setAttribute("fj", list.get(0).get("fj"));//附件

		request.setAttribute("nr", list.get(0).get("nr"));//内容

		request.setAttribute("cqjb", list.get(0).get("cqjb"));//产权级别

		request.setAttribute("ytcg", list.get(0).get("ytcg"));//依托成果

		request.setAttribute("djr", list.get(0).get("djr"));//登记人

		request.setAttribute("djsj", list.get(0).get("djsj"));//登记时间

		
		return "zscq/zscqmodify";
	}
	
	@RequestMapping(value="/detail")
	public String detail(Integer id,Map<String,Object> map,HttpServletRequest request){
		String keyid=(String)request.getParameter("keyid");
		List<Map<String,Object>> list= new  ArrayList<Map<String,Object>>();
		list=zscqdao.select(Integer.parseInt(keyid));
		request.setAttribute("zscqid", list.get(0).get("zscqid"));//知识产权编号

		request.setAttribute("cqmc", list.get(0).get("cqmc"));//产权名称

		request.setAttribute("lx", list.get(0).get("lx"));//类型

		request.setAttribute("fj", list.get(0).get("fj"));//附件

		request.setAttribute("nr", list.get(0).get("nr"));//内容

		request.setAttribute("cqjb", list.get(0).get("cqjb"));//产权级别

		request.setAttribute("ytcg", list.get(0).get("ytcg"));//依托成果

		request.setAttribute("djr", list.get(0).get("djr"));//登记人

		request.setAttribute("djsj", list.get(0).get("djsj"));//登记时间

		return "zscq/zscqdetail";
	}
	
	/**
	 * 查询zscq信息
	 */
	@RequestMapping(value="/selectall")
	public String selectall(Integer id,Map<String,Object> map,HttpServletRequest request){
		List<Map<String,Object>> list= new  ArrayList<Map<String,Object>>();
	Map<String,Object> map1= new HashMap<String,Object>();
		list=zscqdao.selectAll(map1);
		System.out.println("listsize="+list.size());
		String qx="",yhm="";
		
		if(request.getSession().getAttribute("yhm")!=null){
			qx=request.getSession().getAttribute("qx").toString();
			yhm=request.getSession().getAttribute("yhm").toString();
			if(!qx.equals("管理员"))
			map1.put("yhm", yhm);//标题
		}
		map.put("mylist", list);
		return "zscq/zscqlist";
	}
}
