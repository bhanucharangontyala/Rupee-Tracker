package service;

import et.dao.CategoryDAO;
import et.model.Category;

public class CategoryService {
	CategoryDAO cat = new CategoryDAO();
	public void insertDefaultCategories(int userid) {
		cat.insertDefaultCategories(userid);
	}

	public boolean insertcat(Category c) {
		return cat.insertCategory(c);
	}
	
	public boolean updateCategory(Category c) {
		return cat.updateCategory(c);
	}
	
	public boolean deleteCategory(int catId) {
		return cat.deleteCategory(catId);
	}
	
	
}
