package zhl.entity;

public class Est {
	private String head;
	private String end;
	
	public String getHead() {
		return head;
	}
	public void setHead(String head) {
		this.head = head;
	}
	public String getEnd() {
		return end;
	}
	public void setEnd(String end) {
		this.end = end;
	}
	public Est(String head, String end) {
		super();
		this.head = head;
		this.end = end;
	}
	
	public Est(){
		
	}
	@Override
	public String toString() {
		return "Est [head=" + head + ", end=" + end + "]";
	}
	

}
