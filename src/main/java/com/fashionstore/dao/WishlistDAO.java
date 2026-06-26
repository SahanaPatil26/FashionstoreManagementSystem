package com.fashionstore.dao;

import java.util.List;
import com.fashionstore.model.WishlistItem;

public interface WishlistDAO {
    boolean addToWishlist(int userId, int productId);
    boolean removeFromWishlist(int userId, int productId);
    boolean isInWishlist(int userId, int productId);
    List<Integer> getWishlistProductIds(int userId);
}
