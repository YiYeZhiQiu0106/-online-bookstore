package zhl.entity;
/**
 * 管理员表
 * @author 左
 *
 */
public class Administrator {
   private int a_id;
   private String a_name;
   private String a_pwd;
   private String a_idNumber;
   private String a_tel;
   
 public Administrator() {
}

public Administrator(int a_id, String a_name, String a_pwd, String a_idNumber,
		String a_tel) {
	super();
	this.a_id = a_id;
	this.a_name = a_name;
	this.a_pwd = a_pwd;
	this.a_idNumber = a_idNumber;
	this.a_tel = a_tel;
}

public int getA_id() {
	return a_id;
}

public void setA_id(int a_id) {
	this.a_id = a_id;
}

public String getA_name() {
	return a_name;
}

public void setA_name(String a_name) {
	this.a_name = a_name;
}

public String getA_pwd() {
	return a_pwd;
}

public void setA_pwd(String a_pwd) {
	this.a_pwd = a_pwd;
}

public String getA_idNumber() {
	return a_idNumber;
}

public void setA_idNumber(String a_idNumber) {
	this.a_idNumber = a_idNumber;
}

public String getA_tel() {
	return a_tel;
}

public void setA_tel(String a_tel) {
	this.a_tel = a_tel;
}

@Override
public String toString() {
	return "Administrator [a_id=" + a_id + ", a_name=" + a_name + ", a_pwd="
			+ a_pwd + ", a_idNumber=" + a_idNumber + ", a_tel=" + a_tel + "]";
}

@Override
public int hashCode() {
	final int prime = 31;
	int result = 1;
	result = prime * result + a_id;
	result = prime * result
			+ ((a_idNumber == null) ? 0 : a_idNumber.hashCode());
	result = prime * result + ((a_name == null) ? 0 : a_name.hashCode());
	result = prime * result + ((a_pwd == null) ? 0 : a_pwd.hashCode());
	result = prime * result + ((a_tel == null) ? 0 : a_tel.hashCode());
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
	Administrator other = (Administrator) obj;
	if (a_id != other.a_id)
		return false;
	if (a_idNumber == null) {
		if (other.a_idNumber != null)
			return false;
	} else if (!a_idNumber.equals(other.a_idNumber))
		return false;
	if (a_name == null) {
		if (other.a_name != null)
			return false;
	} else if (!a_name.equals(other.a_name))
		return false;
	if (a_pwd == null) {
		if (other.a_pwd != null)
			return false;
	} else if (!a_pwd.equals(other.a_pwd))
		return false;
	if (a_tel == null) {
		if (other.a_tel != null)
			return false;
	} else if (!a_tel.equals(other.a_tel))
		return false;
	return true;
}
   
}
