package common;

public class BoardEntity {
	private int brd_id;
	private String title;
	private String content;
	private String id;
	private String regdata;
	
	public String getRegdata() {
		return regdata;
	}
	public void setRegdata(String regdata) {
		this.regdata = regdata;
	}
	public int getBrd_id() {
		return brd_id;
	}
	public void setBrd_id(int brd_id) {
		this.brd_id = brd_id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
}
