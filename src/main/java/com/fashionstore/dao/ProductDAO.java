package com.fashionstore.dao;

import java.util.List;
import com.fashionstore.model.Product;

public interface ProductDAO {
    boolean addProduct(Product product);
    List<Product> getAllProducts();
    Product getProductById(int id);
    List<Product> getProductsByCategory(int categoryId);
    List<Product> searchProducts(String keyword);
    List<Product> filterProducts(double minPrice, double maxPrice, List<String> brands, List<String> categories, String sort);
    List<Product> sortProducts(String sortBy);
    List<Product> sortProductsByCategory(String sort, int categoryId);
    boolean updateProduct(Product product);
    boolean deleteProduct(int id);
}