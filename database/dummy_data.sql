-- ============================================================
-- Origins Clay – Dummy / Seed Data
-- Run this AFTER pottery_shop_schema.sql
-- ============================================================

USE origins_clay;

-- ==================== CATEGORIES ====================

INSERT INTO categories (name, description) VALUES
('Vases',       'Handcrafted decorative and functional vases'),
('Bowls',       'Artisan bowls for kitchen and display'),
('Mugs',        'Unique ceramic mugs and cups'),
('Plates',      'Dinner plates and decorative platters'),
('Sculptures',  'One-of-a-kind clay sculptures and figurines');

-- ==================== USERS ====================
-- Passwords are BCrypt hashes of "Admin@123" and "User@123" respectively

INSERT INTO users (first_name, last_name, email, phone, address, password, role, approved) VALUES
('Admin',   'User',     'admin@originsclay.com',  '+9771234567', 'Kathmandu, Nepal',
 '$2a$12$LJ3m4ys3Gzv8GKfPbQj4/.LCHgHqR0O3ROTTQ2JQGeXpH9fMvnxW2', 'admin', TRUE),

('Ram',     'Sharma',   'ram@example.com',        '+9779801234',  'Lalitpur, Nepal',
 '$2a$12$wA1cE2bF3gH4iJ5kL6mN7.oP8qR9sT0uV1wX2yZ3aB4cD5eF6gH7', 'customer', TRUE),

('Sita',    'Thapa',    'sita@example.com',       '+9779812345',  'Bhaktapur, Nepal',
 '$2a$12$wA1cE2bF3gH4iJ5kL6mN7.oP8qR9sT0uV1wX2yZ3aB4cD5eF6gH7', 'customer', TRUE),

('Hari',    'Poudel',   'hari@example.com',       '+9779823456',  'Pokhara, Nepal',
 '$2a$12$wA1cE2bF3gH4iJ5kL6mN7.oP8qR9sT0uV1wX2yZ3aB4cD5eF6gH7', 'customer', FALSE);

-- ==================== PRODUCTS ====================

INSERT INTO products (name, description, price, stock_quantity, category_id, image_url, featured) VALUES
('Terracotta Flower Vase',     'A beautifully hand-thrown terracotta vase with earthy glaze.',               45.00,  25, 1, 'images/products/vase1.jpg',      TRUE),
('Midnight Blue Tall Vase',    'Elegant tall vase with a deep midnight blue finish.',                        65.00,  15, 1, 'images/products/vase2.jpg',      TRUE),
('Rustic Mixing Bowl',         'Large rustic mixing bowl, perfect for the kitchen.',                         30.00,  40, 2, 'images/products/bowl1.jpg',      FALSE),
('Glazed Serving Bowl',        'Medium serving bowl with a smooth jade glaze.',                              35.00,  30, 2, 'images/products/bowl2.jpg',      TRUE),
('Speckled Coffee Mug',        'Comfortable grip mug with a speckled cream-and-brown glaze.',               18.00,  60, 3, 'images/products/mug1.jpg',       TRUE),
('Ocean Wave Mug',             'Mug featuring an ocean wave pattern in blues and whites.',                   22.00,  45, 3, 'images/products/mug2.jpg',       FALSE),
('Stoneware Dinner Plate',     'Durable stoneware dinner plate, microwave safe.',                            25.00,  50, 4, 'images/products/plate1.jpg',     FALSE),
('Hand-Painted Platter',       'Large decorative platter with hand-painted floral motifs.',                  55.00,  12, 4, 'images/products/plate2.jpg',     TRUE),
('Abstract Clay Sculpture',    'Modern abstract sculpture, each piece is unique.',                           120.00, 5,  5, 'images/products/sculpture1.jpg', TRUE),
('Mini Animal Figurine Set',   'Set of 4 miniature animal figurines made from white clay.',                  40.00,  20, 5, 'images/products/sculpture2.jpg', FALSE);

-- ==================== ORDERS ====================

INSERT INTO orders (user_id, total_amount, status, shipping_address) VALUES
(2, 110.00, 'delivered',  'Lalitpur, Nepal'),
(2,  18.00, 'shipped',    'Lalitpur, Nepal'),
(3,  55.00, 'processing', 'Bhaktapur, Nepal'),
(3,  65.00, 'pending',    'Bhaktapur, Nepal');

-- ==================== ORDER ITEMS ====================

INSERT INTO order_items (order_id, product_id, quantity, unit_price) VALUES
(1, 1, 1, 45.00),
(1, 4, 1, 35.00),
(1, 5, 1, 18.00),
(1, 6, 1, 12.00),
(2, 5, 1, 18.00),
(3, 8, 1, 55.00),
(4, 2, 1, 65.00);
