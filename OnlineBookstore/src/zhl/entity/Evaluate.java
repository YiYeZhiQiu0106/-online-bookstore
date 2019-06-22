package zhl.entity;

import java.sql.Timestamp;

/**
 * 评价表
 * @author 左
 *
 */
public class Evaluate {
    private int e_id; 
    private int b_id;//图书id
    private int u_id;//评价的用户id
    private String name;   //评价的用户名
    private String evaluate; //评价
    private String e_time;   //评价时间
    private int statis;      //状态
    private int goodpoor;
    private String b_name;
    private String author;
    public Evaluate(){
    	
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

	public String getE_time() {
		return e_time;
	}



	public void setE_time(String e_time) {
		this.e_time = e_time;
	}



	public int getStatis() {
		return statis;
	}



	public void setStatis(int statis) {
		this.statis = statis;
	}



	public int getGoodpoor() {
		return goodpoor;
	}



	public void setGoodpoor(int goodpoor) {
		this.goodpoor = goodpoor;
	}



	public int getE_id() {
		return e_id;
	}

	public void setE_id(int e_id) {
		this.e_id = e_id;
	}

	public int getB_id() {
		return b_id;
	}

	public void setB_id(int b_id) {
		this.b_id = b_id;
	}

	public int getU_id() {
		return u_id;
	}

	public void setU_id(int u_id) {
		this.u_id = u_id;
	}

	

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEvaluate() {
		return evaluate;
	}

	public void setEvaluate(String evaluate) {
		this.evaluate = evaluate;
	}

	@Override
	public String toString() {
		return "Evaluate [e_id=" + e_id + ", b_id=" + b_id + ", u_id=" + u_id
				+ ", u_name=" + name + ", evaluate=" + evaluate + "]";
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + b_id;
		result = prime * result + e_id;
		result = prime * result
				+ ((evaluate == null) ? 0 : evaluate.hashCode());
		result = prime * result + u_id;
		result = prime * result + ((name == null) ? 0 : name.hashCode());
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
		Evaluate other = (Evaluate) obj;
		if (b_id != other.b_id)
			return false;
		if (e_id != other.e_id)
			return false;
		if (evaluate == null) {
			if (other.evaluate != null)
				return false;
		} else if (!evaluate.equals(other.evaluate))
			return false;
		if (u_id != other.u_id)
			return false;
		if (name == null) {
			if (other.name != null)
				return false;
		} else if (!name.equals(other.name))
			return false;
		return true;
	}

	public Evaluate(int e_id, int b_id, int u_id, String name, String evaluate,
			String e_time, int statis, int goodpoor, String b_name,
			String author) {
		super();
		this.e_id = e_id;
		this.b_id = b_id;
		this.u_id = u_id;
		this.name = name;
		this.evaluate = evaluate;
		this.e_time = e_time;
		this.statis = statis;
		this.goodpoor = goodpoor;
		this.b_name = b_name;
		this.author = author;
	}
    
    
    
}
