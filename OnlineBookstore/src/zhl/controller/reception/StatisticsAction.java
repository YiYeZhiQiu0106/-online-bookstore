package zhl.controller.reception;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.aliyuncs.http.HttpRequest;

import zhl.entity.Statistics;
import zhl.service.StatisticsServiceI;

@Controller
@RequestMapping("sta")
public class StatisticsAction {
     @Resource
     private StatisticsServiceI sI;
     
     //ȫ������
     @RequestMapping("/getOrderDesc")
     @ResponseBody
     public List<Statistics> getOrderDesc(){
    	 List<Statistics> list = sI.getOrderDesc();
    	 return list;
     }
     
     //��������������ǰ6
     @RequestMapping("/getTypeDesc")
     @ResponseBody
     public List<Statistics> getTypeDesc(String type){
    	 List<Statistics> list = sI.getTypeDesc(type);
    	 return list;
     }
     
     //���³���ʱ��ǰ4 (�����Ƽ� )
     @RequestMapping("/getTimeDesc")
     @ResponseBody
     public List<Statistics> getTimeDesc(){
    	 List<Statistics> list = sI.getTimeDesc();
    	 return list;
     }
     
     /**
 	 * ��ȡ���е�������
 	 * @return
 	 */
 	
     //��ȡͳ�Ʊ�����
     @RequestMapping("getAllStatistics")
     @ResponseBody
     public List<Statistics> getAllStatistics(HttpServletRequest re){
    	 List<Statistics> list = sI.getAllStatistics();
    	 return list;
     }
     
     
     @RequestMapping("/getAllStatistics1")
     @ResponseBody
     public Map<String, List<String>> getAllStatistics1(HttpServletRequest re){
    	 List<Statistics> list = sI.getOrderDesc();
    	 List<String> list1 = new ArrayList<String>();
    	 Map<String, List<String>> map= new HashMap<String, List<String>>();
    	 for(int i=0;i<list.size();i++){
    		String nameString = list.get(i).getB_name();
    		list1.add(nameString);
    	 }
    	 map.put("data", list1);
    	 return map;
     }
     
     @RequestMapping("/getAllStatistics2")
     @ResponseBody
     public List<Integer> getAllStatistics2(HttpServletRequest re){
    	 List<Statistics> list = sI.getOrderDesc();
    	 List<Integer> list2 = new ArrayList<Integer>();
    	 for(int i=0;i<list.size();i++){
    		int num = list.get(i).getOrder_num();
    		list2.add(num);
    	 }
    	 return list2;
     }
}
