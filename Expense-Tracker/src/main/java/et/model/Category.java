package et.model;

import java.sql.Date;

public class Category {

	private int categoryId;
	private int userId;
	private String categoryName;
	private Double monthlyLimit;
	private int isActive;
	private Date currDate;

	public Category() {
	}

	public Category(int categoryId, int userId, String categoryName, Double monthlyLimit, int isActive,
			Date currDate) {
		this.categoryId = categoryId;
		this.userId = userId;
		this.categoryName = categoryName;
		this.monthlyLimit = monthlyLimit;
		this.isActive = isActive;
		this.currDate = currDate;
	}

	public Double getMonthlyLimit() {
		return monthlyLimit;
	}

	public void setMonthlyLimit(Double monthlyLimit) {
		this.monthlyLimit = monthlyLimit;
	}

	public int isActive() {
		return isActive;
	}

	public void setActive(int isActive) {
		this.isActive = isActive;
	}

	public Date getCurrDate() {
		return currDate;
	}

	public void setCurrDate(Date currDate) {
		this.currDate = currDate;
	}

	public Category(int userId, String categoryName) {
		this.userId = userId;
		this.categoryName = categoryName;
	}

	public int getCategoryId() {
		return categoryId;
	}

	public void setCategoryId(int categoryId) {
		this.categoryId = categoryId;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public String getCategoryName() {
		return categoryName;
	}

	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}

	@Override
	public String toString() {
		return "Category [categoryId=" + categoryId + ", userId=" + userId + ", categoryName=" + categoryName
				+ ", monthlyLimit=" + monthlyLimit + ", isActive=" + isActive + ", currDate=" + currDate + "]";
	}
}
