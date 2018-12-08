package com.dao;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("glyDao")
public class glyDao {
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	/**
	 * 保存gly信息
	 * @param map
	 */
	public void save(Map<String, Object> map) {
		sqlSession.insert("com.gly.insertgly", map);
		
	}
	/**
	 * 删除aa
	 * @param id
	 */
	public void del(Integer id) {
		sqlSession.delete("com.gly.delgly", id);
	}

	/**
	 * 修改gly信息
	 * @param map
	 */
	public void update(Map<String, Object> map) {
		sqlSession.update("com.gly.updategly", map);
	}

	/**
	 * 查询gly信息
	 * @param id
	 * @return 
	 */
	public List<Map<String, Object>> select(Integer id) {
		return sqlSession.selectList("com.gly.selectgly", id) ; 
	}
	/**
	 * 查询gly信息
	 * 
	 * @return 
	 */
	public List<Map<String, Object>> selectAll(Map<String, Object> map) {
		return sqlSession.selectList("com.gly.selectall", map) ; 
	}

}
