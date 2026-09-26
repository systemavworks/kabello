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

        const updateSlider = (x) => {
            const rect = slider.getBoundingClientRect();
            let position = ((x - rect.left) / rect.width) * 100;
            position = Math.max(0, Math.min(100, position));
            beforeImage.style.width = `${position}%`;
            handle.style.left = `${position}%`;
        };

        slider.addEventListener('mousedown', () => isDragging = true);
        window.addEventListener('mouseup', () => isDragging = false);
        slider.addEventListener('mousemove', (e) => {
            if (!isDragging) return;
            updateSlider(e.clientX);
        });

        slider.addEventListener('touchstart', () => isDragging = true);
        window.addEventListener('touchend', () => isDragging = false);
        slider.addEventListener('touchmove', (e) => {
            if (!isDragging) return;
            updateSlider(e.touches[0].clientX);
        });

        slider.addEventListener('click', (e) => updateSlider(e.clientX));
    }
});
