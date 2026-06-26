/* =============================================
   PRODUCTS PAGE — JavaScript
   ============================================= */

// ── Mobile Filter Toggle ──────────────────────
(function() {
    var filterBtn = document.getElementById('filterMobileBtn');
    var sidebar = document.getElementById('filtersSidebar');

    if (filterBtn && sidebar) {
        filterBtn.addEventListener('click', function() {
            sidebar.classList.toggle('active');
        });

        // Close on outside click
        document.addEventListener('click', function(e) {
            if (sidebar.classList.contains('active') &&
                !sidebar.contains(e.target) &&
                e.target !== filterBtn) {
                sidebar.classList.remove('active');
            }
        });
    }
})();

// ── Wishlist Toggle ───────────────────────────
document.querySelectorAll('.product-card__wishlist').forEach(function(btn) {
    btn.addEventListener('click', function(e) {
        e.stopPropagation();
        e.preventDefault();
        if (this.classList.contains('active')) {
            this.classList.remove('active');
            this.textContent = '♡';
        } else {
            this.classList.add('active');
            this.textContent = '♥';
        }
    });
});

// ── Sort Products ─────────────────────────────
(function() {
    var sortSelect = document.getElementById('sortSelect');
    var grid = document.getElementById('productGrid');

    if (!sortSelect || !grid) return;

    sortSelect.addEventListener('change', function() {
        var cards = Array.from(grid.querySelectorAll('.product-card'));
        var sortBy = this.value;

        cards.sort(function(a, b) {
            if (sortBy === 'price-low') {
                return parseInt(a.dataset.price) - parseInt(b.dataset.price);
            } else if (sortBy === 'price-high') {
                return parseInt(b.dataset.price) - parseInt(a.dataset.price);
            } else if (sortBy === 'rating') {
                return parseFloat(b.dataset.rating) - parseFloat(a.dataset.rating);
            }
            return 0;
        });

        // Re-append sorted cards with animation
        cards.forEach(function(card, i) {
            card.style.opacity = '0';
            card.style.transform = 'translateY(20px)';
            grid.appendChild(card);

            setTimeout(function() {
                card.style.transition = 'opacity 0.3s ease, transform 0.3s ease';
                card.style.opacity = '1';
                card.style.transform = 'translateY(0)';
            }, i * 80);
        });
    });
})();

// ── Search Filter ─────────────────────────────
(function() {
    var searchInput = document.getElementById('searchInput');
    var grid = document.getElementById('productGrid');

    if (!searchInput || !grid) return;

    searchInput.addEventListener('input', function() {
        var query = this.value.toLowerCase().trim();
        var cards = grid.querySelectorAll('.product-card');

        cards.forEach(function(card) {
            var brand = card.querySelector('.product-card__brand');
            var name = card.querySelector('.product-card__name');
            var text = (brand ? brand.textContent : '') + ' ' + (name ? name.textContent : '');

            if (text.toLowerCase().includes(query) || query === '') {
                card.style.display = '';
            } else {
                card.style.display = 'none';
            }
        });
    });
})();

// ── Clear Filters ─────────────────────────────
(function() {
    var clearBtn = document.getElementById('clearFilters');
    if (!clearBtn) return;

    clearBtn.addEventListener('click', function() {
        var inputs = document.querySelectorAll('.filters-sidebar input');
        inputs.forEach(function(input) {
            input.checked = false;
        });
    });
})();