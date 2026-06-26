/* =============================================
   HOME PAGE — JavaScript
   ============================================= */

// ── Hero Slider ───────────────────────────────
(function() {
    const track = document.getElementById('heroTrack');
    const dotsContainer = document.getElementById('heroDots');
    const prevBtn = document.getElementById('heroPrev');
    const nextBtn = document.getElementById('heroNext');

    if (!track) return;

    const slides = track.querySelectorAll('.hero-slide');
    const totalSlides = slides.length;
    let currentSlide = 0;
    let autoPlayInterval;

    // Create dots
    slides.forEach(function(_, i) {
        const dot = document.createElement('div');
        dot.className = 'hero-slider__dot' + (i === 0 ? ' active' : '');
        dot.addEventListener('click', function() { goToSlide(i); });
        dotsContainer.appendChild(dot);
    });

    function goToSlide(index) {
        currentSlide = index;
        track.style.transform = 'translateX(-' + (currentSlide * 100) + '%)';

        // Update dots
        var dots = dotsContainer.querySelectorAll('.hero-slider__dot');
        dots.forEach(function(dot, i) {
            dot.classList.toggle('active', i === currentSlide);
        });
    }

    function nextSlide() {
        goToSlide((currentSlide + 1) % totalSlides);
    }

    function prevSlide() {
        goToSlide((currentSlide - 1 + totalSlides) % totalSlides);
    }

    prevBtn.addEventListener('click', function() {
        prevSlide();
        resetAutoPlay();
    });

    nextBtn.addEventListener('click', function() {
        nextSlide();
        resetAutoPlay();
    });

    // Auto-play
    function startAutoPlay() {
        autoPlayInterval = setInterval(nextSlide, 4000);
    }

    function resetAutoPlay() {
        clearInterval(autoPlayInterval);
        startAutoPlay();
    }

    startAutoPlay();

    // Pause on hover
    var slider = document.getElementById('heroSlider');
    slider.addEventListener('mouseenter', function() { clearInterval(autoPlayInterval); });
    slider.addEventListener('mouseleave', startAutoPlay);
})();


// ── Deals Countdown Timer ─────────────────────
(function() {
    var hoursEl = document.getElementById('timerHours');
    var minsEl = document.getElementById('timerMins');
    var secsEl = document.getElementById('timerSecs');

    if (!hoursEl) return;

    // Set deal end time (8 hours from now)
    var endTime = new Date().getTime() + (8 * 60 * 60 * 1000);

    function updateTimer() {
        var now = new Date().getTime();
        var diff = endTime - now;

        if (diff <= 0) {
            hoursEl.textContent = '00';
            minsEl.textContent = '00';
            secsEl.textContent = '00';
            return;
        }

        var hours = Math.floor(diff / (1000 * 60 * 60));
        var mins = Math.floor((diff % (1000 * 60 * 60)) / (1000 * 60));
        var secs = Math.floor((diff % (1000 * 60)) / 1000);

        hoursEl.textContent = hours < 10 ? '0' + hours : hours;
        minsEl.textContent = mins < 10 ? '0' + mins : mins;
        secsEl.textContent = secs < 10 ? '0' + secs : secs;
    }

    updateTimer();
    setInterval(updateTimer, 1000);
})();


// ── Wishlist Toggle ───────────────────────────
document.querySelectorAll('.product-card-home__wishlist').forEach(function(btn) {
    btn.addEventListener('click', function(e) {
        e.stopPropagation();
        e.preventDefault();
        this.classList.toggle('active');
    });
});


// ── Scroll Reveal Animation ───────────────────
(function() {
    var sections = document.querySelectorAll('.deals-section, .category-section, .offer-strip, .products-home');

    var observer = new IntersectionObserver(function(entries) {
        entries.forEach(function(entry) {
            if (entry.isIntersecting) {
                entry.target.style.opacity = '1';
                entry.target.style.transform = 'translateY(0)';
                observer.unobserve(entry.target);
            }
        });
    }, { threshold: 0.1 });

    sections.forEach(function(section) {
        section.style.opacity = '0';
        section.style.transform = 'translateY(30px)';
        section.style.transition = 'opacity 0.6s ease, transform 0.6s ease';
        observer.observe(section);
    });
})();