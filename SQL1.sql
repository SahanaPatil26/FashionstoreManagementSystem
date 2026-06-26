DROP DATABASE fashionstore_db;

-- Database Setup for FashionStore
CREATE DATABASE IF NOT EXISTS fashionstore_db;
USE fashionstore_db;

-- Users Table
CREATE TABLE IF NOT EXISTS users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    phone VARCHAR(15),
    role VARCHAR(20) DEFAULT 'USER',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Categories Table
CREATE TABLE IF NOT EXISTS categories (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL
);

-- Products Table
CREATE TABLE IF NOT EXISTS products (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    brand VARCHAR(100),
    description TEXT,
    price DECIMAL(10,2) NOT NULL,
    mrp DECIMAL(10,2),
    discount INT,
    image_url VARCHAR(255),
    category_id INT,
    rating DECIMAL(2,1),
    review_count INT,
    color VARCHAR(50),
    size VARCHAR(10),
    FOREIGN KEY (category_id) REFERENCES categories(id)
);

-- Wishlist Table
CREATE TABLE IF NOT EXISTS wishlist (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    product_id INT,
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (product_id) REFERENCES products(id)
);

-- Cart Table
CREATE TABLE IF NOT EXISTS cart (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id)
);

-- Cart Items Table
CREATE TABLE IF NOT EXISTS cart_items (
    id INT AUTO_INCREMENT PRIMARY KEY,
    cart_id INT,
    product_id INT,
    size VARCHAR(10),
    quantity INT,
    FOREIGN KEY (cart_id) REFERENCES cart(id),
    FOREIGN KEY (product_id) REFERENCES products(id)
);

-- Orders Table
CREATE TABLE IF NOT EXISTS orders (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    total_amount DECIMAL(10,2),
    address TEXT,
    phone VARCHAR(15),
    status VARCHAR(50) DEFAULT 'Ordered',
    payment_mode VARCHAR(50),
    order_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id)
);

-- Reviews Table
CREATE TABLE IF NOT EXISTS reviews (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    product_id INT,
    rating INT,
    comment TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (product_id) REFERENCES products(id)
);

-- Order Items Table
CREATE TABLE IF NOT EXISTS order_items (
    id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT,
    price DECIMAL(10,2),
    size VARCHAR(10),
    FOREIGN KEY (order_id) REFERENCES orders(id),
    FOREIGN KEY (product_id) REFERENCES products(id)
);

-- Initial Categories
INSERT IGNORE INTO categories (id, name) VALUES (1, 'Men'), (2, 'Women'), (3, 'Kids'), (4, 'Accessories');

-- 10 MEN PRODUCTS
INSERT INTO products (name, brand, description, price, mrp, discount, image_url, category_id, rating, review_count, color) VALUES 
('Slim Fit Casual Shirt', 'Roadster', 'Stylish blue casual shirt.', 599, 1299, 54, 'https://loremflickr.com/500/600/shirt,men/all', 1, 4.2, 150, 'Blue'),
('Regular Fit Polo T-shirt', 'HRX', 'Breathable sports polo.', 499, 999, 50, 'https://loremflickr.com/500/600/polo,tshirt/all', 1, 4.5, 230, 'White'),
('Tapered Fit Jeans', 'Levi\'s', 'Classic blue denim jeans.', 1999, 3999, 50, 'https://loremflickr.com/500/600/jeans,men/all', 1, 4.6, 120, 'Blue'),
('Hooded Sweatshirt', 'Puma', 'Warm and cozy hoodie.', 1299, 2499, 48, 'https://loremflickr.com/500/600/hoodie,men/all', 1, 4.3, 90, 'Black'),
('Checks Casual Shirt', 'Highlander', 'Red checks pattern shirt.', 699, 1499, 53, 'https://loremflickr.com/500/600/shirt,checks/all', 1, 4.0, 310, 'Red'),
('Cotton Chino Trousers', 'Jack & Jones', 'Comfortable khaki chinos.', 1599, 2999, 46, 'https://loremflickr.com/500/600/chinos,men/all', 1, 4.4, 75, 'Khaki'),
('Solid Round Neck T-shirt', 'U.S. Polo', 'Premium cotton t-shirt.', 399, 799, 50, 'https://loremflickr.com/500/600/tshirt,men/all', 1, 4.2, 500, 'Grey'),
('Printed Crew Neck Tee', 'WROGN', 'Trendy printed t-shirt.', 549, 1099, 50, 'https://loremflickr.com/500/600/printed,tshirt/all', 1, 4.1, 140, 'Yellow'),
('Linen Casual Shirt', 'Invictus', 'Cool linen for summer.', 1199, 2199, 45, 'https://loremflickr.com/500/600/linen,shirt/all', 1, 4.5, 60, 'Peach'),
('Sporty Track Pants', 'Adidas', 'Activewear track pants.', 1899, 2599, 27, 'https://loremflickr.com/500/600/trackpants,men/all', 1, 4.7, 400, 'Navy');

