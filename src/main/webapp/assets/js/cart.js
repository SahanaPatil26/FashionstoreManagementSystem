/* =============================================
   CART PAGE — JavaScript
   ============================================= */

// ── Quantity Change ───────────────────────────
function changeQty(btn, delta) {
    var qtyEl = btn.parentElement.querySelector('.cart-card__qty-val');
    var current = parseInt(qtyEl.textContent);
    var newQty = current + delta;

    if (newQty < 1) newQty = 1;
    if (newQty > 10) newQty = 10;

    qtyEl.textContent = newQty;

    // Animate
    qtyEl.style.transform = 'scale(1.3)';
    qtyEl.style.color = 'var(--primary)';
    setTimeout(function() {
        qtyEl.style.transform = 'scale(1)';
        qtyEl.style.color = '';
    }, 200);
}

// ── Remove Cart Item ──────────────────────────
function removeCartItem(btn) {
    var card = btn.closest('.cart-card');
    if (!card) return;

    card.style.transition = 'all 0.3s ease';
    card.style.opacity = '0';
    card.style.transform = 'translateX(-30px)';
    card.style.maxHeight = card.offsetHeight + 'px';

    setTimeout(function() {
        card.style.maxHeight = '0';
        card.style.padding = '0';
        card.style.margin = '0';
        card.style.overflow = 'hidden';
    }, 300);

    setTimeout(function() {
        card.remove();
    }, 600);
}

// ── Coupon Apply ──────────────────────────────
(function() {
    var applyBtn = document.getElementById('applyCoupon');
    var input = document.getElementById('couponInput');
    var msg = document.getElementById('couponMsg');
    var discountEl = document.getElementById('couponDiscount');

    if (!applyBtn) return;

    var validCoupons = {
        'FASHION10': { discount: 100, label: '₹100 off applied!' },
        'FIRST50': { discount: 50, label: '₹50 off applied!' },
        'SAVE200': { discount: 200, label: '₹200 off applied!' }
    };

    applyBtn.addEventListener('click', function() {
        var code = input.value.trim().toUpperCase();

        if (validCoupons[code]) {
            msg.textContent = '✓ ' + validCoupons[code].label;
            msg.style.display = 'block';
            msg.style.color = 'var(--success)';
            if (discountEl) discountEl.textContent = '-₹' + validCoupons[code].discount;
            input.style.borderColor = 'var(--success)';
        } else if (code === '') {
            msg.textContent = 'Please enter a coupon code';
            msg.style.display = 'block';
            msg.style.color = 'var(--error)';
        } else {
            msg.textContent = '✕ Invalid coupon code';
            msg.style.display = 'block';
            msg.style.color = 'var(--error)';
            input.style.borderColor = 'var(--error)';
        }
    });
})();