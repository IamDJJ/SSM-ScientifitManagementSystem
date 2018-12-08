package com.dao;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("xmbgDao")
public class xmbgDao {
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	/**
	 * 保存xmbg信息
	 * @param map
	 */
	public void save(Map<String, Object> map) {
		sqlSession.insert("com.xmbg.insertxmbg", map);
		
	}
	/**
	 * 删除aa
	 * @param id
	 */
	public void del(Integer id) {
		sqlSession.delete("com.xmbg.delxmbg", id);
	}

	/**
	 * 修改xmbg信息
	 * @param map
	 */
	public void update(Map<String, Object> map) {
		sqlSession.update("com.xmbg.updatexmbg", map);
	}

	/**
	 * 查询xmbg信息
	 * @param id
	 * @return 
	 */
	public List<Map<String, Object>> select(Integer id) {
		return sqlSession.selectList("com.xmbg.selectxmbg", id) ; 
	}
	/**
	 * 查询xmbg信息
	 * 
	 * @return 
	 */
	public List<Map<String, Object>> selectAll(Map<String, Object> map) {
		return sqlSession.selectList("com.xmbg.selectall", map) ; 
	}

}