-- 10 WOMEN PRODUCTS
INSERT INTO products (name, brand, description, price, mrp, discount, image_url, category_id, rating, review_count, color) VALUES 
('Floral Print Anarkali', 'Libas', 'Beautiful pink ethnic dress.', 1499, 2999, 50, 'https://loremflickr.com/500/600/anarkali/all', 2, 4.6, 450, 'Pink'),
('Embroidered Straight Kurta', 'W', 'White cotton kurta with embroidery.', 999, 1999, 50, 'https://loremflickr.com/500/600/kurta,women/all', 2, 4.4, 320, 'White'),
('Skinny Fit High-Rise Jeans', 'H&M', 'Black stretchable jeans.', 1299, 2499, 48, 'https://loremflickr.com/500/600/jeans,women/all', 2, 4.3, 190, 'Black'),
('Solid Wrap Dress', 'Vero Moda', 'Elegant evening wrap dress.', 1799, 3499, 49, 'https://loremflickr.com/500/600/dress,women/all', 2, 4.5, 110, 'Green'),
('Printed A-Line Top', 'ONLY', 'Casual daily wear top.', 599, 1299, 54, 'https://loremflickr.com/500/600/top,women/all', 2, 4.1, 280, 'Yellow'),
('Palazzo Suit Set', 'Biba', 'Traditional blue suit set.', 2499, 4999, 50, 'https://loremflickr.com/500/600/palazzo/all', 2, 4.7, 85, 'Blue'),
('Striped Cotton Shirt', 'DressBerry', 'Formal striped shirt.', 749, 1499, 50, 'https://loremflickr.com/500/600/shirt,women/all', 2, 4.2, 150, 'Pink'),
('Satin Maxi Skirt', 'Mango', 'Flowy satin skirt.', 2199, 3999, 45, 'https://loremflickr.com/500/600/skirt,women/all', 2, 4.6, 40, 'Champagne'),
('Off-Shoulder Crop Top', 'Forever 21', 'Trendy summer crop top.', 499, 999, 50, 'https://loremflickr.com/500/600/croptop/all', 2, 4.0, 420, 'White'),
('Denim Jacket', 'Lee Cooper', 'Classic washed denim jacket.', 1699, 2999, 43, 'https://loremflickr.com/500/600/jacket,denim/all', 2, 4.4, 200, 'Light Blue');

