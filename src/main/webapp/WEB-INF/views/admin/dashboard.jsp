<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<%-- DIRECTIVE STYLE INCLUDE FOR HEADER --%>
<%@ include file="/WEB-INF/components/header.jsp" %>

<style>
    /* DESIGN STYLES */
    .dashboard-body {
        margin: 0;
        font-family: Arial, sans-serif;
        background: #dcd8c4;
        color: #2e2e2e;
        padding: 25px;
    }

    .container-custom {
        max-width: 1100px;
        margin: auto;
    }

    .header-flex {
        display: flex;
        justify-content: space-between;
        align-items: flex-start;
        border-bottom: 1px solid #bdb9a6;
        padding-bottom: 15px;
    }

    .header-right { display: flex; align-items: center; gap: 20px; }
    .time-block { text-align: right; }
    .time-block small { font-size: 10px; color: #777; }

    .btn-main {
        background: #4c5c3c;
        color: white;
        padding: 10px 18px;
        border: none;
        text-decoration: none;
        cursor: pointer;
    }

    .cards-row {
        display: flex;
        gap: 20px;
        margin: 25px 0;
    }

    .card-stat {
        flex: 1;
        border: 1px solid #bdb9a6;
        padding: 18px;
        background: transparent;
    }

    .card-stat.dark {
        background: #2b2a26;
        color: white;
    }

    .download-wrap {
        display: flex;
        justify-content: flex-end;
        margin-bottom: 20px;
    }

    .btn-download {
        border: 1px solid #bdb9a6;
        padding: 10px 20px;
        background: transparent;
        text-decoration: none;
        color: inherit;
    }

    .main-content {
        display: flex;
        gap: 40px;
    }

    .left-side { flex: 2; }
    .right-side { flex: 1; }

    .telemetry-panel {
        border: 1px solid #bdb9a6;
        padding: 20px;
        margin-top: 10px;
    }

    .telemetry-grid {
        display: grid;
        grid-template-columns: 1fr 1fr;
        gap: 20px;
    }

    .box-data {
        border: 1px solid #bdb9a6;
        padding: 15px;
        background: #e6e3d3;
    }

    .activity-section { border-top: 1px solid #bdb9a6; }
    .activity-row {
        display: flex;
        justify-content: space-between;
        padding: 15px 0;
        border-bottom: 1px solid #bdb9a6;
        font-size: 14px;
    }

    .batch-grid {
        display: flex;
        gap: 20px;
        margin-top: 20px;
    }

    .batch-card { flex: 1; }
    .batch-card img { width: 100%; height: 180px; object-fit: cover; }

    @media (max-width: 768px) {
        .main-content, .cards-row, .telemetry-grid { flex-direction: column; }
    }
</style>

<div class="dashboard-body">
    <div class="container-custom">

        <div class="header-flex">
            <div>
                <h1 style="margin:0;">Overview</h1>
                <p style="font-size:12px;color:#777;">Managing the rhythm of handcrafted heritage.</p>
            </div>

            <div class="header-right">
                <div class="time-block">
                    <small>LOCAL TIME</small>
                    <div id="clockDisplay">--:-- --</div>
                </div>
                <%-- Connection: New Commission Link --%>
                <a href="${pageContext.request.contextPath}/admin/products" class="btn-main">NEW COMMISSION</a>
            </div>
        </div>

        <div class="cards-row">
            <%-- Connection: Total Revenue --%>
            <div class="card-stat">
                <small>MONTHLY REVENUE</small>
                <h2>$${totalRevenue}</h2>
                <small>Updated Live</small>
            </div>

            <%-- Connection: Open Orders --%>
            <div class="card-stat">
                <small>OPEN ORDERS</small>
                <h2>${totalOrders}</h2>
                <c:if test="${pendingOrders > 0}">
                    <small style="color: #8a7040; font-weight: bold;">${pendingOrders} PENDING</small>
                </c:if>
            </div>

            <%-- Connection: Total Products --%>
            <div class="card-stat">
                <small>TOTAL PRODUCTS</small>
                <h2>${totalProducts}</h2>
                <small>In Catalogue</small>
            </div>

            <%-- Connection: Total Users --%>
            <div class="card-stat dark">
                <small>USER BASE</small>
                <h2>${totalUsers}</h2>
                <small>Active Customers</small>
            </div>
        </div>

        <div class="download-wrap">
            <a href="${pageContext.request.contextPath}/admin/reports" class="btn-download">DOWNLOAD REPORT</a>
        </div>

        <div class="main-content">
            <div class="left-side">
                <div style="display:flex; justify-content:space-between; font-size:14px;">
                    <span>KILN TELEMETRY</span>
                    <span style="font-size:10px;">LIVE FEED</span>
                </div>

                <div class="telemetry-panel">
                    <div class="telemetry-grid">
                        <div class="box-data">
                            <small>OXYGEN LEVEL</small>
                            <h3>2.4%</h3>
                        </div>
                        <div class="box-data">
                            <small>COOLING RATE</small>
                            <h3>-15°C/hr</h3>
                        </div>
                        <div class="box-data">
                            <small>PRESSURE</small>
                            <h3>0.05 inH2O</h3>
                        </div>
                        <div class="box-data">
                            <small>VENTILATION</small>
                            <h3>Active</h3>
                        </div>
                    </div>
                </div>

                <div style="margin-top: 30px; display:flex; justify-content:space-between;">
                    <span>CURRENT BATCH</span>
                    <a href="${pageContext.request.contextPath}/admin/products" style="font-size:10px; color:inherit;">VIEW INVENTORY</a>
                </div>

                <div class="batch-grid">
                    <div class="batch-card">
                        <img src="https://images.unsplash.com/photo-1593150501174-873c96769a9b?auto=format&fit=crop&q=80&w=400" alt="Stoneware">
                        <p style="font-size:12px; margin-top:5px;">STONEWARE SERIES 04</p>
                    </div>
                    <div class="batch-card">
                        <img src="https://images.unsplash.com/photo-1565193998248-d51f3c748a4d?auto=format&fit=crop&q=80&w=400" alt="Vessel">
                        <p style="font-size:12px; margin-top:5px;">EARTHEN VESSEL</p>
                    </div>
                </div>
            </div>

            <div class="right-side">
                <h3 style="margin-top:0; font-size: 16px;">RECENT ACTIVITY</h3>
                <div class="activity-section">
                    <div class="activity-row">
                        <a href="${pageContext.request.contextPath}/admin/orders" style="text-decoration:none; color:inherit;">New order received</a>
                        <span>›</span>
                    </div>
                    <div class="activity-row">
                        <span>Kiln reached peak temperature</span>
                        <span>›</span>
                    </div>
                    <div class="activity-row">
                        <a href="${pageContext.request.contextPath}/admin/users" style="text-decoration:none; color:inherit;">New customer signup</a>
                        <span>›</span>
                    </div>
                    <div class="activity-row">
                        <span>Inventory alert</span>
                        <span>›</span>
                    </div>
                </div>
            </div>
        </div>

    </div>
</div>

<script>
    // JS for the live clock in your design
    function runClock() {
        const timeElement = document.getElementById('clockDisplay');
        const now = new Date();
        timeElement.textContent = now.toLocaleTimeString([], { hour: '2-digit', minute: '2-digit' });
    }
    setInterval(runClock, 1000);
    runClock();
</script>

<%-- DIRECTIVE STYLE INCLUDE FOR FOOTER --%>
<%@ include file="/WEB-INF/components/footer.jsp" %>