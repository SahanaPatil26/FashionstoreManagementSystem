/* =============================================
   PRODUCT DETAILS — JavaScript
   ============================================= */

// ── Image Gallery — Thumbnail Click ───────────
function changeImage(thumbEl, color) {
    // Update main image
    var mainImg = document.getElementById('mainImage');
    if (mainImg) {
        mainImg.style.backgroundColor = color;
    }

    // Update active thumb
    document.querySelectorAll('.pd-gallery__thumb').forEach(function(t) {
        t.classList.remove('active');
    });
    thumbEl.classList.add('active');
}

// ── Size Selector ─────────────────────────────
(function() {
    var sizeOptions = document.getElementById('sizeOptions');
    if (!sizeOptions) return;

    sizeOptions.addEventListener('click', function(e) {
        var btn = e.target.closest('.pd-size-btn');
        if (!btn) return;

        // Remove selected from all
        sizeOptions.querySelectorAll('.pd-size-btn').forEach(function(b) {
            b.classList.remove('selected');
        });

        // Add selected to clicked
        btn.classList.add('selected');
    });
})();

// ── Wishlist Toggle (Gallery) ─────────────────
(function() {
    var wishBtn = document.getElementById('pdWishlist');
    if (!wishBtn) return;

    wishBtn.addEventListener('click', function() {
        this.classList.toggle('active');
    });
})();

// ── Wishlist Toggle (Button) ──────────────────
(function() {
    var wishlistBtn = document.getElementById('addToWishlistBtn');
    if (!wishlistBtn) return;

    wishlistBtn.addEventListener('click', function() {
        if (this.classList.contains('active')) {
            this.classList.remove('active');
            this.innerHTML = '<svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M20.84 4.61a5.5 5.5 0 0 0-7.78 0L12 5.67l-1.06-1.06a5.5 5.5 0 0 0-7.78 7.78l1.06 1.06L12 21.23l7.78-7.78 1.06-1.06a5.5 5.5 0 0 0 0-7.78z"/></svg> Wishlist';
        } else {
            this.classList.add('active');
            this.style.color = 'var(--primary)';
            this.style.borderColor = 'var(--primary)';
            this.innerHTML = '<svg width="18" height="18" viewBox="0 0 24 24" fill="var(--primary)" stroke="var(--primary)" stroke-width="2"><path d="M20.84 4.61a5.5 5.5 0 0 0-7.78 0L12 5.67l-1.06-1.06a5.5 5.5 0 0 0-7.78 7.78l1.06 1.06L12 21.23l7.78-7.78 1.06-1.06a5.5 5.5 0 0 0 0-7.78z"/></svg> Wishlisted';
        }
    });
})();

// ── Add to Bag ────────────────────────────────
(function() {
    var addBtn = document.getElementById('addToBagBtn');
    if (!addBtn) return;

    addBtn.addEventListener('click', function() {
        var originalText = this.innerHTML;
        this.innerHTML = '✓ Added to Bag';
        this.style.backgroundColor = 'var(--success)';
        this.style.borderColor = 'var(--success)';

        setTimeout(function() {
            addBtn.innerHTML = originalText;
            addBtn.style.backgroundColor = '';
            addBtn.style.borderColor = '';
        }, 2000);

        // Update cart badge
        var badge = document.getElementById('cartBadge');
        if (badge) {
            var count = parseInt(badge.textContent) || 0;
            badge.textContent = count + 1;
        }
    });
})();

// ── Pincode Check ─────────────────────────────
(function() {
    var checkBtn = document.getElementById('checkPincode');
    var input = document.getElementById('pincodeInput');
    var info = document.getElementById('deliveryInfo');

    if (!checkBtn || !input) return;

    checkBtn.addEventListener('click', function() {
        var pin = input.value.trim();
        if (pin.length !== 6 || isNaN(pin)) {
            input.style.borderColor = 'var(--error)';
            return;
        }

        input.style.borderColor = 'var(--success)';
        if (info) {
            info.style.display = 'flex';
        }
    });
})();