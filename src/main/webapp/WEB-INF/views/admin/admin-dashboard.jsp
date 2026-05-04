<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Overview</title>

<style>

body
{
    margin: 0;
    font-family: Arial, sans-serif;
    background: #dcd8c4;
    color: #2e2e2e;
}

.container
{
    max-width: 1100px;
    width: 90%;
    margin: auto;
    padding: 25px 0;
}

.header
{
    display: flex;
    justify-content: space-between;
    align-items: flex-start;
    border-bottom: 1px solid #bdb9a6;
    padding-bottom: 15px;
}

.header-right
{
    display: flex;
    align-items: center;
    gap: 20px;
}

.time
{
    text-align: right;
}

.time small
{
    font-size: 10px;
    color: #777;
}

.btn
{
    background: #4c5c3c;
    color: white;
    padding: 10px 18px;
    border: none;
}

.cards
{
    display: flex;
    gap: 20px;
    margin: 25px 0;
}

.card
{
    flex: 1;
    border: 1px solid #bdb9a6;
    padding: 18px;
    background: transparent;
}

.card.dark
{
    background: #2b2a26;
    color: white;
}

.download
{
    display: flex;
    justify-content: flex-end;
    margin-bottom: 20px;
}

.download button
{
    border: 1px solid #bdb9a6;
    padding: 10px 20px;
    background: transparent;
}

.main
{
    display: flex;
    gap: 40px;
}

.left
{
    flex: 2;
}

.section-title
{
    display: flex;
    justify-content: space-between;
    font-size: 14px;
    margin-bottom: 10px;
}

.telemetry
{
    border: 1px solid #bdb9a6;
    padding: 20px;
}

.telemetry-boxes
{
    display: flex;
    flex-direction: column;
    flex-wrap: wrap;
    gap: 20px;
}
#first-div
{
    display: flex;
    gap: 20px;
}
#second-div
{
    display: flex;
    gap: 20px;
}
.boxes
{
    max-width: 300px;
    width: 50%;
    border: 1px solid #bdb9a6;
    padding: 15px;
    background: #e6e3d3;
}
.right
{
    flex: 1;
}

.activity
{
    border-top: 1px solid #bdb9a6;
}

.activity-item
{
    display: flex;
    justify-content: space-between;
    padding: 15px 0;
    border-bottom: 1px solid #bdb9a6;
    font-size: 14px;
}

.batch
{
    margin-top: 30px;
}

.batch-header
{
    display: flex;
    justify-content: space-between;
    margin-bottom: 10px;
}

.batch-images
{
    display: flex;
    
    gap: 20px;
}

.batch-item
{
    flex: 1;
}

.batch img
{
    width: 100%;
    height: 200px;
    object-fit: cover;
}

@media (max-width: 768px)
{
    #first-div, #second-div
    {
        flex-direction: column;
    }
    .header
    {
        flex-direction: column;
        gap: 10px;
    }

    .header-right
    {
        width: 100%;
        justify-content: space-between;
    }

    .cards
    {
        flex-direction: column;
    }

    .main
    {
        flex-direction: column;
    }

    .boxes
    {
        width: 90%;
    }

    .batch-images
    {
        flex-direction: column;
    }
}

</style>
</head>

<body>

<div class="container">

    <div class="header">
        <div>
            <h1>Overview</h1>
            <p style="font-size:12px;color:#777;">
                Managing the rhythm of handcrafted heritage.
            </p>
        </div>

        <div class="header-right">
            <div class="time">
                <small>LOCAL TIME</small>
                <div>08:42 AM</div>
            </div>
            <button class="btn">NEW COMMISSION</button>
        </div>
    </div>
    <div class="cards">

        <div class="card">
            <small>MONTHLY REVENUE</small>
            <h2>$14,280</h2>
            <small>+12% FROM LAST MONTH</small>
        </div>

        <div class="card">
            <small>OPEN ORDERS</small>
            <h2>42</h2>
            <small>8 AWAITING GLAZING</small>
        </div>

        <div class="card dark">
            <small>KILN STATUS</small>
            <h2>1240°C</h2>
            <small>Firing · Cone 6</small>
        </div>

    </div>
    <div class="download">
        <button>DOWNLOAD REPORT</button>
    </div>
    <div class="main">

        <!-- LEFT -->
        <div class="left">

            <div class="section-title">
                <span>KILN TELEMETRY</span>
                <span style="font-size:10px;">LIVE FEED</span>
            </div>

            <div class="telemetry">
                <div class="telemetry-boxes">

                    <div id="first-div">
                        <div class="boxes">
                            <small>OXYGEN LEVEL</small>
                            <h3>2.4%</h3>
                        </div>

                        <div class="boxes">
                            <small>COOLING RATE</small>
                            <h3>-15°C/hr</h3>
                        </div>
                    </div>

                    <div id="second-div">
                        <div class="boxes">
                            <small>PRESSURE</small>
                            <h3>0.05 inH2O</h3>
                        </div>

                        <div class="boxes">
                            <small>VENTILATION</small>
                            <h3>Active</h3>
                        </div>
                    </div>

                </div>
            </div>

            <!-- BATCH -->
            <div class="batch">

                <div class="batch-header">
                    <span>CURRENT BATCH</span>
                    <span style="font-size:10px;">VIEW INVENTORY</span>
                </div>

                <div class="batch-images">

                    <div class="batch-item">
                        <img src="https" alt="Stoneware series">
                        <p>STONEWARE SERIES 04</p>
                        <small>Quantity: 12 Units</small>
                    </div>

                    <div class="batch-item">
                        <img src="https" alt="Earthen vessel">
                        <p>EARTHEN VESSEL</p>
                        <small>Quantity: 4 Units</small>
                    </div>

                    <div class="batch-item">
                        <img src="https://via.placeholder." alt="Moss Tea set">
                        <p>MOSS TEA SET</p>
                        <small>Quantity: 8 Sets</small>
                    </div>

                </div>

            </div>

        </div>
        <div class="right">

            <h3>RECENT ACTIVITY</h3>

            <div class="activity">

                <div class="activity-item">
                    <span>New order received</span> <span>›</span>
                </div>

                <div class="activity-item">
                    <span>Kiln reached peak temperature</span> <span>›</span>
                </div>

                <div class="activity-item">
                    <span>Inventory alert</span> <span>›</span>
                </div>

                <div class="activity-item">
                    <span>Shipping confirmation</span> <span>›</span>
                </div>

                <div class="activity-item">
                    <span>Workshop booking</span> <span>›</span>
                </div>

            </div>

        </div>

    </div>

</div>

</body>
</html>