package com.cimstd.hbys.controller.api.domain;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort.Direction;

public class PageableContentDO<T> {

	private int pageIndex = 0;
	
	private int pageSize = 10;
	
	private String sortKey = "id";
	
	private String sortDirection = "desc";
	
	private T domain;
	
	private Page<T> page;
	
	public int getPageIndex() {
		return pageIndex;
	}

	public void setPageIndex(int pageIndex) {
		this.pageIndex = pageIndex;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public String getSortKey() {
		return sortKey;
	}

	public void setSortKey(String sortKey) {
		this.sortKey = sortKey;
	}

	public String getSortDirection() {
		return sortDirection;
	}

	public void setSortDirection(String sortDirection) {
		this.sortDirection = sortDirection;
	}

	public T getDomain() {
		return domain;
	}

	public void setDomain(T domain) {
		this.domain = domain;
	}

	public List<T> getPageResult() {
		return page != null ? page.getContent() : null;
	}
	
	public int getTotalSize(){
		return (int) (long) page.getTotalElements();
	}
	
	public Page<T> getPage() {
		return page;
	}

	public void setPage(Page<T> page) {
		this.page = page;
	}

	public PageRequest getPageRequest() {
		return new PageRequest(this.pageIndex, this.pageSize, Direction.fromStringOrNull(this.sortDirection), this.sortKey);
		
	}
	
}
