package com.model;

public class NoticeDTO {
	private int notice_no;
	private String notice_cont;
	private long pmember_code;
	private int id;

	public int getNotice_no() {
		return notice_no;
	}
	public void setNotice_no(int notice_no) {
		this.notice_no = notice_no;
	}
	public String getNotice_cont() {
		return notice_cont;
	}
	public void setNotice_cont(String notice_cont) {
		this.notice_cont = notice_cont;
	}
	public long getPmember_code() {
		return pmember_code;
	}
	public void setPmember_code(long pmember_code) {
		this.pmember_code = pmember_code;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}


}