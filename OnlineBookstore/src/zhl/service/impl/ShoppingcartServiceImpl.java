package zhl.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import zhl.dao.ShoppingcartDaoI;
import zhl.entity.Shoppingcart;
import zhl.service.ShoppingcartServiceI;

@Service
public class ShoppingcartServiceImpl implements ShoppingcartServiceI{
	@Resource
	private ShoppingcartDaoI daoI;

	public List<Shoppingcart> getShopCat(int u_id) {
		return daoI.getShopCat(u_id);
	}

	public boolean upStatis(int u_id,int b_id,int statis) {
		if(daoI.upStatis(u_id,b_id,statis)>0){
			return true;
		}
		return false;
	}

	public boolean upNum(int u_id, int b_id, int num) {
		if(daoI.upNum(u_id, b_id, num)>0){
			return true;
		}
		return false;
	}

	public boolean delShop(int u_id, int b_id) {
		if(daoI.delShop(u_id, b_id)>0){
			return true;
		}
		return false;
	}

	public float reporter(int u_id) {
		return daoI.reporter(u_id);
	}

	public int upRep(int u_id, int b_id, float rep) {
		
		return daoI.upRep(u_id, b_id, rep);
	}

	public List<Shoppingcart> getShopCat1(int u_id) {
		return daoI.getShopCat1(u_id);
	}

	public int shopCount(int u_id) {
		return daoI.shopCount(u_id);
	}

	public boolean addCat(Shoppingcart shoppingcart) {
		if(daoI.addCat(shoppingcart)>0){
			return true;
		}
		return false;
	}

	public boolean isOneBook(int u_id, int b_id) {
		if(daoI.isOneBook(u_id, b_id)>0){
			return true;
		}
		return false;
	}

}
