package zhl.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import zhl.dao.AdministratorDaoI;
import zhl.entity.Administrator;
import zhl.service.AdministratorServiceI;

@Service
public class AdministratorServiceImpl implements AdministratorServiceI{
	
	@Resource
	private AdministratorDaoI daoI;

	public Administrator longin(String a_idNumber, String a_pwd) {
		return daoI.longin(a_idNumber, a_pwd);
		
	}

	public boolean updateAdm(Administrator adm) {
		if(daoI.updateAdm(adm)>0){
			return true;
		}
		return false;
	}

}
