package zhl.service;

import java.util.List;

import zhl.entity.Collectiontable;

public interface CollectiontableServiceI {
	
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
	public boolean addCollection(Collectiontable c);
	
	
	/**
	 * 用户将收藏图书删除
	 * @param u_id
	 * @param b_id
	 * @return
	 */
	public boolean delCollection(int c_id);

}
