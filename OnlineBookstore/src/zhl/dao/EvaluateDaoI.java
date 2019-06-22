package zhl.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import zhl.entity.Evaluate;

public interface EvaluateDaoI {
	
	
	
	/**
	 * 后台显示状态为0(未通过审核的记录)查看的所有评论
	 * @return
	 */
	public List<Evaluate> getAllEva(int sta);
	
		
	/**
	 * 前台显示状态为1(通过审核的记录)查看(本图书)的所有评论
	 * @param b_id
	 * @return
	 */
	public List<Evaluate> getBookEva(int b_id);
	
	/**
	 * 用户查看自己发表过的评论 
	 * @param u_id
	 * @return
	 */
	public List<Evaluate> getUserEva(int u_id);
	
	/**
	 * 用户发表评论
	 * @param e
	 * @return
	 */
	public int addEva(Evaluate e);
	
	/**
	 * 删除评论
	 * @param e_id
	 * @return
	 */
	public int delEva(int e_id);
	
	/**
	 * 审核  修改状态
	 * @param e_id
	 * @param sta
	 * @return
	 */
	public int upEvaSta(int e_id,int sta);

}
