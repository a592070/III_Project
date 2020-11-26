package asx54630.model;

public class HotelPage {

	// 用戶輸入當前頁面
		private int currentPage = 1;
		// 總比數
		private int totalCount = 0;
		// 每頁比數
		private int pageSize = 8;
		// 總頁數 totalCount/pageSize +1
		private int totalPageCount = 1;

		public int getCurrentPage() {
			return currentPage;
		}

		public void sethCurrentPage(int currentPage) {
			if (currentPage > 0) {
				this.currentPage = currentPage;
			} else {
				this.currentPage = 1;
			}
		}

		public int gethTotalCount() {
			return totalCount;
		}

		public void sethTotalCount(int totalCount) {
			if (totalCount > 0) {
				this.totalCount = totalCount;
				// 設置總頁數
				this.setTotalPageCount();
			}
		}

		public int gethPageSize() {
			return pageSize;
		}

		public void sethPageSize(int pageSize) {
			if (pageSize > 0)
				this.pageSize = pageSize;
		}

		public int getTotalPageCount() {
			return totalPageCount;
		}

		public void setTotalPageCount() {
			if (this.totalCount % this.pageSize == 0) {
				this.totalPageCount = this.totalCount / this.pageSize;
			} else if (this.totalCount % this.pageSize > 0) {
				this.totalPageCount = this.totalCount / this.pageSize + 1;
			} else {
				this.totalPageCount = 0;
			}
		}
	}
