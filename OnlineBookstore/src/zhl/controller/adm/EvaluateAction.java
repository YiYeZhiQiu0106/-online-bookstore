package zhl.controller.adm;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import zhl.entity.Evaluate;
import zhl.service.EvaluateServiceI;
import zhl.service.StatisticsServiceI;

@Controller
@RequestMapping("b_eva")
public class EvaluateAction{
	@Resource
	private EvaluateServiceI serviceI;
	
	@Resource 
	private StatisticsServiceI statisticsServiceI;
	
	@RequestMapping("/getEvaluates")
	@ResponseBody
	private List<Evaluate> getEvaluates(int sta){
		List<Evaluate> list = serviceI.getAllEva(sta);
		return list;
	}
	
	@RequestMapping("upEvaSta")
	@ResponseBody
	private Map<String, String> upEvaSta(Integer e_id,int sta){
		Map<String, String> map = new HashMap<String, String>();
		int id = e_id;
		
		if(serviceI.upEvaSta(id, sta)>0){
			map.put("eva", "操作成功");
		}else {
			map.put("eva", "操作失败");
		}
		return map;
	}
	
	@RequestMapping("/getUserEva")
	@ResponseBody
	private List<Evaluate> getUserEva(int u_id){
		  return serviceI.getUserEva(u_id);
	}

}
