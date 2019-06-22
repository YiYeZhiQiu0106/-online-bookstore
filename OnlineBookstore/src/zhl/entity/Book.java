package zhl.entity;

import java.sql.Timestamp;



/**
 * 图书实体类
 * @author 左
 *
 */
public class Book {
    private int b_id;
    private String b_name;//书名
    private String author; //作者
    private String synopsis;//简介synopsis
    private float  price;
    private String press;//出版社
    private String pre_time; //出版时间
    private String b_type;//图书类型
    private String img;//图片
    private String packing;//包装
    private String openbook;//开本
    private String isbn;//国际标准书号
    private String paper;//纸张
    private String suit;//是否套装
    private int stock;  //库存
	public Book() {
	}
	public Book(int b_id, String b_name, String author, String synopsis,
			float price, String press, String pre_time, String b_type,
			String img, String packing, String openbook, String isbn,
			String paper, String suit,int stock) {
		super();
		this.b_id = b_id;
		this.b_name = b_name;
		this.author = author;
		this.synopsis = synopsis;
		this.price = price;
		this.press = press;
		this.pre_time = pre_time;
		this.b_type = b_type;
		this.img = img;
		this.packing = packing;
		this.openbook = openbook;
		this.isbn = isbn;
		this.paper = paper;
		this.suit = suit;
		this.stock=stock;
	}
	
	
	@Override
	public String toString() {
		return "Book [b_id=" + b_id + ", b_name=" + b_name + ", author="
				+ author + ", synopsis=" + synopsis + ", price=" + price
				+ ", press=" + press + ", pre_time=" + pre_time + ", b_type="
				+ b_type + ", img=" + img + ", packing=" + packing
				+ ", openbook=" + openbook + ", isbn=" + isbn + ", paper="
				+ paper + ", suit=" + suit + ", stock=" + stock + "]";
	}
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((author == null) ? 0 : author.hashCode());
		result = prime * result + b_id;
		result = prime * result + ((b_name == null) ? 0 : b_name.hashCode());
		result = prime * result + ((b_type == null) ? 0 : b_type.hashCode());
		result = prime * result + ((img == null) ? 0 : img.hashCode());
		result = prime * result + ((isbn == null) ? 0 : isbn.hashCode());
		result = prime * result
				+ ((openbook == null) ? 0 : openbook.hashCode());
		result = prime * result + ((packing == null) ? 0 : packing.hashCode());
		result = prime * result + ((paper == null) ? 0 : paper.hashCode());
		result = prime * result
				+ ((pre_time == null) ? 0 : pre_time.hashCode());
		result = prime * result + ((press == null) ? 0 : press.hashCode());
		result = prime * result + Float.floatToIntBits(price);
		result = prime * result + stock;
		result = prime * result + ((suit == null) ? 0 : suit.hashCode());
		result = prime * result
				+ ((synopsis == null) ? 0 : synopsis.hashCode());
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
		Book other = (Book) obj;
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
		if (b_type == null) {
			if (other.b_type != null)
				return false;
		} else if (!b_type.equals(other.b_type))
			return false;
		if (img == null) {
			if (other.img != null)
				return false;
		} else if (!img.equals(other.img))
			return false;
		if (isbn == null) {
			if (other.isbn != null)
				return false;
		} else if (!isbn.equals(other.isbn))
			return false;
		if (openbook == null) {
			if (other.openbook != null)
				return false;
		} else if (!openbook.equals(other.openbook))
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
		if (stock != other.stock)
			return false;
		if (suit == null) {
			if (other.suit != null)
				return false;
		} else if (!suit.equals(other.suit))
			return false;
		if (synopsis == null) {
			if (other.synopsis != null)
				return false;
		} else if (!synopsis.equals(other.synopsis))
			return false;
		return true;
	}
	public int getStock() {
		return stock;
	}
	public void setStock(int stock) {
		this.stock = stock;
	}
	public int getB_id() {
		return b_id;
	}
	public void setB_id(int b_id) {
		this.b_id = b_id;
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
	public String getSynopsis() {
		return synopsis;
	}
	public void setSynopsis(String synopsis) {
		this.synopsis = synopsis;
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
	public String getB_type() {
		return b_type;
	}
	public void setB_type(String b_type) {
		this.b_type = b_type;
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
	public String getOpenbook() {
		return openbook;
	}
	public void setOpenbook(String openbook) {
		this.openbook = openbook;
	}
	public String getIsbn() {
		return isbn;
	}
	public void setIsbn(String isbn) {
		this.isbn = isbn;
	}
	public String getPaper() {
		return paper;
	}
	public void setPaper(String paper) {
		this.paper = paper;
	}
	public String getSuit() {
		return suit;
	}
	public void setSuit(String suit) {
		this.suit = suit;
	}
    
}
