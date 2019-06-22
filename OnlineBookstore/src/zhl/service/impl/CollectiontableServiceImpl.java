package zhl.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import zhl.dao.CollectiontabledDaoI;
import zhl.entity.Collectiontable;
import zhl.service.CollectiontableServiceI;

@Service
public class CollectiontableServiceImpl implements CollectiontableServiceI{
	
	@Resource
	private CollectiontabledDaoI daoI;

	public List<Collectiontable> userCollection(int u_id) {
		
		return daoI.userCollection(u_id);
	}

	public boolean addCollection(Collectiontable c) {
		if(daoI.addCollection(c)>0){
			return true;
		}
		return false;
	}

	public boolean delCollection(int c_id) {
		if(daoI.delCollection(c_id)>0){
			return true;
		}
		return false;
	}

}
