package zhl.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import zhl.dao.BooktypeDaoI;
import zhl.entity.Booktype;
import zhl.service.BooktypeServiceI;

@Service
public class BooktypeServiceImpl implements BooktypeServiceI{
	
	@Resource
	private BooktypeDaoI booktypeDaoI;

	public List<Booktype> getAllType() {
		return booktypeDaoI.getAllType();
	}

	public int addType(Booktype booktype) {
		return booktypeDaoI.addType(booktype);
	}

	public int deleteType(int bt_id) {
		return booktypeDaoI.deleteType(bt_id);
	}

	public int updateType(Booktype booktype) {
		return booktypeDaoI.updateType(booktype);
	}

	public int oneType(String bt_name) {
		return booktypeDaoI.oneType(bt_name);
	}

	public List<Booktype> dimName(String name) {
		return booktypeDaoI.dimName(name);
	}

}
