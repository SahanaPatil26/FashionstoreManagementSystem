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
('Slim Fit Casual Shirt', 'Roadster', 'Stylish blue casual shirt.', 599, 1299, 54, '/assets/images/men/image1.avif', 1, 4.2, 150, 'Blue'),
('Regular Fit Polo T-shirt', 'HRX', 'Breathable sports polo.', 499, 999, 50, '/assets/images/men/image2.jpg', 1, 4.5, 230, 'White'),
('Tapered Fit Jeans', 'Levi\'s', 'Classic blue denim jeans.', 1999, 3999, 50, '/assets/images/men/image3.jpg', 1, 4.6, 120, 'Blue'),
('Hooded Sweatshirt', 'Puma', 'Warm and cozy hoodie.', 1299, 2499, 48, '/assets/images/men/image4.avif', 1, 4.3, 90, 'Black'),
('Checks Casual Shirt', 'Highlander', 'Red checks pattern shirt.', 699, 1499, 53, '/assets/images/men/image5.webp', 1, 4.0, 310, 'Red'),
('Cotton Chino Trousers', 'Jack & Jones', 'Comfortable khaki chinos.', 1599, 2999, 46, '/assets/images/men/image6.webp', 1, 4.4, 75, 'Khaki'),
('Solid Round Neck T-shirt', 'U.S. Polo', 'Premium cotton t-shirt.', 399, 799, 50, '/assets/images/men/image7.webp', 1, 4.2, 500, 'Grey'),
('Printed Crew Neck Tee', 'WROGN', 'Trendy printed t-shirt.', 549, 1099, 50, '/assets/images/men/image8.jpg', 1, 4.1, 140, 'Yellow'),
('Linen Casual Shirt', 'Invictus', 'Cool linen for summer.', 1199, 2199, 45, '/assets/images/men/image9.webp', 1, 4.5, 60, 'Peach'),
('Sporty Track Pants', 'Adidas', 'Activewear track pants.', 1899, 2599, 27, '/assets/images/men/image10.jpg', 1, 4.7, 400, 'Navy'),
('Denim Trucker Jacket', 'WROGN', 'Rugged denim jacket.', 2499, 4999, 50, '/assets/images/men/image11.jfif', 1, 4.4, 210, 'Blue'),
('Printed Resort Shirt', 'Highlander', 'Summer beach vibes shirt.', 899, 1799, 50, '/assets/images/men/image12.jpg', 1, 4.2, 130, 'Multi'),
('Slim Fit Chinos', 'US Polo Assn', 'Smart casual chinos.', 1699, 3199, 46, '/assets/images/men/image13.webp', 1, 4.5, 300, 'Olive'),
('Basic V-Neck T-Shirt', 'Roadster', 'Everyday essential v-neck tee.', 449, 899, 50, '/assets/images/men/image14.avif', 1, 4.1, 450, 'Black'),
('Cargo Pants', 'Puma', 'Comfortable utilitarian cargo pants.', 1899, 3499, 45, '/assets/images/men/image15.jpg', 1, 4.6, 180, 'Khaki'),
('Checkered Casual Shirt', 'Levi\'s', 'Classic everyday check shirt.', 1299, 2499, 48, '/assets/images/men/image16.avif', 1, 4.3, 220, 'Navy'),
('Fleece Sweatpants', 'Adidas', 'Cozy lounge and active wear.', 999, 2899, 48, '/assets/images/men/image17.jfif', 1, 4.7, 190, 'Grey'),
('Graphic Printed T-Shirt', 'HRX', 'Athleisure graphic tee.', 599, 1199, 50, '/assets/images/men/image18.webp', 1, 4.4, 340, 'White'),
('Formal Trousers', 'Van Heusen', 'Premium formal wear pants.', 2199, 3999, 45, '/assets/images/men/image19.jpg', 1, 4.5, 110, 'Black'),
('Puffer Winter Jacket', 'Tommy Hilfiger', 'Warm and stylish winter jacket.', 4999, 8999, 44, '/assets/images/men/image20.jfif', 1, 4.8, 90, 'Red');


