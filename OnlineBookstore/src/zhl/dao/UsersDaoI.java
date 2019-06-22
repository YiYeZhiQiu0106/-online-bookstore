package zhl.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import zhl.entity.Users;

public interface UsersDaoI {
	
	
	
	/**
	 * 查询所有用户
	 * @return
	 */
	  public List<Users> getAllUsers();
	  
	  /**
	   * 注册/添加 一个用户
	   * @param users
	   * @return
	   */
	  public int addUser(Users users);
	  
	  /**
	   * 删除/注销  一个用户
	   * @param id
	   * @return
	   */
	  public int delUser(int id);
	  
	  /**
	   * 修改用户信息
	   * @param users
	   * @return
	   */
	  public int updateUser(Users users);
	  
	  /**
	   * 唯一用户名
	   * @param name
	   * @return
	   */
	  public int oneName(String name);
	  
	  /**
	   * 唯一手机号	
	   * @param phone
	   * @return
	   */
	  public int onePhone(String phone);
	  
	  /**
	   * 登录
	   * @param users
	   * @return
	   */
	  public Users login(Users users);
	  
	  /**
	   * 用户名模糊查询
	   * @param name
	   * @return
	   */
	  public List<Users> dimName(String name);
	  
	  /**
	   * 用id查用户详情
	   * @param id
	   * @return
	   */
	  public Users oneUser(int id);

}
