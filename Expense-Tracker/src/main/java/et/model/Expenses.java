package et.model;

import java.sql.Date;

public class Expenses {
	private int expenseId;
	private int userId;
	private int categoryId;
	private String catName;
	private double amount;
	private Date expenseDate;
	private String description;
	private int is_active;

	public Expenses(int expenseId, int userId, int categoryId, String catName, double amount, Date expenseDate,
			String description, int is_active) {
		super();
		this.expenseId = expenseId;
		this.userId = userId;
		this.categoryId = categoryId;
		this.catName = catName;
		this.amount = amount;
		this.expenseDate = expenseDate;
		this.description = description;
		this.is_active = is_active;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public int getIs_active() {
		return is_active;
	}

	public void setIs_active(int is_active) {
		this.is_active = is_active;
	}

	public int getExpenseId() {
		return expenseId;
	}

	public void setExpenseId(int expenseId) {
		this.expenseId = expenseId;
	}

	public String getCatName() {
		return catName;
	}

	public void setCatName(String catName) {
		this.catName = catName;
	}
	
	public int getCategoryId() {
		return categoryId;
	}

	public void setCategoryId(int categoryId) {
		this.categoryId = categoryId;
	}

	public double getAmount() {
		return amount;
	}

	public void setAmount(double amount) {
		this.amount = amount;
	}

	public Date getExpenseDate() {
		return expenseDate;
	}

	public void setExpenseDate(Date expenseDate) {
		this.expenseDate = expenseDate;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	// no-arg object
	public Expenses() {
	}


	// for insert
	public Expenses(int categoryId, double amount, Date expenseDate, String description) {
		this.categoryId = categoryId;
		this.amount = amount;
		this.expenseDate = expenseDate;
		this.description = description;
	}

	@Override
	public String toString() {
		return "Expenses [expenseId=" + expenseId + ", userId=" + userId + ", categoryId=" + categoryId + ", catName="
				+ catName + ", amount=" + amount + ", expenseDate=" + expenseDate + ", description=" + description
				+ ", is_active=" + is_active + "]";
	}

}
