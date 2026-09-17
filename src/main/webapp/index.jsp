<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Flipkart - Online Shopping</title>
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="css/responsive.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
</head>
<body>
    <!-- Header -->
    <header class="header">
        <div class="header-container">
            <div class="logo" onclick="location.href='index.html'">
                <span class="logo-flip">Flipkart</span>
                <span class="logo-tagline">Explore <span class="plus">Plus</span> <i class="fas fa-star"></i></span>
            </div>

            <div class="search-bar">
                <i class="fas fa-search"></i>
                <input type="text" id="searchInput" placeholder="Search for products, brands and more">
                <button onclick="searchProducts()">Search</button>
            </div>

            <div class="header-actions">
                <div class="action-item" id="loginBtn">
                    <a href="login.html" class="login-link">Login</a>
                </div>
                <div class="action-item">
                    <a href="orders.html">More <i class="fas fa-chevron-down"></i></a>
                </div>
                <div class="action-item">
                    <a href="cart.html"><i class="fas fa-shopping-cart"></i> Cart <span id="cartCount" class="badge">0</span></a>
                </div>
                <div class="action-item">
                    <a href="wishlist.html"><i class="fas fa-heart"></i> Wishlist</a>
                </div>
            </div>
        </div>
    </header>

    <!-- Category Bar -->
    <nav class="category-bar">
        <div class="category-container">
            <div class="category-item" onclick="filterCategory('Electronics')">
                <i class="fas fa-mobile-alt"></i>
                <span>Electronics</span>
            </div>
            <div class="category-item" onclick="filterCategory('Fashion')">
                <i class="fas fa-tshirt"></i>
                <span>Fashion</span>
            </div>
            <div class="category-item" onclick="filterCategory('Home')">
                <i class="fas fa-home"></i>
                <span>Home</span>
            </div>
            <div class="category-item" onclick="filterCategory('Appliances')">
                <i class="fas fa-tv"></i>
                <span>Appliances</span>
            </div>
            <div class="category-item" onclick="filterCategory('Beauty')">
                <i class="fas fa-spa"></i>
                <span>Beauty</span>
            </div>
            <div class="category-item" onclick="filterCategory('Books')">
                <i class="fas fa-book"></i>
                <span>Books</span>
            </div>
            <div class="category-item" onclick="filterCategory('Sports')">
                <i class="fas fa-futbol"></i>
                <span>Sports</span>
            </div>
            <div class="category-item" onclick="filterCategory('Toys')">
                <i class="fas fa-gamepad"></i>
                <span>Toys</span>
            </div>
        </div>
    </nav>

    <!-- Hero Banner Carousel -->
    <section class="carousel">
        <div class="carousel-inner" id="carousel">
            <div class="carousel-slide">
                <img src="https://via.placeholder.com/1400x300/2874f0/ffffff?text=Big+Billion+Days" alt="Banner 1">
            </div>
            <div class="carousel-slide">
                <img src="https://via.placeholder.com/1400x300/ff6b6b/ffffff?text=Flash+Sale+Live+Now" alt="Banner 2">
            </div>
            <div class="carousel-slide">
                <img src="https://via.placeholder.com/1400x300/f39c12/ffffff?text=Extra+10%25+Off" alt="Banner 3">
            </div>
        </div>
        <button class="carousel-btn prev" onclick="moveSlide(-1)"><i class="fas fa-chevron-left"></i></button>
        <button class="carousel-btn next" onclick="moveSlide(1)"><i class="fas fa-chevron-right"></i></button>
    </section>

    <!-- Filters Section -->
    <section class="filters">
        <div class="filters-container">
            <h3>Filters</h3>
            <div class="filter-group">
                <label>Category:</label>
                <select id="categoryFilter" onchange="applyFilters()">
                    <option value="">All</option>
                    <option value="Electronics">Electronics</option>
                    <option value="Fashion">Fashion</option>
                    <option value="Home">Home</option>
                    <option value="Appliances">Appliances</option>
                    <option value="Books">Books</option>
                </select>
            </div>
            <div class="filter-group">
                <label>Price Range:</label>
                <input type="number" id="minPrice" placeholder="Min" onchange="applyFilters()">
                <input type="number" id="maxPrice" placeholder="Max" onchange="applyFilters()">
            </div>
            <div class="filter-group">
                <label>Sort By:</label>
                <select id="sortBy" onchange="applyFilters()">
                    <option value="createdAt">Newest</option>
                    <option value="sellingPrice">Price: Low to High</option>
                    <option value="averageRating">Rating</option>
                    <option value="discountPercent">Discount</option>
                </select>
            </div>
        </div>
    </section>

    <!-- Deals Section -->
    <section class="deals-section">
        <div class="section-header">
            <h2>🔥 Deals of the Day</h2>
            <button class="view-all" onclick="loadTopDeals()">View All</button>
        </div>
        <div class="products-grid" id="dealsGrid">
            <div class="loading">Loading deals...</div>
        </div>
    </section>

    <!-- Top Rated Section -->
    <section class="deals-section">
        <div class="section-header">
            <h2>⭐ Top Rated Products</h2>
            <button class="view-all" onclick="loadTopRated()">View All</button>
        </div>
        <div class="products-grid" id="topRatedGrid">
            <div class="loading">Loading top rated...</div>
        </div>
    </section>

    <!-- All Products -->
    <section class="deals-section">
        <div class="section-header">
            <h2>🛍️ All Products</h2>
        </div>
        <div class="products-grid" id="productsGrid">
            <div class="loading">Loading products...</div>
        </div>
        <div class="pagination" id="pagination"></div>
    </section>

    <!-- Footer -->
    <footer class="footer">
        <div class="footer-container">
            <div class="footer-col">
                <h4>ABOUT</h4>
                <a href="#">Contact Us</a>
                <a href="#">About Us</a>
                <a href="#">Careers</a>
                <a href="#">Flipkart Stories</a>
            </div>
            <div class="footer-col">
                <h4>HELP</h4>
                <a href="#">Payments</a>
                <a href="#">Shipping</a>
                <a href="#">Cancellation & Returns</a>
                <a href="#">FAQ</a>
            </div>
            <div class="footer-col">
                <h4>CONSUMER POLICY</h4>
                <a href="#">Return Policy</a>
                <a href="#">Terms Of Use</a>
                <a href="#">Security</a>
                <a href="#">Privacy</a>
            </div>
            <div class="footer-col">
                <h4>Mail Us:</h4>
                <p>Flipkart Internet Private Limited,<br>
                Buildings Alyssa, Begonia &<br>
                Clove Embassy Tech Village,<br>
                Bengaluru, 560103,<br>
                Karnataka, India</p>
            </div>
        </div>
        <div class="footer-bottom">
            <p>&copy; 2024 Flipkart Clone. All rights reserved.</p>
        </div>
    </footer>

    <script src="js/config.js"></script>
    <script src="js/auth.js"></script>
    <script src="js/main.js"></script>
</body>
</html>
