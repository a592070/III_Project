package rambo0021.pojo;

public class Sort {
	// 帳號排序
	private String uSort;
	// 身分排序
	private String iSort;
	// email排序
	private String eSort;
	// 註冊日期排序
	private String rSort;
	// 修改日期排序
	private String mSort;

	public Sort() {

	}

	public Sort(String uSort, String iSort, String eSort, String rSort, String mSort) {
		super();
		this.uSort = uSort;
		this.iSort = iSort;
		this.eSort = eSort;
		this.rSort = rSort;
		this.mSort = mSort;
	}

	public String getuSort() {
		return uSort;
	}

	public void setuSort(String uSort) {
		this.uSort = uSort;
	}

	public String getiSort() {
		return iSort;
	}

	public void setiSort(String iSort) {
		this.iSort = iSort;
	}

	public String geteSort() {
		return eSort;
	}

	public void seteSort(String eSort) {
		this.eSort = eSort;
	}

	public String getrSort() {
		return rSort;
	}

	public void setrSort(String rSort) {
		this.rSort = rSort;
	}

	public String getmSort() {
		return mSort;
	}

	public void setmSort(String mSort) {
		this.mSort = mSort;
	}

	public String getuSortClass() {
		if ("asc".equals(uSort)) {
			return "fa fa-fw fa-sort-asc";
		} else if ("desc".equals(uSort)) {
			return "fa fa-fw fa-sort-desc";
		} else {
			return "fa fa-fw fa-sort";
		}
	}

	public String getiSortClass() {
		if ("asc".equals(iSort)) {
			return "fa fa-fw fa-sort-asc";
		} else if ("desc".equals(iSort)) {
			return "fa fa-fw fa-sort-desc";
		} else {
			return "fa fa-fw fa-sort";
		}
	}

	public String geteSortClass() {
		if ("asc".equals(eSort)) {
			return "fa fa-fw fa-sort-asc";
		} else if ("desc".equals(eSort)) {
			return "fa fa-fw fa-sort-desc";
		} else {
			return "fa fa-fw fa-sort";
		}

	}

	public String getrSortClass() {
		if ("asc".equals(rSort)) {
			return "fa fa-fw fa-sort-asc";
		} else if ("desc".equals(rSort)) {
			return "fa fa-fw fa-sort-desc";
		} else {
			return "fa fa-fw fa-sort";
		}
	}

	public String getmSortClass() {
		if ("asc".equals(mSort)) {
			return "fa fa-fw fa-sort-asc";
		} else if ("desc".equals(mSort)) {
			return "fa fa-fw fa-sort-desc";
		} else {
			return "fa fa-fw fa-sort";
		}
	}
}
