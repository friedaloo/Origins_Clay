-- ============================================================
-- Origins Clay – Pottery Shop Database Schema
-- Database: origins_clay  |  Engine: MariaDB / MySQL
-- ============================================================

CREATE DATABASE IF NOT EXISTS origins_clay
    CHARACTER SET utf8mb4
    COLLATE utf8mb4_general_ci;

USE origins_clay;

-- ==================== CATEGORIES ====================

CREATE TABLE categories (
    id          INT AUTO_INCREMENT PRIMARY KEY,
    name        VARCHAR(100) NOT NULL UNIQUE,
    description VARCHAR(500)
) ENGINE=InnoDB;

-- ==================== PRODUCTS ====================

CREATE TABLE products (
    id              INT AUTO_INCREMENT PRIMARY KEY,
    name            VARCHAR(200)   NOT NULL,
    description     TEXT,
    price           DECIMAL(10,2)  NOT NULL DEFAULT 0.00,
    stock_quantity  INT            NOT NULL DEFAULT 0,
    category_id     INT,
    image_url       VARCHAR(500),
    featured        BOOLEAN        NOT NULL DEFAULT FALSE,
    created_at      TIMESTAMP      DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT fk_product_category
        FOREIGN KEY (category_id) REFERENCES categories(id)
        ON DELETE SET NULL
) ENGINE=InnoDB;

CREATE INDEX idx_product_category ON products(category_id);
CREATE INDEX idx_product_featured ON products(featured);

-- ==================== USERS ====================

CREATE TABLE users (
    id          INT AUTO_INCREMENT PRIMARY KEY,
    first_name  VARCHAR(100)  NOT NULL,
    last_name   VARCHAR(100)  NOT NULL,
    email       VARCHAR(200)  NOT NULL UNIQUE,
    phone       VARCHAR(20),
    address     VARCHAR(500),
    password    VARCHAR(255)  NOT NULL,          -- BCrypt hash
    role        VARCHAR(20)   NOT NULL DEFAULT 'customer',   -- 'customer' | 'admin'
    approved    BOOLEAN       NOT NULL DEFAULT FALSE,
    created_at  TIMESTAMP     DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB;

CREATE INDEX idx_user_email ON users(email);
CREATE INDEX idx_user_role  ON users(role);

-- ==================== ORDERS ====================

CREATE TABLE orders (
    id               INT AUTO_INCREMENT PRIMARY KEY,
    user_id          INT            NOT NULL,
    total_amount     DECIMAL(10,2)  NOT NULL DEFAULT 0.00,
    status           VARCHAR(30)    NOT NULL DEFAULT 'pending',
    shipping_address VARCHAR(500),
    created_at       TIMESTAMP      DEFAULT CURRENT_TIMESTAMP,
    updated_at       TIMESTAMP      DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,

    CONSTRAINT fk_order_user
        FOREIGN KEY (user_id) REFERENCES users(id)
        ON DELETE CASCADE
) ENGINE=InnoDB;

CREATE INDEX idx_order_user   ON orders(user_id);
CREATE INDEX idx_order_status ON orders(status);

-- ==================== ORDER ITEMS ====================

CREATE TABLE order_items (
    id          INT AUTO_INCREMENT PRIMARY KEY,
    order_id    INT            NOT NULL,
    product_id  INT            NOT NULL,
    quantity    INT            NOT NULL DEFAULT 1,
    unit_price  DECIMAL(10,2)  NOT NULL,

    CONSTRAINT fk_item_order
        FOREIGN KEY (order_id)   REFERENCES orders(id)
        ON DELETE CASCADE,
    CONSTRAINT fk_item_product
        FOREIGN KEY (product_id) REFERENCES products(id)
        ON DELETE CASCADE
) ENGINE=InnoDB;

CREATE INDEX idx_item_order   ON order_items(order_id);
CREATE INDEX idx_item_product ON order_items(product_id);
