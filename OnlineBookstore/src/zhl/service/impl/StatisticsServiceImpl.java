package zhl.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import zhl.dao.StatisticsDaoI;
import zhl.entity.Statistics;
import zhl.service.StatisticsServiceI;

@Service
public class StatisticsServiceImpl implements StatisticsServiceI{
	
	@Resource
	private StatisticsDaoI daoI;
	
	public List<Statistics> getOrderDesc() {
		return daoI.getOrderDesc();
	}

	public List<Statistics> getTypeDesc(String type) {
		return daoI.getTypeDesc(type);
	}

	public List<Statistics> getTimeDesc() {
		return daoI.getTimeDesc();
	}

	public int bookOrder(int b_id) {
		return daoI.bookOrder(b_id);
	}

	public int collNum(int b_id) {
		return daoI.collNum(b_id);
	}

	public int upOrderNum(int b_id, int num) {
		return daoI.upOrderNum(b_id, num);
	}

	public int upEvaNum(int b_id, int num) {
		return daoI.upEvaNum(b_id, num);
	}

	public int upCollNum(int b_id, int num) {
		return daoI.upCollNum(b_id, num);
	}

	public List<Statistics> getAllStatistics() {
		return daoI.getAllStatistics();
	}
	

}
