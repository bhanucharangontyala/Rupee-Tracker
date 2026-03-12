package et.model;

public class User_income {
	private int income_id;
	private int user_id;
	private double mon_income;

	public User_income() {
	}

	public User_income(int income_id, int user_id, double mon_income) {
		this.income_id = income_id;
		this.user_id = user_id;
		this.mon_income = mon_income;
	}

	public int getIncome_id() {
		return income_id;
	}

	public void setIncome_id(int income_id) {
		this.income_id = income_id;
	}

	public int getUser_id() {
		return user_id;
	}

	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}

	public double getMon_income() {
		return mon_income;
	}

	public void setMon_income(double mon_income) {
		this.mon_income = mon_income;
	}

	@Override
	public String toString() {
		return "User_income [income_id=" + income_id + ", user_id=" + user_id + ", mon_income=" + mon_income + "]";
	}

}
