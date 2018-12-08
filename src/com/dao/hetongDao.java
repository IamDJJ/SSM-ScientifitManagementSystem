package com.dao;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("hetongDao")
public class hetongDao {
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	/**
	 * 保存hetong信息
	 * @param map
	 */
	public void save(Map<String, Object> map) {
		sqlSession.insert("com.hetong.inserthetong", map);
		
	}
	/**
	 * 删除aa
	 * @param id
	 */
	public void del(Integer id) {
		sqlSession.delete("com.hetong.delhetong", id);
	}

	/**
	 * 修改hetong信息
	 * @param map
	 */
	public void update(Map<String, Object> map) {
		sqlSession.update("com.hetong.updatehetong", map);
	}

	/**
	 * 查询hetong信息
	 * @param id
	 * @return 
	 */
	public List<Map<String, Object>> select(Integer id) {
		return sqlSession.selectList("com.hetong.selecthetong", id) ; 
	}
	/**
	 * 查询hetong信息
	 * 
	 * @return 
	 */
	public List<Map<String, Object>> selectAll(Map<String, Object> map) {
		return sqlSession.selectList("com.hetong.selectall", map) ; 
	}

}
