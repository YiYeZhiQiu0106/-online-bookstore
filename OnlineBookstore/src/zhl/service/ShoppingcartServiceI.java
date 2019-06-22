package zhl.service;

import java.util.List;

import zhl.entity.Shoppingcart;

public interface ShoppingcartServiceI {
	/**
	 * ͬһ��ͼ���Ƿ��Ѵ���
	 * @param u_id
	 * @param b_id
	 * @return
	 */
	public boolean isOneBook(int u_id,int b_id);
	
	/**
	 * �����Ʒ�����ﳵ
	 * @param shoppingcart
	 * @return
	 */
	public boolean addCat(Shoppingcart shoppingcart);
	
	/**
	 * ��ѯ�û����ﳵ��¼������ 
	 * @param u_id
	 * @return
	 */
	public int shopCount(int u_id);
	
	/**
     * �ҵĹ��ﳵ  ״̬Ϊ1��(ѡ��״̬��)
     * @return
     */
	public List<Shoppingcart> getShopCat1(int u_id);
	
	/**
	 * 
	 * @param u_id
	 * @param b_id
	 * @param rep
	 * @return
	 */
	public int upRep(int u_id,int b_id,float rep);
	
	/**
	 * �����ܼ�
	 * @param u_id
	 * @return
	 */
	public float reporter(int u_id);
	
	/**
     * �ҵĹ��ﳵ
     * @return
     */
	public List<Shoppingcart> getShopCat(int u_id);
	
	/**
	 * ѡ��״̬
	 * @param u_id
	 * @param b_id
	 * @param statis
	 * @return
	 */
	public boolean upStatis(int u_id,int b_id,int statis);
	
	/**
	 * �޸�����
	 * @param u_id
	 * @param b_id
	 * @param num
	 * @return
	 */
	public boolean upNum(int u_id,int b_id,int num);
	
	/**
	 * ɾ��һ��
	 * @param u_id
	 * @param b_id
	 * @return
	 */
	public boolean delShop(int u_id,int b_id);

}
