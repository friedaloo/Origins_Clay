-- =============================================================================
-- Origins Clay – Pottery Shop Database Schema
-- =============================================================================

CREATE DATABASE IF NOT EXISTS Origins_Clay;
USE Origins_Clay;

-- ---------------------------------------------------------------------------
-- 1. USERS
-- ---------------------------------------------------------------------------
CREATE TABLE users (
    id            INT AUTO_INCREMENT PRIMARY KEY,
    username      VARCHAR(100)  NOT NULL UNIQUE,
    email         VARCHAR(150)  NOT NULL UNIQUE,
    password      VARCHAR(255)  NOT NULL,

    first_name    VARCHAR(100)  NOT NULL,
    last_name     VARCHAR(100)  NOT NULL,
    phone         VARCHAR(20)   NOT NULL UNIQUE,

    address       VARCHAR(255)  DEFAULT NULL,

    role          ENUM('Admin','Customer') NOT NULL DEFAULT 'Customer',
    status        ENUM('Pending','Active') NOT NULL DEFAULT 'Pending',
    image         LONGBLOB      DEFAULT NULL   -- Added: profile picture storage
);

-- ---------------------------------------------------------------------------
-- 2. CATEGORIES
-- ---------------------------------------------------------------------------
CREATE TABLE categories (
    category_id   INT AUTO_INCREMENT PRIMARY KEY,
    category_name VARCHAR(100) NOT NULL UNIQUE,
    description   TEXT
);

-- ---------------------------------------------------------------------------
-- 3. PRODUCTS
-- ---------------------------------------------------------------------------
CREATE TABLE products (
    product_id     INT AUTO_INCREMENT PRIMARY KEY,
    category_id    INT DEFAULT NULL,
    name           VARCHAR(200)  NOT NULL,
    sku            VARCHAR(100)  NOT NULL UNIQUE,
    description    TEXT,
    price          DECIMAL(10,2) NOT NULL,
    stock_quantity INT UNSIGNED  NOT NULL DEFAULT 0,
    image_url      VARCHAR(512),
    status         ENUM('Active','Draft') NOT NULL DEFAULT 'Active',

    CONSTRAINT fk_products_category
        FOREIGN KEY (category_id) REFERENCES categories(category_id)
        ON DELETE SET NULL
);

-- ---------------------------------------------------------------------------
-- 4. ORDERS
-- ---------------------------------------------------------------------------
CREATE TABLE orders (
    order_id         INT AUTO_INCREMENT PRIMARY KEY,
    user_id          INT NOT NULL,  -- references users.id

    shipping_name    VARCHAR(200) NOT NULL,
    shipping_phone   VARCHAR(20)  NOT NULL,
    shipping_address VARCHAR(255) NOT NULL,
    shipping_city    VARCHAR(100) NOT NULL,

    total_amount     DECIMAL(10,2) NOT NULL,
    order_status     ENUM('Pending','Processing','Delivered','Cancelled')
                     DEFAULT 'Pending',
    order_date       DATETIME DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT fk_orders_user
        FOREIGN KEY (user_id) REFERENCES users(id)
        ON DELETE RESTRICT
);

CREATE INDEX idx_order_date ON orders(order_date);

-- ---------------------------------------------------------------------------
-- 5. ORDER_ITEMS
-- ---------------------------------------------------------------------------
CREATE TABLE order_items (
    order_item_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id      INT NOT NULL,
    product_id    INT DEFAULT NULL,
    product_name  VARCHAR(200) NOT NULL,
    quantity      INT NOT NULL,
    unit_price    DECIMAL(10,2) NOT NULL,

    CONSTRAINT fk_item_order
        FOREIGN KEY (order_id) REFERENCES orders(order_id)
        ON DELETE CASCADE
);

-- ---------------------------------------------------------------------------
-- 6. CONTACT QUERIES
-- ---------------------------------------------------------------------------
CREATE TABLE contact_queries (
    query_id     INT AUTO_INCREMENT PRIMARY KEY,
    name         VARCHAR(150) NOT NULL,
    email        VARCHAR(150) NOT NULL,
    subject      VARCHAR(255),
    message      TEXT NOT NULL
);

-- ---------------------------------------------------------------------------
-- 7. SEED DATA
-- ---------------------------------------------------------------------------

-- Insert Categories
INSERT INTO categories (category_name, description) VALUES 
('Functional', 'Handcrafted pottery for everyday use'),
('Sculptural', 'Artistic pieces for display and decor'),
('Process', 'Items showcasing the pottery making process');

-- Insert Products
INSERT INTO products (category_id, name, sku, description, price, stock_quantity, image_url, status) VALUES
(2, 'ASHEN FADE', 'AF-001', 'A beautiful ashen fade vase.', 120.00, 10, 'assets/images/Ashen_Fade.png', 'Active'),
(1, 'MEDOWS VASE', 'MV-001', 'A green meadows vase.', 85.00, 5, 'assets/images/Speckled Stoneware Vase.png', 'Active'),
(2, 'POSIDENS GOLD', 'PG-001', 'A gold-accented sculptural piece.', 250.00, 2, 'assets/images/Posidens_Gold.jpg', 'Active'),
(2, 'BOW OF CINDERS', 'BC-001', 'A dark, textured bowl.', 95.00, 8, 'assets/images/Bow_of_cinders.jpg', 'Active'),
(2, 'SET OF THE VALLEY', 'SV-001', 'A collection of sculptural plates.', 180.00, 3, 'assets/images/Set_of_the_valley.png', 'Active'),
(3, 'MEDOWS COLLECTION', 'MC-001', 'The making of the meadows collection.', 0.00, 1, 'assets/images/Meadows_Collection.jpg', 'Active'),
(2, 'SUNLIGHT DEW COLLECTION', 'SDC-001', 'A set of bright, dew-inspired pieces.', 210.00, 4, 'assets/images/Sunlights_dew_collection.png', 'Active'),
(1, 'SERENITY TEA COLLECTION', 'STC-001', 'A peaceful tea set.', 150.00, 6, 'assets/images/SerenityTea_Set.png', 'Active'),
(1, 'VESSEL OF PHANTOMS', 'VP-001', 'A hauntingly beautiful vessel.', 110.00, 7, 'assets/images/Vessel_of_Phantoms.jpg', 'Active');