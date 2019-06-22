package zhl.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import zhl.entity.Collectiontable;

public interface CollectiontabledDaoI {  
	
	/**
	 * 用户的个人所有收藏
	 * @param u_id
	 * @return
	 */
	public List<Collectiontable> userCollection(int u_id);
	
	
	/**
	 * 用户将图书加入到收藏
	 * @param c
	 * @return
	 */
	public int addCollection(Collectiontable c);
	
	
	/**
	 * 用户将收藏图书删除
	 * @param u_id
	 * @param b_id
	 * @return
	 */
	public int delCollection(int c_id);

}
