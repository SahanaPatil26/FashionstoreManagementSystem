/* =============================================
   CHECKOUT PAGE — JavaScript
   ============================================= */

// ── Show Payment Section ──────────────────────
function showPayment() {
    var paymentSection = document.getElementById('paymentSection');
    var paymentForm = document.getElementById('paymentForm');
    var addressSection = document.getElementById('addressSection');

    if (paymentSection && paymentForm) {
        paymentSection.classList.remove('checkout-section--locked');
        paymentSection.classList.add('active');
        paymentForm.style.display = 'block';

        // Update step indicator
        var steps = document.querySelectorAll('.cart-step');
        if (steps[1]) {
            steps[1].classList.add('completed');
            steps[1].querySelector('.cart-step__num').textContent = '✓';
        }
        if (steps[2]) {
            steps[2].classList.add('active');
        }

        // Scroll to payment
        paymentSection.scrollIntoView({ behavior: 'smooth', block: 'start' });
    }
}

// ── Place Order ───────────────────────────────
function placeOrder() {
    var btn = event.target;
    btn.textContent = 'Processing...';
    btn.disabled = true;

    setTimeout(function() {
        // Redirect to order success
        var ctx = document.querySelector('.header-logo');
        if (ctx) {
            var href = ctx.getAttribute('href');
            var base = href.replace('/home', '');
            window.location.href = base + '/order?action=success';
        } else {
            window.location.href = '/FashionStore/order?action=success';
        }
    }, 1500);
}