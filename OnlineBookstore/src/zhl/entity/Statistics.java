package zhl.entity;

/**
 * 销量表实体类
 * @author 左
 *
 */
public class Statistics {
	private int st_id;   
	private int b_id;   //图书id
	private int coll_num;  
	private int eva_num;
	private int order_num;
	private String b_name;  
	private float price;
	private String type;
	private String img;
	private String pre_time;
	
	public String getPre_time() {
		return pre_time;
	}
	public void setPre_time(String pre_time) {
		this.pre_time = pre_time;
	}
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	public int getSt_id() {
		return st_id;
	}
	public void setSt_id(int st_id) {
		this.st_id = st_id;
	}
	public int getB_id() {
		return b_id;
	}
	public void setB_id(int b_id) {
		this.b_id = b_id;
	}
	public int getColl_num() {
		return coll_num;
	}
	public void setColl_num(int coll_num) {
		this.coll_num = coll_num;
	}
	public int getEva_num() {
		return eva_num;
	}
	public void setEva_num(int eva_num) {
		this.eva_num = eva_num;
	}
	public int getOrder_num() {
		return order_num;
	}
	public void setOrder_num(int order_num) {
		this.order_num = order_num;
	}
	public String getB_name() {
		return b_name;
	}
	public void setB_name(String b_name) {
		this.b_name = b_name;
	}
	public float getPrice() {
		return price;
	}
	public void setPrice(float price) {
		this.price = price;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public Statistics(int st_id, int b_id, int coll_num, int eva_num,
			int order_num, String b_name, float price, String type) {
		super();
		this.st_id = st_id;
		this.b_id = b_id;
		this.coll_num = coll_num;
		this.eva_num = eva_num;
		this.order_num = order_num;
		this.b_name = b_name;
		this.price = price;
		this.type = type;
	}
	public Statistics(){
		
	}
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + b_id;
		result = prime * result + ((b_name == null) ? 0 : b_name.hashCode());
		result = prime * result + coll_num;
		result = prime * result + eva_num;
		result = prime * result + order_num;
		result = prime * result + Float.floatToIntBits(price);
		result = prime * result + st_id;
		result = prime * result + ((type == null) ? 0 : type.hashCode());
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
		Statistics other = (Statistics) obj;
		if (b_id != other.b_id)
			return false;
		if (b_name == null) {
			if (other.b_name != null)
				return false;
		} else if (!b_name.equals(other.b_name))
			return false;
		if (coll_num != other.coll_num)
			return false;
		if (eva_num != other.eva_num)
			return false;
		if (order_num != other.order_num)
			return false;
		if (Float.floatToIntBits(price) != Float.floatToIntBits(other.price))
			return false;
		if (st_id != other.st_id)
			return false;
		if (type == null) {
			if (other.type != null)
				return false;
		} else if (!type.equals(other.type))
			return false;
		return true;
	}
	@Override
	public String toString() {
		return "Statistics [st_id=" + st_id + ", b_id=" + b_id + ", coll_num="
				+ coll_num + ", eva_num=" + eva_num + ", order_num="
				+ order_num + ", b_name=" + b_name + ", price=" + price
				+ ", type=" + type + "]";
	}
	
	
	
}
