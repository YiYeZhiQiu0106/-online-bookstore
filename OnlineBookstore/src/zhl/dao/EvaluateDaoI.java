package zhl.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import zhl.entity.Evaluate;

public interface EvaluateDaoI {
	
	
	
	/**
	 * ��̨��ʾ״̬Ϊ0(δͨ����˵ļ�¼)�鿴����������
	 * @return
	 */
	public List<Evaluate> getAllEva(int sta);
	
		
	/**
	 * ǰ̨��ʾ״̬Ϊ1(ͨ����˵ļ�¼)�鿴(��ͼ��)����������
	 * @param b_id
	 * @return
	 */
	public List<Evaluate> getBookEva(int b_id);
	
	/**
	 * �û��鿴�Լ������������ 
	 * @param u_id
	 * @return
	 */
	public List<Evaluate> getUserEva(int u_id);
	
	/**
	 * �û���������
	 * @param e
	 * @return
	 */
	public int addEva(Evaluate e);
	
	/**
	 * ɾ������
	 * @param e_id
	 * @return
	 */
	public int delEva(int e_id);
	
	/**
	 * ���  �޸�״̬
	 * @param e_id
	 * @param sta
	 * @return
	 */
	public int upEvaSta(int e_id,int sta);

}
