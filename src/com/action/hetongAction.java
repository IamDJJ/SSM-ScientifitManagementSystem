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
import com.util.StaticMethod;
@Controller
@RequestMapping(value="/hetong")
public class hetongAction {
	/**
	 * 自动注入业务逻辑层，注入方式使用了注解自动注入
	 */

	@Resource hetongDao hetongdao;
	@RequestMapping(value="/addPage")
	public String addPage(hetong hetong,HttpServletRequest request){
		Map<String,Object> map= new HashMap<String,Object>();
		
		System.out.println("addPageok");
		return "hetong/hetongadd";
	}
	
	@RequestMapping(value="/add")
	public String add(hetong hetong,HttpServletRequest request){
		Map<String,Object> map= new HashMap<String,Object>();
		//String name=(String)request.getParameter("name");

		map.put("htid", hetong.getHtid());//合同编号

		map.put("htbt", hetong.getHtbt());//合同标题

		map.put("htbh", hetong.getHtbh());//合同编号

		map.put("htnr", hetong.getHtnr());//合同内容

		map.put("qcsj", hetong.getQcsj());//起草时间

		map.put("qcr", hetong.getQcr());//起草人

		map.put("jf", hetong.getJf());//甲方

		map.put("jflxfs", hetong.getJflxfs());//甲方联系方式

		map.put("yf", hetong.getYf());//乙方

		map.put("yflxfs", hetong.getYflxfs());//乙方联系方式

		map.put("zt", hetong.getZt());//状态
		
		map.put("fj", hetong.getFj());//状态

		hetongdao.save(map);
		
		
		request.setAttribute("msg", "<script>alert('添加成功');</script>");
		System.out.println("addok");
		return "hetong/hetongadd";
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
		hetongdao.del(id);
		return selectall(null,map,request);
	}
	/**
	 * 修改hetong信息
	 */
	@RequestMapping(value="/update")
	public String update(hetong hetong,HttpServletRequest request,Map<String,Object> map1){
		Map<String,Object> map= new HashMap<String,Object>();
		map.put("htid", hetong.getHtid());//合同编号

		map.put("htbt", hetong.getHtbt());//合同标题

		map.put("htbh", hetong.getHtbh());//合同编号

		map.put("htnr", hetong.getHtnr());//合同内容

		map.put("qcsj", hetong.getQcsj());//起草时间

		map.put("qcr", hetong.getQcr());//起草人

		map.put("jf", hetong.getJf());//甲方

		map.put("jflxfs", hetong.getJflxfs());//甲方联系方式

		map.put("yf", hetong.getYf());//乙方

		map.put("yflxfs", hetong.getYflxfs());//乙方联系方式

		map.put("zt", hetong.getZt());//状态

		
		map.put("fj", hetong.getFj());//状态
		request.setAttribute("msg", "<script>alert('修改成功');</script>");
		hetongdao.update(map);
		return selectall(null,map1,request);
	}
	/**
	 * 查询hetong信息
	 */
	@RequestMapping(value="/modify")
	public String modify(Integer id,Map<String,Object> map,HttpServletRequest request){
		String keyid=(String)request.getParameter("keyid");
		List<Map<String,Object>> list= new  ArrayList<Map<String,Object>>();
		list=hetongdao.select(Integer.parseInt(keyid));
		request.setAttribute("htid", list.get(0).get("htid"));//合同编号

		request.setAttribute("htbt", list.get(0).get("htbt"));//合同标题

		request.setAttribute("htbh", list.get(0).get("htbh"));//合同编号

		request.setAttribute("htnr", list.get(0).get("htnr"));//合同内容

		request.setAttribute("qcsj", list.get(0).get("qcsj"));//起草时间

		request.setAttribute("qcr", list.get(0).get("qcr"));//起草人

		request.setAttribute("jf", list.get(0).get("jf"));//甲方

		request.setAttribute("jflxfs", list.get(0).get("jflxfs"));//甲方联系方式

		request.setAttribute("yf", list.get(0).get("yf"));//乙方

		request.setAttribute("yflxfs", list.get(0).get("yflxfs"));//乙方联系方式

		request.setAttribute("zt", list.get(0).get("zt"));//状态
		request.setAttribute("fj", list.get(0).get("fj"));//状态
		
		return "hetong/hetongmodify";
	}
	
	
	/**
	 * 修改hetong信息
	 */
	@RequestMapping(value="/updatea")
	public String updatea(hetong hetong,HttpServletRequest request,Map<String,Object> map1){
		Map<String,Object> map= new HashMap<String,Object>();
		map.put("htid", hetong.getHtid());//合同编号

		map.put("htbt", hetong.getHtbt());//合同标题

		map.put("htbh", hetong.getHtbh());//合同编号

		map.put("htnr", hetong.getHtnr());//合同内容

		map.put("qcsj", hetong.getQcsj());//起草时间

		map.put("qcr", hetong.getQcr());//起草人

		map.put("jf", hetong.getJf());//甲方

		map.put("jflxfs", hetong.getJflxfs());//甲方联系方式

		map.put("yf", hetong.getYf());//乙方

		map.put("yflxfs", hetong.getYflxfs());//乙方联系方式

		map.put("fj", hetong.getFj());//乙方联系方式
		String zt=hetong.getZt();
		
		
		String bgjl=(String)request.getParameter("bgjl");
		DBO db=new DBO();
		String sql="";
		try{
		if(zt.equals("未审核")){
		//只记录 变更情况，此种情况不需要 对变更记录审核 继续操作
			
			map.put("zt", hetong.getZt());//状态 //状态
			
			 sql="insert into htbg(htbh,bgsmbgr,sj,zt) values('"+hetong.getHtbh()+"','"+bgjl+"','"+StaticMethod.getStringDate()+"','通过')";//未审批过的不需要审核，直接默认 通过
			
		}else{
			//如果已经审核过了那么 会对 原来合同信息不进行审核了，需要对变更记录信息审核，审核通过了，才能对生效合同记录
			map.put("zt", "变更未审核");//状态 //状态
			 sql="insert into htbg(htbh,bgsmbgr,sj,zt) values('"+hetong.getHtbh()+"','"+bgjl+"','"+StaticMethod.getStringDate()+"','未审核')";//直接对变更记录审批信息审核，但是不能对合同审核了
		}
		
		db.update(sql);
		}catch(Exception e){
			e.printStackTrace();
		}
		
		
		

		request.setAttribute("msg", "<script>alert('修改成功');</script>");
		hetongdao.update(map);
		return myselectall(null,map1,request);
	}
	/**
	 * 查询hetong信息
	 */
	@RequestMapping(value="/modifya")
	public String modifya(Integer id,Map<String,Object> map,HttpServletRequest request){
		String keyid=(String)request.getParameter("keyid");
		List<Map<String,Object>> list= new  ArrayList<Map<String,Object>>();
		list=hetongdao.select(Integer.parseInt(keyid));
		request.setAttribute("htid", list.get(0).get("htid"));//合同编号

		request.setAttribute("htbt", list.get(0).get("htbt"));//合同标题

		request.setAttribute("htbh", list.get(0).get("htbh"));//合同编号

		request.setAttribute("htnr", list.get(0).get("htnr"));//合同内容

		request.setAttribute("qcsj", list.get(0).get("qcsj"));//起草时间

		request.setAttribute("qcr", list.get(0).get("qcr"));//起草人

		request.setAttribute("jf", list.get(0).get("jf"));//甲方

		request.setAttribute("jflxfs", list.get(0).get("jflxfs"));//甲方联系方式

		request.setAttribute("yf", list.get(0).get("yf"));//乙方

		request.setAttribute("yflxfs", list.get(0).get("yflxfs"));//乙方联系方式

		request.setAttribute("zt", list.get(0).get("zt"));//状态
		request.setAttribute("fj", list.get(0).get("fj"));//状态
		
		return "hetong/modify";
	}
	
