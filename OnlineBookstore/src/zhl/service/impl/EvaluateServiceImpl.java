package zhl.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import zhl.dao.EvaluateDaoI;
import zhl.entity.Evaluate;
import zhl.service.EvaluateServiceI;

@Service
public class EvaluateServiceImpl implements EvaluateServiceI{
	
	@Resource
	private EvaluateDaoI daoI;

	

	public List<Evaluate> getAllEva(int sta) {
		return daoI.getAllEva(sta);
	}

	

	public List<Evaluate> getBookEva(int b_id) {
		return daoI.getBookEva(b_id);
	}

	public List<Evaluate> getUserEva(int u_id) {
		return daoI.getUserEva(u_id);
	}

	public int addEva(Evaluate e) {
		return daoI.addEva(e);
	}

	public int delEva(int e_id) {
		return daoI.delEva(e_id);
	}

	public int upEvaSta(int e_id, int sta) {
		return daoI.upEvaSta(e_id, sta);
	}

}
