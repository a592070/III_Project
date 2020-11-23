package asx54630.model;

public class HotelPage {

	private Integer currentPage;// 當前頁
	private Integer prePage;// 上一頁
	private Integer nextPage;// 下一頁
	private Integer lastPage;// 尾頁
	private Integer pageSize = 8;// 每頁顯示的條數
	private Integer counter;// 總數據
	
	public  HotelPage(String currentPage, Integer pageSize, Integer counter) {
		if (currentPage == null||"".equals(currentPage)) {
			// 如果當前頁的頁面是空值的話，當前頁賦值爲1
			currentPage = "1";
		}
		// 把當前頁數傳遞過去
		this.currentPage = Integer.parseInt(currentPage);
		// 求總頁數
		this.lastPage = counter / pageSize;
		// 如果總條數不能整除每頁顯示的條數的時候，就+1；例如93/10=9;93%10=3;還有三條數據要做一頁，總共10頁；
		if (counter % pageSize != 0) {

			this.lastPage = this.lastPage + 1;
		}

		// 把上一頁傳遞過去
		this.prePage = (this.currentPage == 1) ? this.currentPage
				: this.currentPage - 1;
		// 把下一頁傳遞過去
		this.nextPage = (this.currentPage == this.lastPage) ? this.currentPage
				: this.currentPage + 1;
	}
	
	public Integer getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(Integer currentPage) {
		this.currentPage = currentPage;
	}

	public Integer getPrePage() {
		return prePage;
	}

	public void setPrePage(Integer prePage) {
		this.prePage = prePage;
	}

	public Integer getNextPage() {
		return nextPage;
	}

	public void setNextPage(Integer nextPage) {
		this.nextPage = nextPage;
	}

	public Integer getLastPage() {
		return lastPage;
	}

	public void setLastPage(Integer lastPage) {
		this.lastPage = lastPage;
	}

	public Integer getPageSize() {
		return pageSize;
	}

	public void setPageSize(Integer pageSize) {
		this.pageSize = pageSize;
	}

	public Integer getCounter() {
		return counter;
	}

	public void setCounter(Integer counter) {
		this.counter = counter;
	}



}
