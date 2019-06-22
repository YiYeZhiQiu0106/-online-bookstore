package zhl.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import zhl.entity.Shoppingcart;

public interface ShoppingcartDaoI {
	/**
	 * ͬһ��ͼ���Ƿ��Ѵ���
	 * @param u_id
	 * @param b_id
	 * @return
	 */
	public int isOneBook(int u_id,int b_id);
	
	/**
	 * �����Ʒ�����ﳵ
	 * @param shoppingcart
	 * @return
	 */
	public int addCat(Shoppingcart shoppingcart);
	
	/**
	 * ��ѯ�û����ﳵ��¼������ 
	 * @param u_id
	 * @return
	 */
	public int shopCount(int u_id);
	
    /**
     * �ҵĹ��ﳵ
     * @return
     */
	public List<Shoppingcart> getShopCat(int u_id);
	
	
	/**
     * �ҵĹ��ﳵ  ״̬Ϊ1��(ѡ��״̬��)
     * @return
     */
	public List<Shoppingcart> getShopCat1(int u_id);
	
	/**
	 * ѡ��״̬
	 * @param u_id
	 * @param b_id
	 * @param statis
	 * @return
	 */
	public int upStatis(int u_id,int b_id,int statis);
	
	/**
	 * �޸�����
	 * @param u_id
	 * @param b_id
	 * @param num
	 * @return
	 */
	public int upNum(int u_id,int b_id,int num);
	
	/**
	 * ɾ��һ��
	 * @param u_id
	 * @param b_id
	 * @return
	 */
	public int delShop(int u_id,int b_id);
	
	/**
	 * �����ܼ�
	 * @param u_id
	 * @return
	 */
	public float reporter(int u_id);
	
	/**
	 * �޸�С��
	 * @param u_id
	 * @param b_id
	 * @param rep
	 * @return
	 */
	public int upRep(int u_id,int b_id,float rep);
}