-- 10 WOMEN PRODUCTS -> NOW 20 WOMEN PRODUCTS
INSERT INTO products (name, brand, description, price, mrp, discount, image_url, category_id, rating, review_count, color) VALUES 
('Floral Print Anarkali', 'Libas', 'Beautiful pink ethnic dress.', 1499, 2999, 50, '/assets/images/women/image 1.jpg', 2, 4.6, 450, 'Pink'),
('Embroidered Straight Kurta', 'W', 'White cotton kurta with embroidery.', 999, 1999, 50, '/assets/images/women/image2.jpg', 2, 4.4, 320, 'White'),
('Blush Royal Anarkali', 'H&M', 'Graceful pink Anarkali', 1299, 2499, 48, '/assets/images/women/image 3.jpg', 2, 4.3, 190, 'Black'),
('Solid Wrap Dress', 'Vero Moda', 'Elegant evening wrap dress.', 1799, 3499, 49, '/assets/images/women/image4.jpg', 2, 4.5, 110, 'Green'),
('Printed A-Line Top', 'ONLY', 'Casual daily wear top.', 599, 1299, 54, '/assets/images/women/image5.jpg', 2, 4.1, 280, 'Yellow'),
('Palazzo Suit Set', 'Biba', 'Traditional blue suit set.', 2499, 4999, 50, '/assets/images/women/image6.jpg', 2, 4.7, 85, 'Blue'),
('Formal Cotton Shirt', 'DressBerry', 'Formal blue shirt.', 749, 1499, 50, '/assets/images/women/image7.jpg', 2, 4.2, 150, 'Pink'),
('Satin Maxi Skirt', 'Mango', 'Flowy satin skirt.', 2199, 1999, 45, '/assets/images/women/image8.jpg', 2, 4.6, 40, 'Champagne'),
('Off-Shoulder Crop Top', 'Forever 21', 'Trendy summer crop top.', 999, 999, 50, '/assets/images/women/image9.jpg', 2, 4.0, 420, 'White'),
('Denim Jacket', 'Lee Cooper', 'Classic washed denim jacket.', 1699, 2999, 43, '/assets/images/women/image10.jpg', 2, 4.4, 200, 'Light Blue'),
('Floral Maxi Dress', 'Vero Moda', 'Flowy summer maxi dress.', 1999, 3999, 50, '/assets/images/women/image11.jpg', 2, 4.6, 250, 'Yellow'),
('High Waist Mom Jeans', 'H&M', 'Trendy high waist denim.', 1499, 2999, 50, '/assets/images/women/image 12.jpg', 2, 4.5, 310, 'Light Blue'),
('Embroidered Tunic', 'Biba', 'Traditional fusion tunic.', 1299, 2499, 48, '/assets/images/women/image 13.jpg', 2, 4.4, 180, 'Pink'),
('Ruffled Crop Top', 'ONLY', 'Cute ruffled summer top.', 799, 1499, 46, '/assets/images/women/image14.jpg', 2, 4.3, 210, 'White'),
('Pleated Midi Skirt', 'Mango', 'Elegant formal midi skirt.', 1099, 4499, 48, '/assets/images/women/image 15.jpg', 2, 4.7, 120, 'Navy'),
('Cotton Chikankari Kurta', 'Libas', 'Handcrafted traditional wear.', 1599, 3199, 50, '/assets/images/women/image 16.jpg', 2, 4.8, 400, 'Peach'),
('Faux Leather Jacket', 'Forever 21', 'Edgy biker style jacket.', 2999, 5999, 50, '/assets/images/women/image17.jpg', 2, 4.5, 150, 'Black'),
('Ribbed Knit Sweater', 'DressBerry', 'Cozy winter wear sweater.', 1199, 2399, 50, '/assets/images/women/image18.jpg', 2, 4.4, 190, 'Beige'),
('Wide Leg Trousers', 'Marks & Spencer', 'Comfortable smart casual pants.', 1899, 3499, 45, '/assets/images/women/image19.jpg', 2, 4.6, 140, 'Olive'),
('Rose Meadow Elegance saree', 'Zivame', 'Beautiful pink green royal saree', 2999, 2799, 46, '/assets/images/women/image20.jpg', 2, 4.7, 280, 'Maroon');

