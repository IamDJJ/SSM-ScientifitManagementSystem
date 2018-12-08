package com.dao;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("xmzjDao")
public class xmzjDao {
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	/**
	 * 保存xmzj信息
	 * @param map
	 */
	public void save(Map<String, Object> map) {
		sqlSession.insert("com.xmzj.insertxmzj", map);
		
	}
	/**
	 * 删除aa
	 * @param id
	 */
	public void del(Integer id) {
		sqlSession.delete("com.xmzj.delxmzj", id);
	}

	/**
	 * 修改xmzj信息
	 * @param map
	 */
	public void update(Map<String, Object> map) {
		sqlSession.update("com.xmzj.updatexmzj", map);
	}

	/**
	 * 查询xmzj信息
	 * @param id
	 * @return 
	 */
	public List<Map<String, Object>> select(Integer id) {
		return sqlSession.selectList("com.xmzj.selectxmzj", id) ; 
	}
	/**
	 * 查询xmzj信息
	 * 
	 * @return 
	 */
	public List<Map<String, Object>> selectAll(Map<String, Object> map) {
		return sqlSession.selectList("com.xmzj.selectall", map) ; 
	}

}
