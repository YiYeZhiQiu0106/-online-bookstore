package zhl.entity;
/**
 * 收货地址表
 * @author 左
 *
 */
public class Receivingaddress {
    private int r_id;
    private int u_id;
    private String  r_name;  //收货人姓名
    private String  r_tel;   //电话
    private String  identity;//省份	
    private String  city;    //城市
    private String  address; //详细地址
	public Receivingaddress() {
	}
	public Receivingaddress(int r_id, int u_id, String r_name, String r_tel,
			String identity, String city, String address) {
		super();
		this.r_id = r_id;
		this.u_id = u_id;
		this.r_name = r_name;
		this.r_tel = r_tel;
		this.identity = identity;
		this.city = city;
		this.address = address;
	}
	public int getR_id() {
		return r_id;
	}
	public void setR_id(int r_id) {
		this.r_id = r_id;
	}
	public int getU_id() {
		return u_id;
	}
	public void setU_id(int u_id) {
		this.u_id = u_id;
	}
	public String getR_name() {
		return r_name;
	}
	public void setR_name(String r_name) {
		this.r_name = r_name;
	}
	public String getR_tel() {
		return r_tel;
	}
	public void setR_tel(String r_tel) {
		this.r_tel = r_tel;
	}
	public String getIdentity() {
		return identity;
	}
	public void setIdentity(String identity) {
		this.identity = identity;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	@Override
	public String toString() {
		return "Receivingaddress [r_id=" + r_id + ", u_id=" + u_id
				+ ", r_name=" + r_name + ", r_tel=" + r_tel + ", identity="
				+ identity + ", city=" + city + ", address=" + address + "]";
	}
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((address == null) ? 0 : address.hashCode());
		result = prime * result + ((city == null) ? 0 : city.hashCode());
		result = prime * result
				+ ((identity == null) ? 0 : identity.hashCode());
		result = prime * result + r_id;
		result = prime * result + ((r_name == null) ? 0 : r_name.hashCode());
		result = prime * result + ((r_tel == null) ? 0 : r_tel.hashCode());
		result = prime * result + u_id;
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
		Receivingaddress other = (Receivingaddress) obj;
		if (address == null) {
			if (other.address != null)
				return false;
		} else if (!address.equals(other.address))
			return false;
		if (city == null) {
			if (other.city != null)
				return false;
		} else if (!city.equals(other.city))
			return false;
		if (identity == null) {
			if (other.identity != null)
				return false;
		} else if (!identity.equals(other.identity))
			return false;
		if (r_id != other.r_id)
			return false;
		if (r_name == null) {
			if (other.r_name != null)
				return false;
		} else if (!r_name.equals(other.r_name))
			return false;
		if (r_tel == null) {
			if (other.r_tel != null)
				return false;
		} else if (!r_tel.equals(other.r_tel))
			return false;
		if (u_id != other.u_id)
			return false;
		return true;
	}
    
    
}
