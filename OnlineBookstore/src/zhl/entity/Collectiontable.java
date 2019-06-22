package zhl.entity;

import java.sql.Timestamp;

/**
 * 收藏表
 * @author 左
 *
 */
public class Collectiontable {
    private int c_id;
    private int u_id;
    private int b_id;
    private String c_time;
    private String b_name;//书名
    private String author; //作者
    private float price;   //价格
    private String press;//出版社
    private String pre_time; //出版时间
    private String packing;//包装
	public Collectiontable() {
	}
	public Collectiontable(int c_id, int u_id, int b_id, String c_time,
			String b_name, String author, float price, String press,
			String pre_time, String packing) {
		super();
		this.c_id = c_id;
		this.u_id = u_id;
		this.b_id = b_id;
		this.c_time = c_time;
		this.b_name = b_name;
		this.author = author;
		this.price = price;
		this.press = press;
		this.pre_time = pre_time;
		this.packing = packing;
	}
	@Override
	public String toString() {
		return "Collectiontable [c_id=" + c_id + ", u_id=" + u_id + ", b_id="
				+ b_id + ", c_time=" + c_time + ", b_name=" + b_name
				+ ", author=" + author + ", price=" + price + ", press="
				+ press + ", pre_time=" + pre_time + ", packing=" + packing
				+ "]";
	}
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((author == null) ? 0 : author.hashCode());
		result = prime * result + b_id;
		result = prime * result + ((b_name == null) ? 0 : b_name.hashCode());
		result = prime * result + c_id;
		result = prime * result + ((c_time == null) ? 0 : c_time.hashCode());
		result = prime * result + ((packing == null) ? 0 : packing.hashCode());
		result = prime * result
				+ ((pre_time == null) ? 0 : pre_time.hashCode());
		result = prime * result + ((press == null) ? 0 : press.hashCode());
		result = prime * result + Float.floatToIntBits(price);
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
		Collectiontable other = (Collectiontable) obj;
		if (author == null) {
			if (other.author != null)
				return false;
		} else if (!author.equals(other.author))
			return false;
		if (b_id != other.b_id)
			return false;
		if (b_name == null) {
			if (other.b_name != null)
				return false;
		} else if (!b_name.equals(other.b_name))
			return false;
		if (c_id != other.c_id)
			return false;
		if (c_time == null) {
			if (other.c_time != null)
				return false;
		} else if (!c_time.equals(other.c_time))
			return false;
		if (packing == null) {
			if (other.packing != null)
				return false;
		} else if (!packing.equals(other.packing))
			return false;
		if (pre_time == null) {
			if (other.pre_time != null)
				return false;
		} else if (!pre_time.equals(other.pre_time))
			return false;
		if (press == null) {
			if (other.press != null)
				return false;
		} else if (!press.equals(other.press))
			return false;
		if (Float.floatToIntBits(price) != Float.floatToIntBits(other.price))
			return false;
		if (u_id != other.u_id)
			return false;
		return true;
	}
	public int getC_id() {
		return c_id;
	}
	public void setC_id(int c_id) {
		this.c_id = c_id;
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
	public String getC_time() {
		return c_time;
	}
	public void setC_time(String c_time) {
		this.c_time = c_time;
	}
	public String getB_name() {
		return b_name;
	}
	public void setB_name(String b_name) {
		this.b_name = b_name;
	}
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	public float getPrice() {
		return price;
	}
	public void setPrice(float price) {
		this.price = price;
	}
	public String getPress() {
		return press;
	}
	public void setPress(String press) {
		this.press = press;
	}
	public String getPre_time() {
		return pre_time;
	}
	public void setPre_time(String pre_time) {
		this.pre_time = pre_time;
	}
	public String getPacking() {
		return packing;
	}
	public void setPacking(String packing) {
		this.packing = packing;
	}
	
    
}
