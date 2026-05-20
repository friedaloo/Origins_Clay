<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<%@ include file="/WEB-INF/components/header.jsp" %>

<style>
    body {
        margin: 0;
        font-family: Arial, sans-serif;
        background: #d9d6c3;
        color: #333;
    }

    .main-container {
        max-width: 1100px;
        width: 90%;	
        margin: auto;
        padding: 40px 0;
    }

    .text-wth-desc {
        display: flex;
        justify-content: space-between;
        align-items: flex-start;
        flex-wrap: wrap;
        gap: 20px;
    }

    .admin-text {
        font-size: 12px;
        letter-spacing: 1px;
        color: #777;
    }

    h1 {
        margin: 10px 0;
        font-size: 36px;
    }

    .desc {
        max-width: 400px;
        font-size: 14px;
        color: #555;
    }

    /* Updated to work well as an <a> tag connection */
    .add-btn {
        background: #4c5c3c;
        color: white;
        padding: 12px 20px;
        border: none;
        letter-spacing: 1px;
        cursor: pointer;
        text-decoration: none;
        display: inline-block;
        text-align: center;
        box-sizing: border-box;
    }

    .search-bar {
        margin: 40px 0px 20px;
        display: flex;
        justify-content: space-between;
        align-items: center;
        border-bottom: 1px solid #aaa;
        padding-bottom: 10px;
        flex-wrap: wrap;
        gap: 15px;
    }

    .search-bar input {
        background: transparent;
        font-size: 14px;
        width: 250px;
        border: none;
        outline: none;
    }

    .options {
        display: flex;
        gap: 20px;
        font-size: 12px;
        color: #555;
    }

    .table {
        width: 100%;
    }

    .table-header {
        display: flex;
        align-items: center;
        padding: 20px 0;
        font-size: 12px;
        color: #777;
        border-bottom: 2px solid #aaa;
        gap: 10px;
    }

    .row {
        display: flex;
        align-items: center;
        padding: 20px 0;
        border-bottom: 1px solid #aaa;
        gap: 10px;
    }

    .product {
        flex: 2;
        display: flex;
        align-items: center;
        gap: 15px;
    }

    .product img {
        width: 60px;
        height: 60px;
        object-fit: cover;
    }

    .product-text {
        font-size: 14px;
    }

    .inside-text {
        font-size: 12px;
        color: #777;
        margin-top: 4px;
    }

    .column1 { flex: 1; }
    .column2 { flex: 0.5; }
    .column3 { flex: 0.7; }
    .column4 { flex: 0.5; display: flex; gap: 15px; align-items: center; }

    .action-icon {
        color: #333;
        text-decoration: none;
        font-size: 16px;
        cursor: pointer;
        background: none;
        border: none;
        padding: 0;
    }

    .total-pages {
        display: flex;
        justify-content: space-between;
        margin-top: 30px;
        font-size: 12px;
        color: #555;
        flex-wrap: wrap;
        gap: 10px;
    }

    .previous-next button {
        padding: 8px 15px;
        border: 1px solid #aaa;
        background: transparent;
        cursor: pointer;
    }

    /* RESPONSIVE Mobile Part */
    @media (max-width: 768px) {
        .text-wth-desc {
            flex-direction: column;
            align-items: flex-start;
            gap: 20px;
        }
        .text-wth-desc > div {
            width: 100%;
        }
        .desc {
            max-width: 100%;
        }
        .add-btn {
            width: 100%;
        }
        .row {
            flex-direction: column;
            align-items: flex-start;
            gap: 10px;
        }
        .table-header {
            display: none;
        }
        .column1, .column2, .column3, .column4 {
            width: 100%;
            flex: none;
        }
        .product {
            width: 100%;
        }
        .search-bar {
            flex-direction: column;
            align-items: flex-start;
        }
        .search-bar input {
            width: 100%;
        }
        .total-pages {
            flex-direction: column;
            align-items: center;
            text-align: center;
        }
    }
</style>

<div class="main-container">

    <div class="text-wth-desc">
        <div>
            <div class="admin-text">ADMIN / INVENTORY</div>
            <h1>Manage Inventory</h1>
            <p class="desc">
                Curate and oversee the Earth & Craft collection. Each piece
                tells a story of heritage and patient craftsmanship.
            </p>
        </div>

        <a href="<%= request.getContextPath() %>/admin/product/add" class="add-btn">+ ADD COLLECTION ITEM</a>
    </div>

    <div class="search-bar">
        <input type="text" placeholder="Search by SKU or Title...">
        <div class="options">
            <span>FILTER</span>
            <span>SORT</span>
        </div>
    </div>

    <div class="table">

        <div class="table-header">
            <div style="flex:2">PIECE</div>
            <div style="flex:1">SKU</div>
            <div style="flex:0.5">STOCK</div>
            <div style="flex:0.7">PRICE</div>
            <div style="flex:0.5">ACTIONS</div>
        </div>

        <%
            java.util.List productList = (java.util.List) request.getAttribute("products");
            if (productList != null && !productList.isEmpty()) {
                for (Object item : productList) {
                    // Pushing item to pageContext allows us to keep using ${product.name} below!
                    pageContext.setAttribute("product", item);
        %>
        
        <div class="row">
            <div class="product">
                <img src="<%= request.getContextPath() %>/${product.imageUrl}" 
                     alt="${product.name}"
                     onerror="this.style.background='#E5E2E0'; this.src='';">
                
                <div class="product-text">
                    ${product.name}
                    <div class="inside-text">Collection: ${product.categoryName}</div>
                </div>
            </div>
            
            <div class="column1">${product.sku}</div>
            
            <div class="column2" style="${product.stockQuantity <= 5 ? 'color: #d9534f; font-weight: bold;' : ''}">
                ${product.stockQuantity}
            </div>
            
            <div class="column3">$${product.price}</div>
            
            <div class="column4">
                <a href="<%= request.getContextPath() %>/admin/product/edit?id=${product.productId}" class="action-icon" title="Edit">
                    &#x270F;
                </a>
                
                <form action="<%= request.getContextPath() %>/admin/product/delete" method="post" onsubmit="return confirm('Delete this product?');" style="margin: 0;">
                    <input type="hidden" name="id" value="${product.productId}">
                    <button type="submit" class="action-icon" title="Delete">&#x1F5D1;</button>
                </form>
            </div>
        </div>

        <%
                }
            } else {
        %>
            <div style="text-align: center; padding: 40px; color: #777;">
                No products found in inventory.
            </div>
        <%
            }
        %>

    </div>

    <div class="total-pages">
        <div>Inventory Management System</div>

        <div class="previous-next">
            <button>PREVIOUS</button>
            <button>NEXT</button>
        </div>
    </div>

</div>

<%@ include file="/WEB-INF/components/footer.jsp" %>