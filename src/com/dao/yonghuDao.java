package com.dao;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("yonghuDao")
public class yonghuDao {
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	/**
	 * 保存yonghu信息
	 * @param map
	 */
	public void save(Map<String, Object> map) {
		sqlSession.insert("com.yonghu.insertyonghu", map);
		
	}
	/**
	 * 删除aa
	 * @param id
	 */
	public void del(Integer id) {
		sqlSession.delete("com.yonghu.delyonghu", id);
	}

	/**
	 * 修改yonghu信息
	 * @param map
	 */
	public void update(Map<String, Object> map) {
		sqlSession.update("com.yonghu.updateyonghu", map);
	}

	/**
	 * 查询yonghu信息
	 * @param id
	 * @return 
	 */
	public List<Map<String, Object>> select(Integer id) {
		return sqlSession.selectList("com.yonghu.selectyonghu", id) ; 
	}
	/**
	 * 查询yonghu信息
	 * 
	 * @return 
	 */
	public List<Map<String, Object>> selectAll(Map<String, Object> map) {
		return sqlSession.selectList("com.yonghu.selectall", map) ; 
	}

}
