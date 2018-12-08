package com.dao;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("xiangmuDao")
public class xiangmuDao {
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	/**
	 * 保存xiangmu信息
	 * @param map
	 */
	public void save(Map<String, Object> map) {
		sqlSession.insert("com.xiangmu.insertxiangmu", map);
		
	}
	/**
	 * 删除aa
	 * @param id
	 */
	public void del(Integer id) {
		sqlSession.delete("com.xiangmu.delxiangmu", id);
	}

	/**
	 * 修改xiangmu信息
	 * @param map
	 */
	public void update(Map<String, Object> map) {
		sqlSession.update("com.xiangmu.updatexiangmu", map);
	}

	/**
	 * 查询xiangmu信息
	 * @param id
	 * @return 
	 */
	public List<Map<String, Object>> select(Integer id) {
		return sqlSession.selectList("com.xiangmu.selectxiangmu", id) ; 
	}
	/**
	 * 查询xiangmu信息
	 * 
	 * @return 
	 */
	public List<Map<String, Object>> selectAll(Map<String, Object> map) {
		return sqlSession.selectList("com.xiangmu.selectall", map) ; 
	}

}
