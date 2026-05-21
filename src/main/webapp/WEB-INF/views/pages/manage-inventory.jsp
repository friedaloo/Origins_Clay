<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Manage Inventory</title>
    <style>
        body 
        {
            margin: 0;
            font-family: Arial, sans-serif;
            background: #d9d6c3;
            color: #333;
        }

        .main-container
        {
            max-width: 1100px;
            width: 90%;
            margin: auto;
            padding: 40px 0;
        }
        .text-wth-desc 
        {
            display: flex;
            justify-content: space-between;
            align-items: flex-start;
            flex-wrap: wrap;
            gap: 20px;
        }

        .admin-text
        {
            font-size: 12px;
            letter-spacing: 1px;
            color: #777;
        }

        h1 
        {
            margin: 10px 0;
            font-size: 36px;
        }

        .desc 
        {
            max-width: 400px;
            font-size: 14px;
            color: #555;
        }

        .add-btn 
        {
            background: #4c5c3c;
            color: white;
            padding: 12px 20px;
            border: none;
            letter-spacing: 1px;
            cursor: pointer;
        }

        .search-bar 
        {
            margin: 40px 0px 20px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            border-bottom: 1px solid #aaa;
            padding-bottom: 10px;
            flex-wrap: wrap;
            gap: 15px;
        }

        .search-bar input 
        {
            background: transparent;
            font-size: 14px;
            width: 250px;
            border: none;
            outline: none;
        }

        .options 
        {
            display: flex;
            gap: 20px;
            font-size: 12px;
            color: #555;
        }

        .table 
        {
            width: 100%;
        }
        .table-header 
        {
            display: flex;
            align-items: center;
            padding: 20px 0;
            font-size: 12px;
            color: #777;
            border-bottom: 2px solid #aaa;
            gap: 10px;
        }
        .row 
        {
            display: flex;
            align-items: center;
            padding: 20px 0;
            border-bottom: 1px solid #aaa;
            gap: 10px;
        }

        .product 
        {
            flex: 2;
            display: flex;
            align-items: center;
            gap: 15px;
        }

        .product img 
        {
            width: 60px;
            height: 60px;
            object-fit: cover;
        }

        .product-text 
        {
            font-size: 14px;
        }

        .inside-text 
        {
            font-size: 12px;
            color: #777;
        }

        .column1
        {
            flex: 1;
        }
        .column2
        {
            flex: 0.5;
        }
        .column3
        {
            flex: 0.7;
        }
        .column4
        {
            flex: 0.5;
        }
        .total-pages
        {
            display: flex;
            justify-content: space-between;
            margin-top: 30px;
            font-size: 12px;
            color: #555;
            flex-wrap: wrap;
            gap: 10px;
        }

        .previous-next button 
        {
            padding: 8px 15px;
            border: 1px solid #aaa;
            background: transparent;
            cursor: pointer;
        }

        /* RESPONSIVE  Mobile Part */

        @media (max-width: 768px)
        {
            .text-wth-desc
            {
                flex-direction: column;
                align-items: flex-start;
                gap: 20px;
            }

            .text-wth-desc > div
            {
                width: 100%;
            }

            .desc
            {
                max-width: 100%;
            }

            .add-btn
            {
                width: 100%;
                text-align: center;
            }
            .row 
            {
                flex-direction: column;
                align-items: flex-start;
                gap: 10px;
            }

            .table-header 
            {
                display: none;
            }

            .column1,
            .column2,
            .column3,
            .column4
            {
                width: 100%;
                flex: none;
            }

            .product 
            {
                width: 100%;
            }

            .search-bar 
            {
                flex-direction: column;
                align-items: flex-start;
            }

            .search-bar input 
            {
                width: 100%;
            }

            .total-pages 
            {
                flex-direction: column;
                align-items: center;
                text-align: center;
            }
        }
    </style>
</head>

<body>

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

        <button class="add-btn">+ ADD COLLECTION ITEM</button>
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

        <div class="row">
            <div class="product">
                <img src="http" alt="Image of oatmeal stoneware carafe">
                <div class="product-text">
                    Oatmeal Stoneware Carafe
                    <div class="inside-text">Collection: Slow Morning</div>
                </div>
            </div>
            <div class="column1">EC-ST-204-OAT</div>
            <div class="column2">12</div>
            <div class="column3">$84.00</div>
            <div class="column4">&#x270F; &#x1F5D1;</div>
        </div>
        <div class="row">
            <div class="product">
                <img src="https" alt="image of Deep Earth Ramen bowl">
                <div class="product-text">
                    Deep Earth Ramen Bowl
                    <div class="inside-text">Collection: Ritual Dining</div>
                </div>
            </div>
            <div class="column1">EC-TR-502-CHR</div>
            <div class="column2">4</div>
            <div class="column3">$62.00</div>
            <div class="column4">&#x270F; &#x1F5D1;</div>
        </div>
        <div class="row">
            <div class="product">
                <img src="https" alt="Image of moss rim teacup set">
                <div class="product-text">
                    Moss Rim Teacup Set
                    <div class="inside-text">Collection: Verdant Shadows</div>
                </div>
            </div>
            <div class="column1">EC-PR-110-MSS</div>
            <div class="column2">28</div>
            <div class="column3">$120.00</div>
            <div class="column4">&#x270F; &#x1F5D1;</div>
        </div>
        <div class="row">
            <div class="product">
                <img src="https" alt="Image of Ember Sculptural Plate">
                <div class="product-text">
                    Ember Sculptural Plate
                    <div class="inside-text">Collection: Earth & Fire</div>
                </div>
            </div>
            <div class="column1">EC-ST-308-RST</div>
            <div class="column2">15</div>
            <div class="column3">$95.00</div>
            <div class="column4">&#x270F; &#x1F5D1;</div>
        </div>

    </div>

    <div class="total-pages">
        <div>Showing 4 of 128 products</div>

        <div class="previous-next">
            <button>PREVIOUS</button>
            <button>NEXT</button>
        </div>
    </div>

</div>

</body>
</html>