-- 10 KIDS PRODUCTS -> NOW 20 KIDS PRODUCTS
INSERT INTO products (name, brand, description, price, mrp, discount, image_url, category_id, rating, review_count, color) VALUES 
('Boys Printed T-shirt', 'Max', 'Cartoon print cotton tee.', 299, 599, 50, '/assets/images/kids/image1.jpg', 3, 4.2, 120, 'Blue'),
('Girls Party Dress', 'Utsa', 'Red lace party dress.', 1099, 1799, 50, '/assets/images/kids/image2.jpg', 3, 4.5, 90, 'Red'),
('Infant Romper Set', 'Mothercare', 'Soft cotton rompers.', 599, 1199, 50, '/assets/images/kids/image3.webp', 3, 4.7, 340, 'Multi'),
('Boys Cargo Shorts', 'Gini & Jony', 'Durable cargo shorts.', 649, 1299, 50, '/assets/images/kids/image4.avif', 3, 4.3, 150, 'Grey'),
('Girls Denim Dungarees', 'Allen Solly', 'Trendy denim dungarees.', 1199, 1999, 40, '/assets/images/kids/image5.jpg', 3, 4.4, 60, 'Blue'),
('Boys Graphic Hoodie', 'GAP', 'Cool graphic hoodie.', 1499, 2499, 40, '/assets/images/kids/image6.avif', 3, 4.6, 80, 'Grey'),
('Girls Patiala suit', 'Pantaloons', 'cotton silk pink and lime green ', 2999, 3799, 50, '/assets/images/kids/image7.webp', 3, 4.1, 210, 'Multi'),
('Kids Enem gown', 'Bata', ' pink layered net fabric gown', 2499, 3899, 44, '/assets/images/kids/image8.jpg', 3, 4.2, 500, 'White'),
('Toddler Cotton Pyjamas', 'Cherry Crumble', 'Cozy nightwear set.', 799, 1299, 38, '/assets/images/kids/image9.jpg', 3, 4.5, 45, 'Yellow'),
('Printed Top', 'Peppermint', 'Blue cotton top.', 2699, 3399, 50, '/assets/images/kids/image10.webp', 3, 4.3, 110, 'Silver'),
('Dinosaur Print T-Shirt', 'Max', 'Fun graphic tee for girls.', 349, 699, 50, '/assets/images/kids/image11.avif', 3, 4.5, 180, 'Green'),
('Patterned jacket', 'Utsa', 'printed zip-up hooded jacket.', 699, 1399, 50, '/assets/images/kids/image12.jpg', 3, 4.6, 120, 'Pink'),
('Boys Denim Jacket', 'GAP', 'Mini denim trucker jacket.', 1299, 2499, 48, '/assets/images/kids/image13.jpg', 3, 4.7, 90, 'Blue'),
('Girls Floral Jumpsuit', 'Pantaloons', 'Comfortable summer one-piece.', 1599, 1799, 50, '/assets/images/kids/image14.jpg', 3, 4.4, 150, 'Yellow'),
('Ethnic wear', 'Bata', 'Beige and green embroidered sharara suit', 2599, 3999, 45, '/assets/images/kids/image15.webp', 3, 4.3, 210, 'Navy'),
('Tuxedo ', 'Gini & Jony', 'Formal suit set', 1499, 2999, 50, '/assets/images/kids/image16.png', 3, 4.5, 140, 'Olive'),
('Leather jacket', 'Vero ', 'Full length sleeves ,marron faux leather biker jacket.', 1199, 1999, 40, '/assets/images/kids/image17.jpg', 3, 4.8, 300, 'Multi'),
('Girls Ruffled Top', 'Allen Solly', 'Sweet everyday wear top.', 549, 1099, 50, '/assets/images/kids/image18.jpg', 3, 4.4, 110, 'White'),
('Boys Formal Shirt', 'Arrow', 'Crisp shirt for special occasions.', 799, 1599, 50, '/assets/images/kids/image19.jpg', 3, 4.6, 80, 'Light Blue'),
('Kids Winter Beanie', 'Cherry Crumble', 'Warm knitted cap.', 299, 599, 50, '/assets/images/kids/image20.jpg', 3, 4.5, 250, 'Red');


