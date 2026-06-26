package com.fashionstore.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.fashionstore.dao.CategoryDAO;
import com.fashionstore.model.Category;
import com.fashionstore.util.DBConnection;

public class CategoryDAOImpl implements CategoryDAO {

    private Connection con;

    public CategoryDAOImpl() {
        con = DBConnection.getConnection();
    }

    // 🔹 ADD CATEGORY
    @Override
    public boolean addCategory(Category category) {
        boolean status = false;

        try {
            String query = "INSERT INTO categories(name) VALUES(?)";
            PreparedStatement ps = con.prepareStatement(query);

            ps.setString(1, category.getName());

            int rows = ps.executeUpdate();

            if (rows > 0) {
                status = true;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return status;
    }

    // 🔹 GET ALL CATEGORIES
    @Override
    public List<Category> getAllCategories() {
        List<Category> list = new ArrayList<>();

        try {
            String query = "SELECT * FROM categories";
            PreparedStatement ps = con.prepareStatement(query);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Category cat = new Category();

                cat.setId(rs.getInt("id"));
                cat.setName(rs.getString("name"));

                list.add(cat);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    // 🔹 GET CATEGORY BY ID
    @Override
    public Category getCategoryById(int id) {
        Category category = null;

        try {
            String query = "SELECT * FROM categories WHERE id=?";
            PreparedStatement ps = con.prepareStatement(query);

            ps.setInt(1, id);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                category = new Category();

                category.setId(rs.getInt("id"));
                category.setName(rs.getString("name"));
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return category;
    }

    // 🔹 UPDATE CATEGORY
    @Override
    public boolean updateCategory(Category category) {
        boolean status = false;

        try {
            String query = "UPDATE categories SET name=? WHERE id=?";
            PreparedStatement ps = con.prepareStatement(query);

            ps.setString(1, category.getName());
            ps.setInt(2, category.getId());

            int rows = ps.executeUpdate();

            if (rows > 0) {
                status = true;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return status;
    }

    // 🔹 DELETE CATEGORY
    @Override
    public boolean deleteCategory(int id) {
        boolean status = false;

        try {
            String query = "DELETE FROM categories WHERE id=?";
            PreparedStatement ps = con.prepareStatement(query);

            ps.setInt(1, id);

            int rows = ps.executeUpdate();

            if (rows > 0) {
                status = true;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return status;
    }
}