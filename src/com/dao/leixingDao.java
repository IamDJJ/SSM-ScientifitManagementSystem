package com.dao;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("leixingDao")
public class leixingDao {
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	/**
	 * 保存leixing信息
	 * @param map
	 */
	public void save(Map<String, Object> map) {
		sqlSession.insert("com.leixing.insertleixing", map);
		
	}
	/**
	 * 删除aa
	 * @param id
	 */
	public void del(Integer id) {
		sqlSession.delete("com.leixing.delleixing", id);
	}

	/**
	 * 修改leixing信息
	 * @param map
	 */
	public void update(Map<String, Object> map) {
		sqlSession.update("com.leixing.updateleixing", map);
	}

	/**
	 * 查询leixing信息
	 * @param id
	 * @return 
	 */
	public List<Map<String, Object>> select(Integer id) {
		return sqlSession.selectList("com.leixing.selectleixing", id) ; 
	}
	/**
	 * 查询leixing信息
	 * 
	 * @return 
	 */
	public List<Map<String, Object>> selectAll(Map<String, Object> map) {
		return sqlSession.selectList("com.leixing.selectall", map) ; 
	}

}