-- 10 ACCESSORIES PRODUCTS -> NOW 20 ACCESSORIES PRODUCTS
INSERT INTO products (name, brand, description, price, mrp, discount, image_url, category_id, rating, review_count, color) VALUES 
('Trefoil Baseball Cap', 'Adidas', 'khaki color cap', 599, 999, 35, '/assets/images/accessories/image14.jfif', 4, 4.5, 320, 'Brown'),
('Plaid Woolen Scarf', 'H&M', 'Warm winter scarf.', 799, 1499, 46, '/assets/images/accessories/image2.jfif', 4, 4.7, 150, 'Red'),
('Plaid winter scarf', 'Layne', 'Color-blocked pattern', 895, 1295, 30, '/assets/images/accessories/image13.avif', 4, 4.6, 850, 'Black'),
('Germain Sweater', 'Phildar', 'Cabeled knit design sweater', 1590, 2490, 16, '/assets/images/accessories/image4.jpg', 4, 4.8, 410, 'Green'),
('showl collar pullover', 'Wildcraft', 'A chunky knit with a wide shawl/roll neck.', 1599, 2499, 36, '/assets/images/accessories/image5.jpg', 4, 4.4, 620, 'Navy'),
('Mens silk ties ', 'Van', 'classic pattterns like polka dots and woven designs', 999, 1499, 33, '/assets/images/accessories/image6.jfif', 4, 4.3, 110, 'Blue'),
('Cashmere scarf', 'Fossil', 'Pashmina wrap or woolen.', 1495, 1995, 27, '/assets/images/accessories/image7.avif', 4, 4.7, 500, 'Silver'),
('Knitted winter beanie', 'Titan', 'Soft acrylic yarn with a warm microfleece lining', 1195, 1595, 25, '/assets/images/accessories/image8.avif', 4, 4.5, 290, 'Black'),
('Waterproof Rain Jacket', 'SaphiRose', 'Khaki-colored trench style raincoat for womens.', 1499, 2999, 50, '/assets/images/accessories/image9.avif', 4, 4.8, 75, 'Silver'),
('Stockholm Raincoat', 'Stutterheim', 'Drawstring hood snap closures .', 495, 895, 44, '/assets/images/accessories/image10.jfif', 4, 4.2, 340, 'Pink'),
('Skinny leather belts ', 'Kastner', '2-pack sets belts .', 990, 1490, 18, '/assets/images/accessories/image11.jpg', 4, 4.7, 320, 'Black'),
('Long puffer coat', 'H&M', 'Water-repellent with modern silhouette.', 1899, 3999, 52, '/assets/images/accessories/image12.jpg', 4, 4.8, 150, 'Gold'),
('Baseball cap', 'H&M', 'Cotton brown baseball cap.', 799, 1099, 17, '/assets/images/accessories/image3.avif', 4, 4.6, 90, 'Brown'),
('Leather belt', 'Casio', 'Black leather belt for mens.', 895, 1595, 15, '/assets/images/accessories/image1.jpg', 4, 4.5, 410, 'Black'),
('Kids winter jacket', 'Valentina', 'Winter puffer coat ,red outer shell ,blue hood lining.', 1899, 3499, 40, '/assets/images/accessories/image15.avif', 4, 4.4, 120, 'Multi'),
('Multicoloured Scarf', 'Haus', 'Abstract geometric printed scarf.', 1999, 3499, 42, '/assets/images/accessories/image16.jpg', 4, 4.7, 180, 'Grey'),
('Earflap hood scarf', 'TinyVail', '2-layer knitted hat ', 1299, 2499, 48, '/assets/images/accessories/image17.jpg', 4, 4.5, 80, 'Navy'),
('Lacoste Cap', 'Lacoste', 'Organic green cotton baseball cap.', 899, 1099, 28, '/assets/images/accessories/image18.webp', 4, 4.6, 210, 'Tan'),
('Striped knit sweater', 'Zara', 'Round neckline and long sleeves stripe pattern in pink and white.', 1890, 2590, 27, '/assets/images/accessories/image19.jpg', 4, 4.4, 60, 'Black'),
('Grey ribbed knit set', 'Maxi', 'Soft  acrylic set.', 1999, 3499, 40, '/assets/images/accessories/image20.jpg', 4, 4.5, 110, 'Silver');

-- Initial Admin User (Password: admin123)
INSERT IGNORE INTO users (name, email, password, role) VALUES ('Admin User', 'admin@fashionstore.com', 'admin123', 'ADMIN');

SELECT COUNT(*) FROM products;

USE fashionstore_db;
INSERT IGNORE INTO users (name, email, password, role, phone) 
VALUES ('John Doe', 'user@gmail.com', 'user123', 'USER', '9876543210');

SELECT * FROM fashionstore_db.products;
