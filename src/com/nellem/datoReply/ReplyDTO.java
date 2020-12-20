package com.nellem.datoReply;

import java.sql.Date;

public class ReplyDTO {
	private int no;
	private int boardNo;
	private String writer;
	private String content;
	private Date regdate;
	
	private String profile_img;
	private int countReply;
	
	
	
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public int getBoardNo() {
		return boardNo;
	}
	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	public String getProfile_img() {
		return profile_img;
	}
	public void setProfile_img(String profile_img) {
		this.profile_img = profile_img;
	}
	public int getCountReply() {
		return countReply;
	}
	public void setCountReply(int countReply) {
		this.countReply = countReply;
	}
}