-- 10 KIDS PRODUCTS
INSERT INTO products (name, brand, description, price, mrp, discount, image_url, category_id, rating, review_count, color) VALUES 
('Boys Printed T-shirt', 'Max', 'Cartoon print cotton tee.', 299, 599, 50, 'https://loremflickr.com/500/600/tshirt,kids/all', 3, 4.2, 120, 'Blue'),
('Girls Party Dress', 'Utsa', 'Red lace party dress.', 899, 1799, 50, 'https://loremflickr.com/500/600/dress,kids/all', 3, 4.5, 90, 'Red'),
('Infant Romper Set', 'Mothercare', 'Soft cotton rompers.', 599, 1199, 50, 'https://loremflickr.com/500/600/romper,baby/all', 3, 4.7, 340, 'Multi'),
('Boys Cargo Shorts', 'Gini & Jony', 'Durable cargo shorts.', 649, 1299, 50, 'https://loremflickr.com/500/600/shorts,kids/all', 3, 4.3, 150, 'Grey'),
('Girls Denim Dungarees', 'Allen Solly', 'Trendy denim dungarees.', 1199, 1999, 40, 'https://loremflickr.com/500/600/dungarees,kids/all', 3, 4.4, 60, 'Blue'),
('Boys Graphic Hoodie', 'GAP', 'Cool graphic hoodie.', 1499, 2499, 40, 'https://loremflickr.com/500/600/hoodie,kids/all', 3, 4.6, 80, 'Grey'),
('Girls Floral Leggings', 'Pantaloons', 'Pack of 2 leggings.', 399, 799, 50, 'https://loremflickr.com/500/600/leggings,kids/all', 3, 4.1, 210, 'Multi'),
('Kids Canvas Sneakers', 'Bata', 'Lightweight canvas shoes.', 499, 899, 44, 'https://loremflickr.com/500/600/sneakers,kids/all', 3, 4.2, 500, 'White'),
('Toddler Cotton Pyjamas', 'Cherry Crumble', 'Cozy nightwear set.', 799, 1299, 38, 'https://loremflickr.com/500/600/pyjamas,kids/all', 3, 4.5, 45, 'Yellow'),
('Girls Sequin Top', 'Peppermint', 'Shimmering party top.', 699, 1399, 50, 'https://loremflickr.com/500/600/top,kids/all', 3, 4.3, 110, 'Silver');

-- 10 ACCESSORIES PRODUCTS
INSERT INTO products (name, brand, description, price, mrp, discount, image_url, category_id, rating, review_count, color) VALUES 
('Classic Leather Belt', 'Tommy Hilfiger', 'Genuine brown leather belt.', 1299, 1999, 35, 'https://loremflickr.com/500/600/leather,belt/all', 4, 4.5, 320, 'Brown'),
('Plaid Woolen Scarf', 'H&M', 'Warm winter scarf.', 799, 1499, 46, 'https://loremflickr.com/500/600/plaid,scarf/all', 4, 4.7, 150, 'Red'),
('Cotton Baseball Cap', 'Nike', 'Adjustable sports cap.', 895, 1295, 30, 'https://loremflickr.com/500/600/baseball,cap/all', 4, 4.6, 850, 'Black'),
('Aviator Sunglasses', 'Ray-Ban', 'Classic UV protection shades.', 4590, 5490, 16, 'https://loremflickr.com/500/600/aviator,sunglasses/all', 4, 4.8, 410, 'Green'),
('Canvas Laptop Backpack', 'Wildcraft', 'Durable travel backpack.', 1599, 2499, 36, 'https://loremflickr.com/500/600/canvas,backpack/all', 4, 4.4, 620, 'Navy'),
('Printed Silk Tie', 'Van Heusen', 'Formal wear silk tie.', 999, 1499, 33, 'https://loremflickr.com/500/600/silk,tie/all', 4, 4.3, 110, 'Blue'),
('Analog Men\'s Watch', 'Fossil', 'Stainless steel analog watch.', 6495, 8995, 27, 'https://loremflickr.com/500/600/analog,watch/all', 4, 4.7, 500, 'Silver'),
('RFID Leather Wallet', 'Titan', 'Secure bi-fold men\'s wallet.', 1195, 1595, 25, 'https://loremflickr.com/500/600/leather,wallet/all', 4, 4.5, 290, 'Black'),
('Sterling Silver Ring', 'Giva', 'Elegant minimalist ring.', 1499, 2999, 50, 'https://loremflickr.com/500/600/silver,ring/all', 4, 4.8, 75, 'Silver'),
('Knot Headband', 'Accessorize', 'Stylish hair band for women.', 495, 895, 44, 'https://loremflickr.com/500/600/headband/all', 4, 4.2, 340, 'Pink');

-- Initial Admin User (Password: admin123)
INSERT IGNORE INTO users (name, email, password, role) VALUES ('Admin User', 'admin@fashionstore.com', 'admin123', 'ADMIN');

SELECT COUNT(*) FROM products;

USE fashionstore_db;
INSERT IGNORE INTO users (name, email, password, role, phone) 
VALUES ('John Doe', 'user@gmail.com', 'user123', 'USER', '9876543210');

SELECT * FROM fashionstore_db.products;
