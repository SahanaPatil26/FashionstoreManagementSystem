
package com.fashionstore.dao;

import java.util.List;
import com.fashionstore.model.Category;

public interface CategoryDAO {

    boolean addCategory(Category category);

    List<Category> getAllCategories();

    Category getCategoryById(int id);

    boolean updateCategory(Category category);

    boolean deleteCategory(int id);
}
