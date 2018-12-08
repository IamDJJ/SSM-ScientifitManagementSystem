package com.dao;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("htbgDao")
public class htbgDao {
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	/**
	 * 保存htbg信息
	 * @param map
	 */
	public void save(Map<String, Object> map) {
		sqlSession.insert("com.htbg.inserthtbg", map);
		
	}
	/**
	 * 删除aa
	 * @param id
	 */
	public void del(Integer id) {
		sqlSession.delete("com.htbg.delhtbg", id);
	}

	/**
	 * 修改htbg信息
	 * @param map
	 */
	public void update(Map<String, Object> map) {
		sqlSession.update("com.htbg.updatehtbg", map);
	}

	/**
	 * 查询htbg信息
	 * @param id
	 * @return 
	 */
	public List<Map<String, Object>> select(Integer id) {
		return sqlSession.selectList("com.htbg.selecthtbg", id) ; 
	}
	/**
	 * 查询htbg信息
	 * 
	 * @return 
	 */
	public List<Map<String, Object>> selectAll(Map<String, Object> map) {
		return sqlSession.selectList("com.htbg.selectall", map) ; 
	}

}