	@RequestMapping(value="/detail")
	public String detail(Integer id,Map<String,Object> map,HttpServletRequest request){
		String keyid=(String)request.getParameter("keyid");
		List<Map<String,Object>> list= new  ArrayList<Map<String,Object>>();
		list=hetongdao.select(Integer.parseInt(keyid));
		request.setAttribute("htid", list.get(0).get("htid"));//合同编号
		request.setAttribute("keyid", keyid);//合同编号
		request.setAttribute("htbt", list.get(0).get("htbt"));//合同标题

		request.setAttribute("htbh", list.get(0).get("htbh"));//合同编号

		request.setAttribute("htnr", list.get(0).get("htnr"));//合同内容

		request.setAttribute("qcsj", list.get(0).get("qcsj"));//起草时间

		request.setAttribute("qcr", list.get(0).get("qcr"));//起草人

		request.setAttribute("jf", list.get(0).get("jf"));//甲方

		request.setAttribute("jflxfs", list.get(0).get("jflxfs"));//甲方联系方式

		request.setAttribute("yf", list.get(0).get("yf"));//乙方

		request.setAttribute("yflxfs", list.get(0).get("yflxfs"));//乙方联系方式

		request.setAttribute("zt", list.get(0).get("zt"));//状态
		request.setAttribute("fj", list.get(0).get("fj"));//状态
		return "hetong/hetongdetail";
	}
	
	/**
	 * 查询hetong信息
	 */
	@RequestMapping(value="/selectall")
	public String selectall(Integer id,Map<String,Object> map,HttpServletRequest request){
		List<Map<String,Object>> list= new  ArrayList<Map<String,Object>>();
	Map<String,Object> map1= new HashMap<String,Object>();
		list=hetongdao.selectAll(map1);
		System.out.println("listsize="+list.size());
		
		map.put("mylist", list);
		return "hetong/hetonglist";
	}
	
	
	/**
	 * 查询hetong信息
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
	
	String htmc=(String)request.getParameter("htmc");
	System.out.println("htmc="+htmc);
	if(htmc!=null&&!htmc.equals("")){
		
		map1.put("htmc", htmc);//标题
	}
	
		list=hetongdao.selectAll(map1);
		System.out.println("listsize11="+list.size());
		
		map.put("mylist", list);
		return "hetong/hetongmylist";
	}
}
