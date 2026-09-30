document.addEventListener('DOMContentLoaded', () => {
    // Modo oscuro
    const themeToggle = document.getElementById('themeToggle');
    if (themeToggle) {
        const root = document.documentElement;
        themeToggle.setAttribute('aria-pressed', root.getAttribute('data-theme') === 'dark');
        themeToggle.addEventListener('click', () => {
            const next = root.getAttribute('data-theme') === 'dark' ? 'light' : 'dark';
            root.setAttribute('data-theme', next);
            localStorage.setItem('kabello-theme', next);
            themeToggle.setAttribute('aria-pressed', next === 'dark');
        });
    }

    // Sombra de cabecera al hacer scroll
    const header = document.getElementById('mainHeader');
    if (header) {
        const toggleHeaderShadow = () => header.classList.toggle('header--scrolled', window.scrollY > 10);
        toggleHeaderShadow();
        window.addEventListener('scroll', toggleHeaderShadow, { passive: true });
    }

    // Barra de progreso de scroll
    const progressBar = document.getElementById('progressBar');
    if (progressBar) {
        const updateProgress = () => {
            const scrollable = document.documentElement.scrollHeight - window.innerHeight;
            const progress = scrollable > 0 ? (window.scrollY / scrollable) * 100 : 0;
            progressBar.style.width = `${progress}%`;
        };
        updateProgress();
        window.addEventListener('scroll', updateProgress, { passive: true });
        window.addEventListener('resize', updateProgress);
    }

    // Animaciones al hacer scroll (fade-up) y contadores numéricos
    const revealTargets = document.querySelectorAll('.reveal');
    const counterTargets = document.querySelectorAll('[data-counter]');
    if ('IntersectionObserver' in window && (revealTargets.length || counterTargets.length)) {
        const revealObserver = new IntersectionObserver((entries, observer) => {
            entries.forEach(entry => {
                if (!entry.isIntersecting) return;
                entry.target.classList.add('is-visible');
                if (entry.target.hasAttribute('data-counter')) {
                    const target = parseInt(entry.target.getAttribute('data-counter'), 10);
                    const duration = 1000;
                    const start = performance.now();
                    const step = (now) => {
                        const progress = Math.min((now - start) / duration, 1);
                        entry.target.textContent = Math.round(progress * target);
                        if (progress < 1) requestAnimationFrame(step);
                    };
                    requestAnimationFrame(step);
                }
                observer.unobserve(entry.target);
            });
        }, { threshold: 0.2 });
        revealTargets.forEach(el => revealObserver.observe(el));
        counterTargets.forEach(el => revealObserver.observe(el));
    } else {
        revealTargets.forEach(el => el.classList.add('is-visible'));
    }

    // Menú Móvil
    const navToggle = document.getElementById('navToggle');
    const mainNav = document.getElementById('mainNav');
    if (navToggle && mainNav) {
        navToggle.addEventListener('click', () => {
            mainNav.querySelector('.nav__list').classList.toggle('active');
        });
        mainNav.querySelectorAll('.nav__link').forEach(link => {
            link.addEventListener('click', () => {
                mainNav.querySelector('.nav__list').classList.remove('active');
            });
        });
    }

    // Slider Antes/Después
    const slider = document.getElementById('comparisonSlider');
    if (slider) {
        const beforeImage = slider.querySelector('.comparison-slider__image--before');
        const handle = document.getElementById('sliderHandle');
        let isDragging = false;
        let autoTimer;
        let autoPosition = 15;
        let autoDirection = 1;

        const setPosition = (position) => {
            position = Math.max(0, Math.min(100, position));
            beforeImage.style.width = `${position}%`;
            handle.style.left = `${position}%`;
        };

        const updateSlider = (x) => {
            const rect = slider.getBoundingClientRect();
            setPosition(((x - rect.left) / rect.width) * 100);
        };

        const stopAutoPlay = () => clearInterval(autoTimer);
        const startAutoPlay = () => {
            if (window.matchMedia('(prefers-reduced-motion: reduce)').matches) return;
            stopAutoPlay();
            autoTimer = setInterval(() => {
                autoPosition += autoDirection;
                if (autoPosition >= 85) autoDirection = -1;
                if (autoPosition <= 15) autoDirection = 1;
                setPosition(autoPosition);
            }, 40);
        };

        slider.addEventListener('mousedown', () => { isDragging = true; stopAutoPlay(); });
        window.addEventListener('mouseup', () => isDragging = false);
        slider.addEventListener('mousemove', (e) => {
            if (!isDragging) return;
            updateSlider(e.clientX);
        });
        slider.addEventListener('mouseenter', stopAutoPlay);
        slider.addEventListener('mouseleave', () => { if (!isDragging) startAutoPlay(); });

        slider.addEventListener('touchstart', () => { isDragging = true; stopAutoPlay(); }, { passive: true });
        window.addEventListener('touchend', () => isDragging = false);
        slider.addEventListener('touchmove', (e) => {
            if (!isDragging) return;
            updateSlider(e.touches[0].clientX);
        });

        slider.addEventListener('click', (e) => { stopAutoPlay(); updateSlider(e.clientX); });

        setPosition(autoPosition);
        startAutoPlay();
    }

    // Carrusel de testimonios
    const carousel = document.getElementById('testimonialCarousel');
    if (carousel) {
        const track = carousel.querySelector('.testimonial-track');
        const slides = Array.from(track.children);
        const dotsWrap = document.getElementById('testimonialDots');
        let index = 0;
        let timer;

        slides.forEach((_, i) => {
            const dot = document.createElement('button');
            dot.className = 'testimonial-dot' + (i === 0 ? ' active' : '');
            dot.setAttribute('aria-label', `Ver testimonio ${i + 1}`);
            dot.addEventListener('click', () => goTo(i));
            dotsWrap.appendChild(dot);
        });
        const dots = Array.from(dotsWrap.children);

        const goTo = (i) => {
            index = (i + slides.length) % slides.length;
            track.style.transform = `translateX(-${index * 100}%)`;
            dots.forEach((d, di) => d.classList.toggle('active', di === index));
        };

        const start = () => {
            if (window.matchMedia('(prefers-reduced-motion: reduce)').matches) return;
            timer = setInterval(() => goTo(index + 1), 6000);
        };
        const stop = () => clearInterval(timer);

        carousel.addEventListener('mouseenter', stop);
        carousel.addEventListener('mouseleave', start);
        carousel.addEventListener('focusin', stop);
        carousel.addEventListener('focusout', start);

        start();
    }
});
