package et.dao;

import java.util.List;

import et.model.Category;

public interface CategoryDAOInterface {
	public void insertDefaultCategories(int userId);

	public List<Category> selectUserCategories(int userId);
	
	public boolean insertCategory(Category c);
	
	public boolean updateCategory(Category c);
	
	public boolean deleteCategory(int catId);
}
