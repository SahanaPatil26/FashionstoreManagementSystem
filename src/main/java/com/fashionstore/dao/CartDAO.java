package com.fashionstore.dao;

import java.util.List;
import com.fashionstore.model.CartItem;

public interface CartDAO {

    boolean createCart(int userId);

    int getCartIdByUserId(int userId);

    boolean addToCart(CartItem item);

    List<CartItem> getCartItems(int cartId);

    boolean updateCartItem(CartItem item);

    boolean updateCartItemQuantity(int cartItemId, int quantity);

    boolean removeCartItem(int cartItemId);

    boolean clearCart(int cartId);
}