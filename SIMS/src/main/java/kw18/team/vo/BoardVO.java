package kw18.team.vo;

import java.util.Date;

public class BoardVO {
	private int bno;//writing number
	private String title;//title for writing 
	private String content;//content for writing 
	private String writer;//writer for writing
	private Date regdate;//current date
	private int lvl;//level for comment
	private int groupseq;//check group sequence
	private int obno;//original number
	private int hit;//hit
	private String id;
	private String university;
	private int num_of_reply;
	private int likes;
	public int getBno() {
		return bno;
	}
	public void setBno(int bno) {
		this.bno = bno;
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
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	public int getLvl() {
		return lvl;
	}
	public void setLvl(int lvl) {
		this.lvl = lvl;
	}
	public int getGroupseq() {
		return groupseq;
	}
	public void setGroupseq(int groupseq) {
		this.groupseq = groupseq;
	}
	public int getObno() {
		return obno;
	}
	public void setObno(int obno) {
		this.obno = obno;
	}
	public int getHit() {
		return hit;
	}
	public void setHit(int hit) {
		this.hit = hit;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getUniversity() {
		return university;
	}
	public void setUniversity(String university) {
		this.university = university;
	}
	public int getNum_of_reply() {
		return num_of_reply;
	}
	public void setNum_of_reply(int num_of_reply) {
		this.num_of_reply = num_of_reply;
	}
	public int getLikes() {
		return likes;
	}
	public void setLikes(int likes) {
		this.likes = likes;
	}
	
	
}
