package zhl.dao;

import java.util.List;

import zhl.entity.Statistics;

public interface StatisticsDaoI {
	
	/**
	 * ��ȡ���е�������
	 * @return
	 */
	public List<Statistics> getAllStatistics();
	
	
	/**
	 * ȫ������(����ͼ������ǰ4)
	 * @return
	 */
	public List<Statistics> getOrderDesc();
	
	/**
	 * ��������������ǰ6
	 * @return
	 */
	public List<Statistics> getTypeDesc(String type);
	
	
	/**
	 * ���³���ʱ��ǰ4  (�����Ƽ� )
	 * @return
	 */
	public List<Statistics> getTimeDesc();
	
	/**
	 * ��ѯһ���������
	 * @param b_id
	 * @return
	 */
	public int bookOrder(int b_id);
	
	/**
	 * ��ѯ�ղ���
	 * @param b_id
	 * @return
	 */
	public int collNum(int b_id);
	
	/**
	 * ����+1 -1
	 * @param b_id
	 * @param num
	 * @return
	 */
	public int upOrderNum(int b_id,int num);
	
	/**
	 * ������+1 -1
	 * @param b_id
	 * @param num
	 * @return
	 */
	public int upEvaNum(int b_id,int num);
	
	/**
	 * �ղ���+1 -1
	 * @param b_id
	 * @param num
	 * @return
	 */
	public int upCollNum(int b_id,int num);

}
