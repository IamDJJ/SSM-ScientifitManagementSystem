package com.dao;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("zscqDao")
public class zscqDao {
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	/**
	 * 保存zscq信息
	 * @param map
	 */
	public void save(Map<String, Object> map) {
		sqlSession.insert("com.zscq.insertzscq", map);
		
	}
	/**
	 * 删除aa
	 * @param id
	 */
	public void del(Integer id) {
		sqlSession.delete("com.zscq.delzscq", id);
	}

	/**
	 * 修改zscq信息
	 * @param map
	 */
	public void update(Map<String, Object> map) {
		sqlSession.update("com.zscq.updatezscq", map);
	}

	/**
	 * 查询zscq信息
	 * @param id
	 * @return 
	 */
	public List<Map<String, Object>> select(Integer id) {
		return sqlSession.selectList("com.zscq.selectzscq", id) ; 
	}
	/**
	 * 查询zscq信息
	 * 
	 * @return 
	 */
	public List<Map<String, Object>> selectAll(Map<String, Object> map) {
		return sqlSession.selectList("com.zscq.selectall", map) ; 
	}

}
