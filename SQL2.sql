SET SQL_SAFE_UPDATES = 0;
USE fashionstore_db;

-- 1. MEN PRODUCTS (IDs 1-10)
UPDATE products SET image_url = 'https://images.unsplash.com/photo-1596755094514-f87e34085b2c?w=500' WHERE id = 1;
UPDATE products SET image_url = 'https://images.unsplash.com/photo-1581655353564-df123a1eb820?w=500' WHERE id = 2;
UPDATE products SET image_url = 'https://images.unsplash.com/photo-1542272604-787c3835535d?w=500' WHERE id = 3;
UPDATE products SET image_url = 'https://images.unsplash.com/photo-1556821840-3a63f95609a7?w=500' WHERE id = 4;
UPDATE products SET image_url = 'https://images.unsplash.com/photo-1598454547639-59a39f040287?w=500' WHERE id = 5;
UPDATE products SET image_url = 'https://images.unsplash.com/photo-1473966968600-fa801b869a1a?w=500' WHERE id = 6;
UPDATE products SET image_url = 'https://images.unsplash.com/photo-1521572163474-6864f9cf17ab?w=500' WHERE id = 7;
UPDATE products SET image_url = 'https://images.unsplash.com/photo-1583743814966-8936f5b7be1a?w=500' WHERE id = 8;
UPDATE products SET image_url = 'https://images.unsplash.com/photo-1621072156002-e2fcced0b170?w=500' WHERE id = 9;
UPDATE products SET image_url = 'https://images.unsplash.com/photo-1515886657613-9f3515b0c78f?w=500' WHERE id = 10;

-- 2. WOMEN PRODUCTS (IDs 11-20)
UPDATE products SET image_url = 'https://images.unsplash.com/photo-1610030469983-98e550d6193c?w=500' WHERE id = 11;
UPDATE products SET image_url = 'https://images.unsplash.com/photo-1583391733956-3750e0ff4e8b?w=500' WHERE id = 12;
UPDATE products SET image_url = 'https://images.unsplash.com/photo-1541099649105-f69ad21f3246?w=500' WHERE id = 13;
UPDATE products SET image_url = 'https://images.unsplash.com/photo-1539008835270-383794619d85?w=500' WHERE id = 14;
UPDATE products SET image_url = 'https://images.unsplash.com/photo-1585487000160-6ebcfceb0d03?w=500' WHERE id = 15;
UPDATE products SET image_url = 'https://images.unsplash.com/photo-1567113463300-102550d24943?w=500' WHERE id = 16;
UPDATE products SET image_url = 'https://images.unsplash.com/photo-1551488831-00ddcb6c6bd3?w=500' WHERE id = 17;
UPDATE products SET image_url = 'https://images.unsplash.com/photo-1582142306909-195724d33ffc?w=500' WHERE id = 18;
UPDATE products SET image_url = 'https://images.unsplash.com/photo-1525507119028-ed4c629a60a3?w=500' WHERE id = 19;
UPDATE products SET image_url = 'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?w=500' WHERE id = 20;

-- 3. KIDS PRODUCTS (IDs 21-30)
UPDATE products SET image_url = 'https://images.unsplash.com/photo-1519238263530-99bdd11df2ea?w=500' WHERE id = 21;
UPDATE products SET image_url = 'https://images.unsplash.com/photo-1518833278033-cd58434e213b?w=500' WHERE id = 22;
UPDATE products SET image_url = 'https://images.unsplash.com/photo-1522771935876-2497116a7a9e?w=500' WHERE id = 23;
UPDATE products SET image_url = 'https://images.unsplash.com/photo-1519278470574-c5a45fa356d9?w=500' WHERE id = 24;
UPDATE products SET image_url = 'https://images.unsplash.com/photo-1519457431-75514b7230ed?w=500' WHERE id = 25;
UPDATE products SET image_url = 'https://images.unsplash.com/photo-1503944583220-79d8926ad5e2?w=500' WHERE id = 26;
UPDATE products SET image_url = 'https://images.unsplash.com/photo-1515488042361-ee00e0ddd4e4?w=500' WHERE id = 27;
UPDATE products SET image_url = 'https://images.unsplash.com/photo-1514989940723-e8e51635b782?w=500' WHERE id = 28;
UPDATE products SET image_url = 'https://images.unsplash.com/photo-1522771935876-2497116a7a9e?w=500' WHERE id = 29;
UPDATE products SET image_url = 'https://images.unsplash.com/photo-1518833278033-cd58434e213b?w=500' WHERE id = 30;

-- 4. BEAUTY PRODUCTS (IDs 31-40)
UPDATE products SET image_url = 'https://images.unsplash.com/photo-1586790170083-2f9ceadc732d?w=500' WHERE id = 31;
UPDATE products SET image_url = 'https://images.unsplash.com/photo-1556228720-195a672e8a03?w=500' WHERE id = 32;
UPDATE products SET image_url = 'https://images.unsplash.com/photo-1612817288484-6f916006741a?w=500' WHERE id = 33;
UPDATE products SET image_url = 'https://images.unsplash.com/photo-1512496015851-a90fb38ba796?w=500' WHERE id = 34;
UPDATE products SET image_url = 'https://images.unsplash.com/photo-1556229167-da31d4548f4e?w=500' WHERE id = 35;
UPDATE products SET image_url = 'https://images.unsplash.com/photo-1556228515-01f6a0215b7d?w=500' WHERE id = 36;
UPDATE products SET image_url = 'https://images.unsplash.com/photo-1608248597279-f99d160bfcbc?w=500' WHERE id = 37;
UPDATE products SET image_url = 'https://images.unsplash.com/photo-1556228443-72249c42a1b3?w=500' WHERE id = 38;
UPDATE products SET image_url = 'https://images.unsplash.com/photo-1512496015851-a90fb38ba796?w=500' WHERE id = 39;
UPDATE products SET image_url = 'https://images.unsplash.com/photo-1596462502278-27bfdc4033c8?w=500' WHERE id = 40;

SET SQL_SAFE_UPDATES = 1;
