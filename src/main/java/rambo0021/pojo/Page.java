package rambo0021.pojo;

public class Page {
	// 用戶輸入當前頁面
	private int currentPage = 1;
	// 總比數
	private int totalCount = 0;
	// 每頁筆數
	private int pageSize = 10;
	// 總頁數 totalCount/pageSize +1
	private int totalPageCount = 1;
	//起始筆數
//	private int start = 0;
//    private boolean haveNextPage;
//    private boolean havePrePage;
    
    public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		if (currentPage > 0)
			this.currentPage = currentPage;
	}

	public int getTotalCount() {
		return totalCount;
	}

	public void setTotalCount(int totalCount) {
		if (totalCount > 0) {
			this.totalCount = totalCount;
			// 設置總頁數
			this.setTotalPageCountByRs();
		}
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		if (pageSize > 0)
			this.pageSize = pageSize;
	}

	public int getTotalPageCount() {
		return totalPageCount;
	}

	public void setTotalPageCountByRs() {
		if (this.totalCount % this.pageSize == 0) {
			this.totalPageCount = this.totalCount / this.pageSize;
		} else if (this.totalCount % this.pageSize > 0) {
			this.totalPageCount = this.totalCount / this.pageSize + 1;
		} else {
			this.totalPageCount = 0;
		}
	}

	public int getStart() {
		return (currentPage-1)*pageSize;
	}
	
	
//    public boolean isHaveNextPage() { 
//        haveNextPage = false; 
//        if ((getTotalCount() > 1) && (getTotalCount() > getCurrentPage())) 
//            haveNextPage = true; 
//        return haveNextPage; 
//    } 
//    public boolean isHavePrePage() { 
//        havePrePage = false; 
//        if ((getTotalCount() > 1) && (currentPage > 1)) 
//            havePrePage = true; 
//        return havePrePage; 
//    } 
}
