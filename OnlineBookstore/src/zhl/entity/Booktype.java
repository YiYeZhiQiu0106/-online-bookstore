package zhl.entity;
/**
 * 图书类型实体
 * @author 左
 *
 */
public class Booktype {
     private int bt_id;
     private String bt_name;//类型名
     private String bt_synopsis;//介绍
	public Booktype() {
	}
	public Booktype(int bt_id, String bt_name, String bt_synopsis) {
		this.bt_id = bt_id;
		this.bt_name = bt_name;
		this.bt_synopsis = bt_synopsis;
	}
	public int getBt_id() {
		return bt_id;
	}
	public void setBt_id(int bt_id) {
		this.bt_id = bt_id;
	}
	public String getBt_name() {
		return bt_name;
	}
	public void setBt_name(String bt_name) {
		this.bt_name = bt_name;
	}
	public String getBt_synopsis() {
		return bt_synopsis;
	}
	public void setBt_synopsis(String bt_synopsis) {
		this.bt_synopsis = bt_synopsis;
	}
	@Override
	public String toString() {
		return "Booktype [bt_id=" + bt_id + ", bt_name=" + bt_name
				+ ", bt_synopsis=" + bt_synopsis + "]";
	}
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + bt_id;
		result = prime * result + ((bt_name == null) ? 0 : bt_name.hashCode());
		result = prime * result
				+ ((bt_synopsis == null) ? 0 : bt_synopsis.hashCode());
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
		Booktype other = (Booktype) obj;
		if (bt_id != other.bt_id)
			return false;
		if (bt_name == null) {
			if (other.bt_name != null)
				return false;
		} else if (!bt_name.equals(other.bt_name))
			return false;
		if (bt_synopsis == null) {
			if (other.bt_synopsis != null)
				return false;
		} else if (!bt_synopsis.equals(other.bt_synopsis))
			return false;
		return true;
	}
     
}
