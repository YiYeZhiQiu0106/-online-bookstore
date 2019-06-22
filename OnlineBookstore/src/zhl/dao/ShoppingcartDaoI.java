package zhl.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import zhl.entity.Shoppingcart;

public interface ShoppingcartDaoI {
	/**
	 * 同一本图书是否已存在
	 * @param u_id
	 * @param b_id
	 * @return
	 */
	public int isOneBook(int u_id,int b_id);
	
	/**
	 * 添加商品到购物车
	 * @param shoppingcart
	 * @return
	 */
	public int addCat(Shoppingcart shoppingcart);
	
	/**
	 * 查询用户购物车记录的条数 
	 * @param u_id
	 * @return
	 */
	public int shopCount(int u_id);
	
    /**
     * 我的购物车
     * @return
     */
	public List<Shoppingcart> getShopCat(int u_id);
	
	
	/**
     * 我的购物车  状态为1的(选中状态的)
     * @return
     */
	public List<Shoppingcart> getShopCat1(int u_id);
	
	/**
	 * 选择状态
	 * @param u_id
	 * @param b_id
	 * @param statis
	 * @return
	 */
	public int upStatis(int u_id,int b_id,int statis);
	
	/**
	 * 修改数量
	 * @param u_id
	 * @param b_id
	 * @param num
	 * @return
	 */
	public int upNum(int u_id,int b_id,int num);
	
	/**
	 * 删除一个
	 * @param u_id
	 * @param b_id
	 * @return
	 */
	public int delShop(int u_id,int b_id);
	
	/**
	 * 计算总价
	 * @param u_id
	 * @return
	 */
	public float reporter(int u_id);
	
	/**
	 * 修改小计
	 * @param u_id
	 * @param b_id
	 * @param rep
	 * @return
	 */
	public int upRep(int u_id,int b_id,float rep);
}
