<%@ page contentType="text/html;charset=UTF-8" %>

<link rel="stylesheet" href="<%=request.getContextPath()%>/assets/css/footer.css">

<footer class="site-footer">

    <!-- Main Footer -->
    <div class="container">
        <div class="footer-grid">

            <!-- Column 1: Online Shopping -->
            <div class="footer-col">
                <h4 class="footer-col__title">Online Shopping</h4>
                <ul class="footer-col__list">
                    <li><a href="<%=request.getContextPath()%>/products">Men</a></li>
                    <li><a href="<%=request.getContextPath()%>/products">Women</a></li>
                    <li><a href="<%=request.getContextPath()%>/products">Kids</a></li>
                    <li><a href="<%=request.getContextPath()%>/products">Footwear</a></li>

                    <li><a href="<%=request.getContextPath()%>/products">Home & Living</a></li>
                    <li><a href="<%=request.getContextPath()%>/products">Accessories</a></li>
                </ul>
            </div>

            <!-- Column 2: Customer Policies -->
            <div class="footer-col">
                <h4 class="footer-col__title">Customer Policies</h4>
                <ul class="footer-col__list">
                    <li><a href="#">Contact Us</a></li>
                    <li><a href="#">FAQ</a></li>
                    <li><a href="#">Terms of Use</a></li>
                    <li><a href="#">Privacy Policy</a></li>
                    <li><a href="#">Track Orders</a></li>
                    <li><a href="#">Shipping Policy</a></li>
                    <li><a href="#">Cancellation</a></li>
                </ul>
            </div>

            <!-- Column 3: Useful Links -->
            <div class="footer-col">
                <h4 class="footer-col__title">Useful Links</h4>
                <ul class="footer-col__list">
                    <li><a href="#">Blog</a></li>
                    <li><a href="#">Careers</a></li>
                    <li><a href="#">Site Map</a></li>
                    <li><a href="#">Corporate Information</a></li>
                    <li><a href="#">Become a Seller</a></li>
                </ul>
            </div>

            <!-- Column 4: Contact & Social -->
            <div class="footer-col">
                <h4 class="footer-col__title">Keep in Touch</h4>

                <!-- Social Icons -->
                <div class="footer-social">
                    <a href="#" class="footer-social__icon" aria-label="Facebook">
                        <svg width="20" height="20" viewBox="0 0 24 24" fill="currentColor"><path d="M18 2h-3a5 5 0 0 0-5 5v3H7v4h3v8h4v-8h3l1-4h-4V7a1 1 0 0 1 1-1h3z"/></svg>
                    </a>
                    <a href="#" class="footer-social__icon" aria-label="Twitter">
                        <svg width="20" height="20" viewBox="0 0 24 24" fill="currentColor"><path d="M22 4s-.7 2.1-2 3.4c1.6 10-9.4 17.3-18 11.6 2.2.1 4.4-.6 6-2C3 15.5.5 9.6 3 5c2.2 2.6 5.6 4.1 9 4-.9-4.2 4-6.6 7-3.8 1.1 0 3-1.2 3-1.2z"/></svg>
                    </a>
                    <a href="#" class="footer-social__icon" aria-label="Instagram">
                        <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><rect x="2" y="2" width="20" height="20" rx="5"/><circle cx="12" cy="12" r="5"/><circle cx="17.5" cy="6.5" r="1.5" fill="currentColor" stroke="none"/></svg>
                    </a>
                    <a href="#" class="footer-social__icon" aria-label="YouTube">
                        <svg width="20" height="20" viewBox="0 0 24 24" fill="currentColor"><path d="M22.54 6.42a2.78 2.78 0 0 0-1.94-2C18.88 4 12 4 12 4s-6.88 0-8.6.46a2.78 2.78 0 0 0-1.94 2A29 29 0 0 0 1 11.75a29 29 0 0 0 .46 5.33A2.78 2.78 0 0 0 3.4 19.1c1.72.46 8.6.46 8.6.46s6.88 0 8.6-.46a2.78 2.78 0 0 0 1.94-2 29 29 0 0 0 .46-5.35 29 29 0 0 0-.46-5.33z"/><polygon points="9.75 15.02 15.5 11.75 9.75 8.48 9.75 15.02" fill="white"/></svg>
                    </a>
                </div>

                <!-- Trust Badges -->
                <div class="footer-trust">
                    <h4 class="footer-col__title" style="margin-top: 24px;">Guarantees</h4>
                    <div class="footer-trust__badges">
                        <div class="footer-trust__badge">
                            <svg width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="var(--success)" stroke-width="2"><path d="M12 22s8-4 8-10V5l-8-3-8 3v7c0 6 8 10 8 10z"/><path d="m9 12 2 2 4-4"/></svg>
                            <span>100% Genuine</span>
                        </div>
                        <div class="footer-trust__badge">
                            <svg width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="var(--success)" stroke-width="2"><path d="M4 14a1 1 0 0 1-.78-1.63l9.9-10.2a.5.5 0 0 1 .86.46l-1.92 6.02A1 1 0 0 0 13 10h7a1 1 0 0 1 .78 1.63l-9.9 10.2a.5.5 0 0 1-.86-.46l1.92-6.02A1 1 0 0 0 11 14z"/></svg>
                            <span>Easy Returns</span>
                        </div>
                        <div class="footer-trust__badge">
                            <svg width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="var(--success)" stroke-width="2"><rect x="1" y="4" width="22" height="16" rx="2"/><path d="M1 10h22"/></svg>
                            <span>Secure Payment</span>
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </div>

    <!-- Bottom Bar -->
    <div class="footer-bottom">
        <div class="container flex-between">
            <p>© 2026 FashionStore. All rights reserved.</p>
            <p>Made with ❤️ in India</p>
        </div>
    </div>

</footer>