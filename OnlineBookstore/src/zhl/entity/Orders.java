package zhl.entity;

import java.sql.Date;
import java.sql.Timestamp;

/**
 * 订单详情
 * @author 左
 *
 */
public class Orders {
    private int o_id;
    private int u_id;
    private int b_id;
    private int o_state;//订单状态
    private  String o_time;//创建订单时间
    private int num;    //数量
    private String u_name;   //用户名
    private String address;  //收货地址
    private String phone;    //联系方式
    private String b_name;   //书名
    private float price;     //图书价格
    private float money;     //订单总金额
	public Orders() {
	}

	public int getO_id() {
		return o_id;
	}

	public float getPrice() {
		return price;
	}

	public void setPrice(float price) {
		this.price = price;
	}

	public float getMoney() {
		return money;
	}

	public void setMoney(float money) {
		this.money = money;
	}

	public void setO_id(int o_id) {
		this.o_id = o_id;
	}

	public int getU_id() {
		return u_id;
	}

	public void setU_id(int u_id) {
		this.u_id = u_id;
	}

	public int getB_id() {
		return b_id;
	}

	public void setB_id(int b_id) {
		this.b_id = b_id;
	}

	public int getO_state() {
		return o_state;
	}

	public void setO_state(int o_state) {
		this.o_state = o_state;
	}

	public String getO_time() {
		return o_time;
	}

	public void setO_time(String o_time) {
		this.o_time = o_time;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public String getU_name() {
		return u_name;
	}

	public void setU_name(String u_name) {
		this.u_name = u_name;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getB_name() {
		return b_name;
	}

	public void setB_name(String b_name) {
		this.b_name = b_name;
	}

	public Orders(int o_id, int u_id, int b_id, int o_state, String o_time,
			int num, String u_name, String address, String phone, String b_name) {
		super();
		this.o_id = o_id;
		this.u_id = u_id;
		this.b_id = b_id;
		this.o_state = o_state;
		this.o_time = o_time;
		this.num = num;
		this.u_name = u_name;
		this.address = address;
		this.phone = phone;
		this.b_name = b_name;
	}

	@Override
	public String toString() {
		return "Orders [o_id=" + o_id + ", u_id=" + u_id + ", b_id=" + b_id
				+ ", o_state=" + o_state + ", o_time=" + o_time + ", num="
				+ num + ", u_name=" + u_name + ", address=" + address
				+ ", phone=" + phone + ", b_name=" + b_name + "]";
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((address == null) ? 0 : address.hashCode());
		result = prime * result + b_id;
		result = prime * result + ((b_name == null) ? 0 : b_name.hashCode());
		result = prime * result + num;
		result = prime * result + o_id;
		result = prime * result + o_state;
		result = prime * result + ((o_time == null) ? 0 : o_time.hashCode());
		result = prime * result + ((phone == null) ? 0 : phone.hashCode());
		result = prime * result + u_id;
		result = prime * result + ((u_name == null) ? 0 : u_name.hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Orders other = (Orders) obj;
		if (address == null) {
			if (other.address != null)
				return false;
		} else if (!address.equals(other.address))
			return false;
		if (b_id != other.b_id)
			return false;
		if (b_name == null) {
			if (other.b_name != null)
				return false;
		} else if (!b_name.equals(other.b_name))
			return false;
		if (num != other.num)
			return false;
		if (o_id != other.o_id)
			return false;
		if (o_state != other.o_state)
			return false;
		if (o_time == null) {
			if (other.o_time != null)
				return false;
		} else if (!o_time.equals(other.o_time))
			return false;
		if (phone == null) {
			if (other.phone != null)
				return false;
		} else if (!phone.equals(other.phone))
			return false;
		if (u_id != other.u_id)
			return false;
		if (u_name == null) {
			if (other.u_name != null)
				return false;
		} else if (!u_name.equals(other.u_name))
			return false;
		return true;
	}
	
	
    
}
