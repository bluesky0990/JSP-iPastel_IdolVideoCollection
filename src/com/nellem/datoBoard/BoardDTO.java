package com.nellem.datoBoard;

import java.sql.Date;

public class BoardDTO {
	private int no;
	private int num;
	private int boardNo;
	private String title;
	private String writer;
	private String content;
	private int hits;
	private Date regdate;

	private String boardName;
	private int countBoard;
	private int countReply;
	private String profile_img;
	
	private String youtubeCode;
	
	private int startRow;
	private int endRow;
	
	

	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public int getBoardNo() {
		return boardNo;
	}
	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
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
	public int getHits() {
		return hits;
	}
	public void setHits(int hits) {
		this.hits = hits;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	public String getBoardName() {
		return boardName;
	}
	public void setBoardName(String boardName) {
		this.boardName = boardName;
	}
	public int getCountBoard() {
		return countBoard;
	}
	public void setCountBoard(int countBoard) {
		this.countBoard = countBoard;
	}
	public int getCountReply() {
		return countReply;
	}
	public void setCountReply(int countReply) {
		this.countReply = countReply;
	}
	public String getProfile_img() {
		return profile_img;
	}
	public void setProfile_img(String profile_img) {
		this.profile_img = profile_img;
	}
	public String getYoutubeCode() {
		return youtubeCode;
	}
	public void setYoutubeCode(String youtubeCode) {
		this.youtubeCode = youtubeCode;
	}
	public int getStartRow() {
		return startRow;
	}
	public void setStartRow(int startRow) {
		this.startRow = startRow;
	}
	public int getEndRow() {
		return endRow;
	}
	public void setEndRow(int endRow) {
		this.endRow = endRow;
	}
}
