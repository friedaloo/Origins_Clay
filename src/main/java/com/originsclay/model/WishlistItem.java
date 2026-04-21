package com.originsclay.model;

import java.math.BigDecimal;

/**
 * WishlistItem model - session-based wishlist entry.
 */
public class WishlistItem {

    private int productId;
    private String productName;
    private BigDecimal price;
    private String imageUrl;
    private boolean inStock;

    public WishlistItem() {}

    public WishlistItem(int productId, String productName, BigDecimal price,
                        String imageUrl, boolean inStock) {
        this.productId = productId;
        this.productName = productName;
        this.price = price;
        this.imageUrl = imageUrl;
        this.inStock = inStock;
    }

    // ---------- Getters & Setters ----------

    public int getProductId() { return productId; }
    public void setProductId(int productId) { this.productId = productId; }

    public String getProductName() { return productName; }
    public void setProductName(String productName) { this.productName = productName; }

    public BigDecimal getPrice() { return price; }
    public void setPrice(BigDecimal price) { this.price = price; }

    public String getImageUrl() { return imageUrl; }
    public void setImageUrl(String imageUrl) { this.imageUrl = imageUrl; }

    public boolean isInStock() { return inStock; }
    public void setInStock(boolean inStock) { this.inStock = inStock; }
}
