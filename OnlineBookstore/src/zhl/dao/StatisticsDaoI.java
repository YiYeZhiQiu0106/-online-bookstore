package zhl.dao;

import java.util.List;

import zhl.entity.Statistics;

public interface StatisticsDaoI {
	
	/**
	 * 获取所有的销量表
	 * @return
	 */
	public List<Statistics> getAllStatistics();
	
	
	/**
	 * 全网热销(所有图书销量前4)
	 * @return
	 */
	public List<Statistics> getOrderDesc();
	
	/**
	 * 各个分类中销量前6
	 * @return
	 */
	public List<Statistics> getTypeDesc(String type);
	
	
	/**
	 * 最新出版时间前4  (新书推荐 )
	 * @return
	 */
	public List<Statistics> getTimeDesc();
	
	/**
	 * 查询一本书的销量
	 * @param b_id
	 * @return
	 */
	public int bookOrder(int b_id);
	
	/**
	 * 查询收藏量
	 * @param b_id
	 * @return
	 */
	public int collNum(int b_id);
	
	/**
	 * 销量+1 -1
	 * @param b_id
	 * @param num
	 * @return
	 */
	public int upOrderNum(int b_id,int num);
	
	/**
	 * 评论量+1 -1
	 * @param b_id
	 * @param num
	 * @return
	 */
	public int upEvaNum(int b_id,int num);
	
	/**
	 * 收藏量+1 -1
	 * @param b_id
	 * @param num
	 * @return
	 */
	public int upCollNum(int b_id,int num);

}
