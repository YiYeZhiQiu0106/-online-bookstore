package zhl.entity;
/**
 * 购物车表
 * @author 左
 *
 */
public class Shoppingcart {
    private int s_id;
    private int u_id;
    private int b_id;
    private int statis;
    private int num;
    private String b_name;//书名
    private String author; //作者
    private float price;
    private String press;//出版社
    private String pre_time; //出版时间
    private String img;//图片
    private String packing;//包装
    private String paper;//纸张
    private float reporter;//小计
	public Shoppingcart() {
	}
	
	
	


	public float getPrice() {
		return price;
	}


	public void setPrice(float price) {
		this.price = price;
	}


	public int getS_id() {
		return s_id;
	}
	public void setS_id(int s_id) {
		this.s_id = s_id;
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
	public int getStatis() {
		return statis;
	}
	public void setStatis(int statis) {
		this.statis = statis;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
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
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	public String getPacking() {
		return packing;
	}
	public void setPacking(String packing) {
		this.packing = packing;
	}
	public String getPaper() {
		return paper;
	}
	public void setPaper(String paper) {
		this.paper = paper;
	}
	
	public float getReporter() {
		return reporter;
	}
	public void setReporter(float reporter) {
		this.reporter = reporter;
	}





	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((author == null) ? 0 : author.hashCode());
		result = prime * result + b_id;
		result = prime * result + ((b_name == null) ? 0 : b_name.hashCode());
		result = prime * result + ((img == null) ? 0 : img.hashCode());
		result = prime * result + num;
		result = prime * result + ((packing == null) ? 0 : packing.hashCode());
		result = prime * result + ((paper == null) ? 0 : paper.hashCode());
		result = prime * result
				+ ((pre_time == null) ? 0 : pre_time.hashCode());
		result = prime * result + ((press == null) ? 0 : press.hashCode());
		result = prime * result + Float.floatToIntBits(price);
		result = prime * result + Float.floatToIntBits(reporter);
		result = prime * result + s_id;
		result = prime * result + statis;
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
		Shoppingcart other = (Shoppingcart) obj;
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
		if (img == null) {
			if (other.img != null)
				return false;
		} else if (!img.equals(other.img))
			return false;
		if (num != other.num)
			return false;
		if (packing == null) {
			if (other.packing != null)
				return false;
		} else if (!packing.equals(other.packing))
			return false;
		if (paper == null) {
			if (other.paper != null)
				return false;
		} else if (!paper.equals(other.paper))
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
		if (Float.floatToIntBits(reporter) != Float
				.floatToIntBits(other.reporter))
			return false;
		if (s_id != other.s_id)
			return false;
		if (statis != other.statis)
			return false;
		if (u_id != other.u_id)
			return false;
		return true;
	}





	public Shoppingcart(int s_id, int u_id, int b_id, int statis, int num,
			String b_name, String author, float price, String press,
			String pre_time, String img, String packing, String paper,
			float reporter) {
		super();
		this.s_id = s_id;
		this.u_id = u_id;
		this.b_id = b_id;
		this.statis = statis;
		this.num = num;
		this.b_name = b_name;
		this.author = author;
		this.price = price;
		this.press = press;
		this.pre_time = pre_time;
		this.img = img;
		this.packing = packing;
		this.paper = paper;
		this.reporter = reporter;
	}


	@Override
	public String toString() {
		return "Shoppingcart [s_id=" + s_id + ", u_id=" + u_id + ", b_id="
				+ b_id + ", statis=" + statis + ", num=" + num + ", b_name="
				+ b_name + ", author=" + author + ", price=" + price
				+ ", press=" + press + ", pre_time=" + pre_time + ", img="
				+ img + ", packing=" + packing + ", paper=" + paper
				+ ", reporter=" + reporter + "]";
	}
	
	
    
}
