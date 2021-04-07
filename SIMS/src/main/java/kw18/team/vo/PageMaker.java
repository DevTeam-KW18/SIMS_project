package kw18.team.vo;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;

public class PageMaker {

	private int totalCount;//total writing value
	private int startPage;// start page
	private int endPage;//end page
	private boolean prev;//true false checker
	private boolean next;
	private int displayPageNum = 10;//criteria
	private Count cnt;
	private int currentpage;
	private int end;//end page
	private int laststart;//last start 
	private boolean checker;//check for end
	public String makeSearch(int page)
	{
	  
	 UriComponents uriComponents =
	            UriComponentsBuilder.newInstance()
	            .queryParam("page", page)
	            .queryParam("perPageNum", cnt.getPerPageNum())
	            .queryParam("searchType", ((Search)cnt).getSearchType())
	            .queryParam("keyword", encoding(((Search)cnt).getKeyword()))
	            .build(); 
	    return uriComponents.toUriString();  
	}

	private String encoding(String keyword) {
		if(keyword == null || keyword.trim().length() == 0) { 
			return "";
		}
		 
		try {
			return URLEncoder.encode(keyword, "UTF-8");
		} catch(UnsupportedEncodingException e) { 
			return ""; 
		}
	}
	//getter and setter for value
	public void setCnt(Count cnt) {
		this.cnt = cnt;
	}
	
	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
		calcData();
	}
	
	public int getTotalCount() {
		return totalCount;
	}
	
	public int getStartPage() {
		return startPage;
	}
	
	public int getEndPage() {
		return endPage;
	}
	
	public boolean isPrev() {
		return prev;
	}
	
	public boolean isNext() {
		return next;
	}
	
	public int getDisplayPageNum() {
		return displayPageNum;
	}
	
	public Count getcnt() {
		return cnt;
	}
	
	public int getCurrentpage() {
		return currentpage;
	}

	public void setCurrentpage(int currentpage) {
		this.currentpage = currentpage;
	}
	
	public int getEnd() {
		return end;
	}

	public void setEnd(int end) {
		this.end = end;
	}
	public void print(int end,int endPage,int startPage,int currentpage) {
		System.out.println("end: "+end);
		System.out.println("endPage: "+endPage);
		System.out.println("startPage: "+startPage);
		System.out.println("currentpage: "+currentpage);
		System.out.println("laststart: "+laststart);
	}
	
	public void getlaststart(int end,int startPage) {
		laststart=end-startPage;	
	}

	 
	private void calcData() {
		endPage = (int) (Math.ceil(cnt.getPage() / (double)displayPageNum) * displayPageNum);
		startPage = (endPage - displayPageNum) + 1;
	  
		int tempEndPage = (int) (Math.ceil(totalCount / (double)cnt.getPerPageNum()));
		currentpage = cnt.getPage();
		end=tempEndPage;
		
		//check for end
		getlaststart(end,startPage);
		if(laststart>9)
			setChecker(true);
		else if(laststart<=9)
			setChecker(false);
		
		//change temp end value
		if (endPage > tempEndPage) {
			endPage = tempEndPage;
		}
		prev = startPage == 1 ? false : true;//if the prev value is exist
		next = endPage * cnt.getPerPageNum() >= totalCount ? false : true;
		//if the next value is exist
	}
	
	public String makeQuery(int page) {//for connect query
		UriComponents uriComponents =
		UriComponentsBuilder.newInstance()
						    .queryParam("page", page)
							.queryParam("perPageNum", cnt.getPerPageNum())
							.build();
		   
		return uriComponents.toUriString();
	}

	public boolean isChecker() {
		return checker;
	}

	public void setChecker(boolean checker) {
		this.checker = checker;
	}

	

}