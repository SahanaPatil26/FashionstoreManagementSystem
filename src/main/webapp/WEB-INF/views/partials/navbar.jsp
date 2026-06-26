<%@ page contentType="text/html;charset=UTF-8" %>

    <!-- GLOBAL CSS -->
    <link rel="stylesheet" href="<%=request.getContextPath()%>/assets/css/style.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/assets/css/navbar.css">

    <!-- TOP OFFER STRIP -->
    <div class="top-strip">
        <div class="container flex-between">
            <div class="top-strip__left">
                <span>📱 Download App</span>
                <span class="top-strip__divider">|</span>
                <span>Become a Seller</span>
            </div>
            <div class="top-strip__right">
                <span>🚚 Free Shipping on orders above ₹499</span>
                <span class="top-strip__divider">|</span>
                <span>💳 10% Off on SBI Cards</span>
            </div>
        </div>
    </div>

    <!-- MAIN HEADER -->
    <header class="main-header" id="mainHeader">
        <div class="container header-inner">

            <!-- LOGO -->
            <a href="<%=request.getContextPath()%>/home" class="header-logo">
                <span class="header-logo__text">Fashion</span><span class="header-logo__accent">Store</span>
            </a>

            <!-- CATEGORY NAV LINKS -->
            <nav class="header-nav">
                <a href="<%=request.getContextPath()%>/products?categoryId=1" class="header-nav__link">
                    <span>Men</span>
                    <span class="header-nav__indicator"></span>
                </a>
                <a href="<%=request.getContextPath()%>/products?categoryId=2" class="header-nav__link">
                    <span>Women</span>
                    <span class="header-nav__indicator"></span>
                </a>
                <a href="<%=request.getContextPath()%>/products?categoryId=3" class="header-nav__link">
                    <span>Kids</span>
                    <span class="header-nav__indicator"></span>
                </a>
                <a href="<%=request.getContextPath()%>/products?categoryId=4" class="header-nav__link">
                    <span>Accessories</span>
                    <span class="header-nav__indicator"></span>
                </a>
                <a href="<%=request.getContextPath()%>/products" class="header-nav__link header-nav__link--sale">
                    <span>🔥 Sale</span>
                    <span class="header-nav__indicator"></span>
                </a>
            </nav>

            <!-- SEARCH BAR -->
            <form action="<%=request.getContextPath()%>/products" method="get" class="header-search">
                <svg class="header-search__icon" width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="#94969F"
                    stroke-width="2">
                    <circle cx="11" cy="11" r="8" />
                    <path d="m21 21-4.3-4.3" />
                </svg>
                <input type="text" name="search" class="header-search__input" id="searchInput"
                    placeholder="Search for products, brands and more" value="${searchQuery}">
            </form>

            <!-- RIGHT ACTIONS -->
            <div class="header-actions">

                <% String user=(String) session.getAttribute("user"); %>

                    <!-- Profile -->
                    <div class="header-action" id="profileAction">
                        <a href="<%=request.getContextPath()%>/profile" class="header-action__link">
                            <svg width="22" height="22" viewBox="0 0 24 24" fill="none" stroke="currentColor"
                                stroke-width="1.8">
                                <path d="M20 21v-2a4 4 0 0 0-4-4H8a4 4 0 0 0-4 4v2" />
                                <circle cx="12" cy="7" r="4" />
                            </svg>
                            <span class="header-action__label">
                                <% if (user !=null) { %>
                                    Hi, <%= user %>
                                        <% } else { %>
                                            Profile
                                            <% } %>
                            </span>
                        </a>
                    </div>

                    <!-- Wishlist -->
                    <div class="header-actions">
                        <a href="<%=request.getContextPath()%>/wishlist" class="header-action">
                            <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor"
                                stroke-width="2">
                                <path
                                    d="M19 14c1.49-1.46 3-3.21 3-5.5A5.5 5.5 0 0 0 16.5 3c-1.76 0-3 .5-4.5 2-1.5-1.5-2.74-2-4.5-2A5.5 5.5 0 0 0 2 8.5c0 2.3 1.5 4.05 3 5.5l7 7Z" />
                            </svg>
                            <span class="header-action__label">Wishlist</span>
                        </a>
                    </div>

                    <!-- Cart -->
                    <div class="header-action">
                        <a href="<%=request.getContextPath()%>/cart" class="header-action__link header-action__cart">
                            <svg width="22" height="22" viewBox="0 0 24 24" fill="none" stroke="currentColor"
                                stroke-width="1.8">
                                <path d="M6 2 3 6v14a2 2 0 0 0 2 2h14a2 2 0 0 0 2-2V6l-3-4Z" />
                                <path d="M3 6h18" />
                                <path d="M16 10a4 4 0 0 1-8 0" />
                            </svg>
                            <span class="header-action__label">Cart</span>
                        </a>
                    </div>

                    <% if (user !=null) { %>
                        <!-- My Orders -->
                        <div class="header-action">
                            <a href="<%=request.getContextPath()%>/order" class="header-action__link">
                                <svg width="22" height="22" viewBox="0 0 24 24" fill="none" stroke="currentColor"
                                    stroke-width="1.8">
                                    <rect x="2" y="3" width="20" height="18" rx="2" />
                                    <path d="M8 7h8M8 11h8M8 15h4" />
                                </svg>
                                <span class="header-action__label">Orders</span>
                            </a>
                        </div>

                        <!-- Admin Link (Only for Admin Role) -->
                        <% if ("ADMIN".equals(session.getAttribute("userRole"))) { %>
                            <div class="header-action">
                                <a href="<%=request.getContextPath()%>/admin" class="header-action__link">
                                    <svg width="22" height="22" viewBox="0 0 24 24" fill="none" stroke="currentColor"
                                        stroke-width="1.8">
                                        <path d="M12 22s8-4 8-10V5l-8-3-8 3v7c0 6 8 10 8 10z" />
                                    </svg>
                                    <span class="header-action__label">Admin</span>
                                </a>
                            </div>
                            <% } %>
                                <% } %>
            </div>

            <!-- MOBILE MENU TOGGLE -->
            <button class="header-mobile-toggle" id="mobileMenuToggle" aria-label="Toggle menu">
                <span></span>
                <span></span>
                <span></span>
            </button>

        </div>
    </header>

    <!-- MOBILE MENU OVERLAY -->
    <div class="mobile-menu-overlay" id="mobileMenuOverlay">
        <div class="mobile-menu">
            <div class="mobile-menu__header">
                <span class="header-logo__text">Fashion</span><span class="header-logo__accent">Store</span>
                <button class="mobile-menu__close" id="mobileMenuClose">&times;</button>
            </div>

            <% if (user !=null) { %>
                <div class="mobile-menu__user">
                    <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor"
                        stroke-width="1.8">
                        <path d="M20 21v-2a4 4 0 0 0-4-4H8a4 4 0 0 0-4 4v2" />
                        <circle cx="12" cy="7" r="4" />
                    </svg>
                    <span>Hi, <%= user %></span>
                </div>
                <% } %>

                    <nav class="mobile-menu__nav">
                        <a href="<%=request.getContextPath()%>/home">🏠 Home</a>
                        <a href="<%=request.getContextPath()%>/products?categoryId=1">👔 Men</a>
                        <a href="<%=request.getContextPath()%>/products?categoryId=2">👗 Women</a>
                        <a href="<%=request.getContextPath()%>/products?categoryId=3">👶 Kids</a>
                        <a href="<%=request.getContextPath()%>/products?categoryId=4">👜 Accessories</a>
                        <a href="<%=request.getContextPath()%>/cart">🛒 Cart</a>
                        <a href="<%=request.getContextPath()%>/order">📦 My Orders</a>
                    </nav>

                    <div class="mobile-menu__footer">
                        <% if (user !=null) { %>
                            <a href="<%=request.getContextPath()%>/logout" class="btn-primary btn-block">Logout</a>
                            <% } else { %>
                                <a href="<%=request.getContextPath()%>/login" class="btn-primary btn-block">Login /
                                    Register</a>
                                <% } %>
                    </div>
        </div>
    </div>

    <!-- Navbar Script -->
    <script>
        // Sticky header shadow on scroll
        window.addEventListener('scroll', function () {
            const header = document.getElementById('mainHeader');
            if (window.scrollY > 10) {
                header.classList.add('main-header--scrolled');
            } else {
                header.classList.remove('main-header--scrolled');
            }
        });

        // Mobile menu toggle
        const mobileToggle = document.getElementById('mobileMenuToggle');
        const mobileOverlay = document.getElementById('mobileMenuOverlay');
        const mobileClose = document.getElementById('mobileMenuClose');

        if (mobileToggle) {
            mobileToggle.addEventListener('click', function () {
                mobileOverlay.classList.add('active');
                document.body.style.overflow = 'hidden';
            });
        }

        function closeMobileMenu() {
            mobileOverlay.classList.remove('active');
            document.body.style.overflow = '';
        }

        if (mobileClose) mobileClose.addEventListener('click', closeMobileMenu);
        if (mobileOverlay) mobileOverlay.addEventListener('click', function (e) {
            if (e.target === mobileOverlay) closeMobileMenu();
        });
    </script>