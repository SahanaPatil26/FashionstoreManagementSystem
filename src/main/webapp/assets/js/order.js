/* =============================================
   ORDER PAGES — JavaScript
   ============================================= */

// ── Navigate to order details ─────────────────
function openOrder(orderId) {
    window.location.href = window.location.pathname.replace('/order', '/order?action=details&id=' + orderId);
}

// ── Go back to orders list ────────────────────
function back() {
    window.history.back();
}

// ── Go to home ────────────────────────────────
function goHome() {
    var logo = document.querySelector('.header-logo');
    if (logo) {
        window.location.href = logo.getAttribute('href');
    }
}

// ── View orders ───────────────────────────────
function viewOrders() {
    var logo = document.querySelector('.header-logo');
    if (logo) {
        var base = logo.getAttribute('href').replace('/home', '');
        window.location.href = base + '/order';
    }
}