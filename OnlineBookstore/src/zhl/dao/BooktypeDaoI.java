package zhl.dao;


import java.util.List;

import org.springframework.stereotype.Repository;

import zhl.entity.Booktype;
import zhl.entity.Users;

public interface BooktypeDaoI {
	/**
	 * 查询所有类型
	 * @return
	 */
	public List<Booktype> getAllType();
	
	/**
	 * 添加一种类型
	 * @param booktype
	 * @return
	 */
	public int addType(Booktype booktype);
	
	/**
	 * 删除类型
	 * @param bt_id
	 * @return
	 */
	public int deleteType(int bt_id);
	
	/**
	 * 修改
	 * @param booktype
	 * @return
	 */
	public int updateType(Booktype booktype);
	
	/**
	 * 判断一种类型是否存在
	 * @param bt_name
	 * @return
	 */
	public int oneType(String bt_name);
	
	/**
	   * 类型名模糊查询
	   * @param name
	   * @return
	   */
	  public List<Booktype> dimName(String name);
		

}
