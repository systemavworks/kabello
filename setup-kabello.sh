#!/bin/bash

# ============================================================================
# KABELLO.ES - Script de Generación Completa del Proyecto
# ============================================================================
# Genera la estructura completa del sitio web para Kabello.es
# Stack: HTML5, CSS3, Vanilla JS, PWA
# Uso: ./setup-kabello.sh
# ============================================================================

set -e

PROJECT_NAME="kabello-web"

echo "🚀 Iniciando generación del proyecto $PROJECT_NAME..."

# Limpiar si ya existe
if [ -d "$PROJECT_NAME" ]; then
    echo "⚠️  La carpeta $PROJECT_NAME ya existe. Eliminándola..."
    rm -rf "$PROJECT_NAME"
fi

# Crear estructura de carpetas
echo "📁 Creando estructura de carpetas..."
mkdir -p "$PROJECT_NAME"/{css,js,assets/{before-after,icons},legal,.well-known}

cd "$PROJECT_NAME"

# ============================================================================
# 1. index.html - Landing Principal
# ============================================================================
echo "🌐 Generando index.html..."
cat > index.html << 'HTMLEOF'
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="Kabello: Prótesis capilares indetectables para hombres con plan de mantenimiento mensual. Recupera tu imagen con naturalidad y discreción.">
    <meta name="theme-color" content="#111111">
    <meta property="og:title" content="Kabello | Prótesis Capilar Masculina por Suscripción">
    <meta property="og:description" content="Recupera tu imagen con naturalidad. Colocación y mantenimiento mensual sin complicaciones.">
    <meta property="og:image" content="https://kabello.es/assets/og-image.webp">
    <meta property="og:url" content="https://kabello.es">
    <title>Kabello | Prótesis Capilar Masculina Premium</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="css/styles.css">
    <link rel="manifest" href="manifest.json">
    <link rel="icon" type="image/png" href="assets/icons/favicon-32.png">
</head>
<body>
    <header class="header">
        <div class="container header__container">
            <a href="/" class="logo">KABELLO<span class="logo__dot">.</span></a>
            <nav class="nav" id="mainNav">
                <ul class="nav__list">
                    <li><a href="servicios.html" class="nav__link">Servicios</a></li>
                    <li><a href="catalogo.html" class="nav__link">Catálogo</a></li>
                    <li><a href="index.html#modelo" class="nav__link">Plan Mensual</a></li>
                    <li><a href="contacto.html" class="nav__link btn btn--primary">Pedir Cita</a></li>
                </ul>
            </nav>
            <button class="nav__toggle" id="navToggle" aria-label="Abrir menú">
                <span></span><span></span><span></span>
            </button>
        </div>
    </header>

    <main>
        <section class="hero">
            <div class="container hero__content">
                <h1 class="hero__title">Recupera tu imagen.<br>Recupera tu <span class="text-accent">confianza</span>.</h1>
                <p class="hero__subtitle">Prótesis capilares indetectables para hombres. Olvídate de los pagos únicos elevados: nosotros nos encargamos de la colocación y el mantenimiento mensual.</p>
                <div class="hero__actions">
                    <a href="https://wa.me/34600000000?text=Hola%20Kabello,%20quiero%20información%20sobre%20el%20plan%20mensual" class="btn btn--primary btn--large" target="_blank" rel="noopener">💬 Consultar por WhatsApp</a>
                    <a href="#modelo" class="btn btn--outline btn--large">Ver cómo funciona</a>
                </div>
            </div>
        </section>

        <section id="servicios" class="section bg-light">
            <div class="container">
                <h2 class="section__title">¿Por qué elegir Kabello?</h2>
                <div class="grid grid--3">
                    <article class="card">
                        <div class="card__icon">🔒</div>
                        <h3>100% Discreto</h3>
                        <p>Entorno privado, atención personalizada y resultados que nadie notará, solo tú.</p>
                    </article>
                    <article class="card">
                        <div class="card__icon">💧</div>
                        <h3>Indetectable y Natural</h3>
                        <p>Bases de última generación (Lace, Skin) que se adaptan a tu cuero cabelludo y permiten transpirar.</p>
                    </article>
                    <article class="card">
                        <div class="card__icon">🔄</div>
                        <h3>Mantenimiento Incluido</h3>
                        <p>No te preocupes por los adhesivos o el cuidado. Tu cuota mensual lo cubre todo.</p>
                    </article>
                </div>
            </div>
        </section>

        <section id="modelo" class="section">
            <div class="container">
                <h2 class="section__title">Un modelo pensado para ti</h2>
                <div class="pricing-wrapper">
                    <div class="pricing-card">
                        <h3>Plan Único</h3>
                        <p class="pricing-card__price">Desde 450€</p>
                        <ul class="pricing-card__list">
                            <li>✅ Colocación inicial</li>
                            <li>❌ Mantenimiento no incluido</li>
                            <li>❌ Productos de cuidado aparte</li>
                        </ul>
                        <a href="contacto.html" class="btn btn--outline">Consultar</a>
                    </div>
                    <div class="pricing-card pricing-card--featured">
                        <div class="badge">Recomendado</div>
                        <h3>Plan Kabello Mensual</h3>
                        <p class="pricing-card__price">99€<span>/mes</span></p>
                        <ul class="pricing-card__list">
                            <li>✅ Colocación inicial <strong>bonificada</strong></li>
                            <li>✅ Mantenimiento y limpieza <strong>ilimitada</strong></li>
                            <li>✅ Kit de productos de cuidado <strong>incluido</strong></li>
                            <li>✅ Citas prioritarias y flexibles</li>
                        </ul>
                        <a href="https://wa.me/34600000000?text=Hola,%20me%20interesa%20el%20Plan%20Kabello%20Mensual" class="btn btn--primary" target="_blank" rel="noopener">Empezar ahora</a>
                    </div>
                </div>
            </div>
        </section>

        <section id="resultados" class="section bg-dark text-light">
            <div class="container">
                <h2 class="section__title text-light">Resultados reales</h2>
                <p class="section__subtitle text-light">Arrastra el control para ver la transformación.</p>
                <div class="comparison-slider" id="comparisonSlider">
                    <div class="comparison-slider__image comparison-slider__image--after">
                        <img src="assets/before-after/after.webp" alt="Resultado final" loading="lazy">
                    </div>
                    <div class="comparison-slider__image comparison-slider__image--before">
                        <img src="assets/before-after/before.webp" alt="Estado inicial" loading="lazy">
                    </div>
                    <div class="comparison-slider__handle" id="sliderHandle">
                        <div class="comparison-slider__line"></div>
                        <div class="comparison-slider__button">↔</div>
                    </div>
                </div>
            </div>
        </section>
    </main>

    <footer class="footer">
        <div class="container footer__grid">
            <div class="footer__brand">
                <span class="logo">KABELLO<span class="logo__dot">.</span></span>
                <p>Estudio capilar masculino.<br>Tu imagen, siempre perfecta.</p>
            </div>
            <div class="footer__links">
                <h4>Legal</h4>
                <ul>
                    <li><a href="legal/aviso-legal.html">Aviso Legal</a></li>
                    <li><a href="legal/privacidad.html">Política de Privacidad</a></li>
                    <li><a href="legal/cookies.html">Política de Cookies</a></li>
                </ul>
            </div>
            <div class="footer__contact">
                <h4>Contacto</h4>
                <p>📧 <a href="mailto:info@kabello.es">info@kabello.es</a></p>
                <p>📱 <a href="https://wa.me/34600000000" target="_blank" rel="noopener">+34 600 000 000</a></p>
            </div>
        </div>
        <div class="container footer__bottom">
            <p>&copy; 2026 Kabello. Todos los derechos reservados.</p>
        </div>
    </footer>

    <a href="https://wa.me/34600000000?text=Hola%20Kabello" class="whatsapp-float" target="_blank" rel="noopener" aria-label="Contactar por WhatsApp">
        <svg viewBox="0 0 24 24" width="32" height="32" fill="currentColor"><path d="M17.472 14.382c-.297-.149-1.758-.867-2.03-.967-.273-.099-.471-.148-.67.15-.197.297-.767.966-.94 1.164-.173.199-.347.223-.644.075-.297-.15-1.255-.463-2.39-1.475-.883-.788-1.48-1.761-1.653-2.059-.173-.297-.018-.458.13-.606.134-.133.298-.347.446-.52.149-.174.198-.298.298-.497.099-.198.05-.371-.025-.52-.075-.149-.669-1.612-.916-2.207-.242-.579-.487-.5-.669-.51-.173-.008-.371-.01-.57-.01-.198 0-.52.074-.792.372-.272.297-1.04 1.016-1.04 2.479 0 1.462 1.065 2.875 1.213 3.074.149.198 2.096 3.2 5.077 4.487.709.306 1.262.489 1.694.625.712.227 1.36.195 1.871.118.571-.085 1.758-.719 2.006-1.413.248-.694.248-1.289.173-1.413-.074-.124-.272-.198-.57-.347m-5.421 7.403h-.004a9.87 9.87 0 01-5.031-1.378l-.361-.214-3.741.982.998-3.648-.235-.374a9.86 9.86 0 01-1.51-5.26c.001-5.45 4.436-9.884 9.888-9.884 2.64 0 5.122 1.03 6.988 2.898a9.825 9.825 0 012.893 6.994c-.003 5.45-4.437 9.884-9.885 9.884m8.413-18.297A11.815 11.815 0 0012.05 0C5.495 0 .16 5.335.157 11.892c0 2.096.547 4.142 1.588 5.945L.057 24l6.305-1.654a11.882 11.882 0 005.683 1.448h.005c6.554 0 11.89-5.335 11.893-11.893a11.821 11.821 0 00-3.48-8.413Z"/></svg>
    </a>

    <script src="js/main.js" defer></script>
    <script src="js/pwa-register.js" defer></script>
</body>
</html>
HTMLEOF

# ============================================================================
# 2. servicios.html
# ============================================================================
echo "🌐 Generando servicios.html..."
cat > servicios.html << 'HTMLEOF'
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="Servicios de colocación y mantenimiento de prótesis capilares en Kabello.">
    <title>Servicios | Kabello</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="css/styles.css">
    <link rel="icon" type="image/png" href="assets/icons/favicon-32.png">
</head>
<body>
    <header class="header">
        <div class="container header__container">
            <a href="/" class="logo">KABELLO<span class="logo__dot">.</span></a>
            <nav class="nav" id="mainNav">
                <ul class="nav__list">
                    <li><a href="servicios.html" class="nav__link">Servicios</a></li>
                    <li><a href="catalogo.html" class="nav__link">Catálogo</a></li>
                    <li><a href="index.html#modelo" class="nav__link">Plan Mensual</a></li>
                    <li><a href="contacto.html" class="nav__link btn btn--primary">Pedir Cita</a></li>
                </ul>
            </nav>
            <button class="nav__toggle" id="navToggle" aria-label="Abrir menú">
                <span></span><span></span><span></span>
            </button>
        </div>
    </header>

    <main>
        <section class="section">
            <div class="container">
                <h1 class="section__title">Nuestros Servicios</h1>
                <p class="section__subtitle">Soluciones capilares completas con mantenimiento incluido</p>
                <div class="grid grid--2">
                    <article class="card card--large">
                        <h3>🎯 Colocación de Prótesis</h3>
                        <p>Proceso profesional y discreto en una sola sesión. Trabajamos con bases de última generación:</p>
                        <ul class="card__list">
                            <li><strong>Lace:</strong> Ultrafina, transpirable, ideal para climas cálidos</li>
                            <li><strong>Skin/Ultrathin:</strong> Máxima naturalidad en el contorno</li>
                            <li><strong>Híbridas:</strong> Lo mejor de ambas tecnologías</li>
                        </ul>
                        <p class="card__note">Tiempo estimado: 1-2 horas | Resultado inmediato</p>
                    </article>
                    <article class="card card--large">
                        <h3>🔄 Mantenimiento Mensual</h3>
                        <p>Con nuestro plan de suscripción, olvidarte del cuidado es nuestra prioridad:</p>
                        <ul class="card__list">
                            <li>Limpieza profunda y desinfección</li>
                            <li>Reposición de adhesivos</li>
                            <li>Corte y estilizado del cabello</li>
                            <li>Revisión del estado de la prótesis</li>
                            <li>Asesoramiento personalizado</li>
                        </ul>
                        <p class="card__note">Frecuencia recomendada: cada 3-4 semanas</p>
                    </article>
                </div>
                <div class="cta-section">
                    <h2>¿Listo para empezar?</h2>
                    <p>Reserva tu valoración gratuita y sin compromiso</p>
                    <a href="https://wa.me/34600000000?text=Hola,%20quiero%20reservar%20una%20valoración%20gratuita" class="btn btn--primary btn--large" target="_blank" rel="noopener">Reservar ahora por WhatsApp</a>
                </div>
            </div>
        </section>
    </main>

    <footer class="footer">
        <div class="container footer__bottom">
            <p>&copy; 2026 Kabello. Todos los derechos reservados.</p>
        </div>
    </footer>

    <script src="js/main.js" defer></script>
</body>
</html>
HTMLEOF

# ============================================================================
# 3. catalogo.html
# ============================================================================
echo "🌐 Generando catalogo.html..."
cat > catalogo.html << 'HTMLEOF'
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="Catálogo de prótesis capilares Kabello. Tipos de bases, colores y texturas disponibles.">
    <title>Catálogo | Kabello</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="css/styles.css">
    <link rel="icon" type="image/png" href="assets/icons/favicon-32.png">
</head>
<body>
    <header class="header">
        <div class="container header__container">
            <a href="/" class="logo">KABELLO<span class="logo__dot">.</span></a>
            <nav class="nav" id="mainNav">
                <ul class="nav__list">
                    <li><a href="servicios.html" class="nav__link">Servicios</a></li>
                    <li><a href="catalogo.html" class="nav__link">Catálogo</a></li>
                    <li><a href="index.html#modelo" class="nav__link">Plan Mensual</a></li>
                    <li><a href="contacto.html" class="nav__link btn btn--primary">Pedir Cita</a></li>
                </ul>
            </nav>
            <button class="nav__toggle" id="navToggle" aria-label="Abrir menú">
                <span></span><span></span><span></span>
            </button>
        </div>
    </header>

    <main>
        <section class="section">
            <div class="container">
                <h1 class="section__title">Catálogo de Prótesis</h1>
                <p class="section__subtitle">Selecciona la base que mejor se adapte a tu estilo de vida</p>
                <div class="grid grid--3">
                    <article class="card">
                        <h3>Lace (Malla)</h3>
                        <p class="card__price">Desde 350€</p>
                        <p>Base de malla ultrafina. Máxima transpiración, ideal para deportistas y climas cálidos.</p>
                        <ul class="card__list">
                            <li>Transpirable</li>
                            <li>Ligera</li>
                            <li>Durabilidad: 6-8 meses</li>
                        </ul>
                    </article>
                    <article class="card">
                        <h3>Skin (Ultrathin)</h3>
                        <p class="card__price">Desde 400€</p>
                        <p>Base de poliuretano ultrafino. Efecto piel real, contorno indetectable.</p>
                        <ul class="card__list">
                            <li>Efecto natural extremo</li>
                            <li>Fácil limpieza</li>
                            <li>Durabilidad: 4-6 meses</li>
                        </ul>
                    </article>
                    <article class="card">
                        <h3>Híbrida</h3>
                        <p class="card__price">Desde 450€</p>
                        <p>Combinación Lace + Skin. Lo mejor de ambas tecnologías en una sola prótesis.</p>
                        <ul class="card__list">
                            <li>Transpirable + Natural</li>
                            <li>Máxima versatilidad</li>
                            <li>Durabilidad: 8-10 meses</li>
                        </ul>
                    </article>
                </div>
                <div class="cta-section">
                    <h2>¿Necesitas asesoramiento?</h2>
                    <p>Te ayudamos a elegir la prótesis perfecta para ti</p>
                    <a href="https://wa.me/34600000000?text=Hola,%20necesito%20asesoramiento%20sobre%20prótesis" class="btn btn--primary btn--large" target="_blank" rel="noopener">Consultar por WhatsApp</a>
                </div>
            </div>
        </section>
    </main>

    <footer class="footer">
        <div class="container footer__bottom">
            <p>&copy; 2026 Kabello. Todos los derechos reservados.</p>
        </div>
    </footer>

    <script src="js/main.js" defer></script>
</body>
</html>
HTMLEOF

# ============================================================================
# 4. contacto.html
# ============================================================================
echo "🌐 Generando contacto.html..."
cat > contacto.html << 'HTMLEOF'
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="Contacta con Kabello. Reserva tu cita, envíanos un email o escríbenos por WhatsApp.">
    <title>Contacto | Kabello</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="css/styles.css">
    <link rel="icon" type="image/png" href="assets/icons/favicon-32.png">
</head>
<body>
    <header class="header">
        <div class="container header__container">
            <a href="/" class="logo">KABELLO<span class="logo__dot">.</span></a>
            <nav class="nav" id="mainNav">
                <ul class="nav__list">
                    <li><a href="servicios.html" class="nav__link">Servicios</a></li>
                    <li><a href="catalogo.html" class="nav__link">Catálogo</a></li>
                    <li><a href="index.html#modelo" class="nav__link">Plan Mensual</a></li>
                    <li><a href="contacto.html" class="nav__link btn btn--primary">Pedir Cita</a></li>
                </ul>
            </nav>
            <button class="nav__toggle" id="navToggle" aria-label="Abrir menú">
                <span></span><span></span><span></span>
            </button>
        </div>
    </header>

    <main>
        <section class="section">
            <div class="container">
                <h1 class="section__title">Contacto</h1>
                <p class="section__subtitle">Estamos aquí para ayudarte</p>
                <div class="grid grid--2">
                    <div class="contact-info">
                        <h2>Información de Contacto</h2>
                        <div class="contact-item">
                            <h3>📱 WhatsApp</h3>
                            <p>Respuesta rápida y directa</p>
                            <a href="https://wa.me/34600000000" class="btn btn--primary" target="_blank" rel="noopener">Abrir WhatsApp</a>
                        </div>
                        <div class="contact-item">
                            <h3>📧 Email</h3>
                            <p>Para consultas detalladas</p>
                            <a href="mailto:info@kabello.es" class="btn btn--outline">info@kabello.es</a>
                        </div>
                        <div class="contact-item">
                            <h3>📍 Ubicación</h3>
                            <p>Andalucía, España</p>
                            <p class="contact-note">Atención con cita previa</p>
                        </div>
                    </div>
                    <div class="contact-form">
                        <h2>Envíanos un Mensaje</h2>
                        <form action="mailto:info@kabello.es" method="POST" enctype="text/plain">
                            <div class="form-group">
                                <label for="name">Nombre</label>
                                <input type="text" id="name" name="name" required>
                            </div>
                            <div class="form-group">
                                <label for="email">Email</label>
                                <input type="email" id="email" name="email" required>
                            </div>
                            <div class="form-group">
                                <label for="phone">Teléfono</label>
                                <input type="tel" id="phone" name="phone">
                            </div>
                            <div class="form-group">
                                <label for="message">Mensaje</label>
                                <textarea id="message" name="message" rows="5" required></textarea>
                            </div>
                            <button type="submit" class="btn btn--primary btn--large">Enviar Mensaje</button>
                        </form>
                    </div>
                </div>
            </div>
        </section>
    </main>

    <footer class="footer">
        <div class="container footer__bottom">
            <p>&copy; 2026 Kabello. Todos los derechos reservados.</p>
        </div>
    </footer>

    <script src="js/main.js" defer></script>
</body>
</html>
HTMLEOF

# ============================================================================
# 5. 404.html
# ============================================================================
echo "🌐 Generando 404.html..."
cat > 404.html << 'HTMLEOF'
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Página no encontrada | Kabello</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="css/styles.css">
</head>
<body>
    <main class="error-page">
        <div class="container">
            <h1>404</h1>
            <h2>Página no encontrada</h2>
            <p>Lo sentimos, la página que buscas no existe o ha sido movida.</p>
            <a href="/" class="btn btn--primary btn--large">Volver al inicio</a>
        </div>
    </main>
</body>
</html>
HTMLEOF

# ============================================================================
# 6. css/styles.css
# ============================================================================
echo "🎨 Generando css/styles.css..."
cat > css/styles.css << 'CSSEOF'
:root {
    --color-bg: #FAFAFA;
    --color-bg-dark: #111111;
    --color-text: #333333;
    --color-text-light: #F5F5F5;
    --color-accent: #2563EB;
    --color-accent-hover: #1D4ED8;
    --color-card-bg: #FFFFFF;
    --font-main: 'Inter', system-ui, -apple-system, sans-serif;
    --spacing-container: 1200px;
    --radius: 8px;
    --shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.1), 0 2px 4px -1px rgba(0, 0, 0, 0.06);
}

* { box-sizing: border-box; margin: 0; padding: 0; }
html { scroll-behavior: smooth; }
body { font-family: var(--font-main); color: var(--color-text); background-color: var(--color-bg); line-height: 1.6; }
img { max-width: 100%; height: auto; display: block; }
a { text-decoration: none; color: inherit; transition: color 0.3s ease; }
ul { list-style: none; }

.container { max-width: var(--spacing-container); margin: 0 auto; padding: 0 1.5rem; }
.section { padding: 5rem 0; }
.bg-light { background-color: #F3F4F6; }
.bg-dark { background-color: var(--color-bg-dark); color: var(--color-text-light); }
.text-accent { color: var(--color-accent); }
.text-light { color: var(--color-text-light); }
.section__title { font-size: 2.5rem; font-weight: 700; text-align: center; margin-bottom: 1rem; }
.section__subtitle { text-align: center; margin-bottom: 3rem; opacity: 0.8; }

.btn { display: inline-block; padding: 0.75rem 1.5rem; border-radius: var(--radius); font-weight: 600; text-align: center; transition: all 0.3s ease; cursor: pointer; border: 2px solid transparent; }
.btn--primary { background-color: var(--color-accent); color: white; }
.btn--primary:hover { background-color: var(--color-accent-hover); }
.btn--outline { border-color: var(--color-text); color: var(--color-text); }
.btn--outline:hover { background-color: var(--color-text); color: white; }
.bg-dark .btn--outline { border-color: var(--color-text-light); color: var(--color-text-light); }
.bg-dark .btn--outline:hover { background-color: var(--color-text-light); color: var(--color-bg-dark); }
.btn--large { padding: 1rem 2rem; font-size: 1.1rem; }

.header { position: sticky; top: 0; background: rgba(255, 255, 255, 0.95); backdrop-filter: blur(10px); z-index: 100; border-bottom: 1px solid #eee; }
.header__container { display: flex; justify-content: space-between; align-items: center; height: 70px; }
.logo { font-size: 1.5rem; font-weight: 700; letter-spacing: -0.5px; }
.logo__dot { color: var(--color-accent); }
.nav__list { display: flex; gap: 2rem; align-items: center; }
.nav__toggle { display: none; background: none; border: none; cursor: pointer; flex-direction: column; gap: 5px; }
.nav__toggle span { display: block; width: 25px; height: 3px; background-color: var(--color-text); }

.hero { position: relative; padding: 8rem 0 6rem; text-align: center; overflow: hidden; }
.hero__title { font-size: 3.5rem; font-weight: 700; line-height: 1.1; margin-bottom: 1.5rem; }
.hero__subtitle { font-size: 1.25rem; max-width: 600px; margin: 0 auto 2.5rem; opacity: 0.8; }
.hero__actions { display: flex; gap: 1rem; justify-content: center; flex-wrap: wrap; }

.grid { display: grid; gap: 2rem; }
.grid--2 { grid-template-columns: repeat(auto-fit, minmax(400px, 1fr)); }
.grid--3 { grid-template-columns: repeat(auto-fit, minmax(300px, 1fr)); }
.card { background: var(--color-card-bg); padding: 2rem; border-radius: var(--radius); box-shadow: var(--shadow); text-align: center; }
.card--large { text-align: left; }
.card__icon { font-size: 2.5rem; margin-bottom: 1rem; }
.card__list { margin: 1rem 0; padding-left: 1.5rem; list-style: disc; }
.card__list li { margin-bottom: 0.5rem; }
.card__note { margin-top: 1rem; font-size: 0.9rem; opacity: 0.7; font-style: italic; }
.card__price { font-size: 1.8rem; font-weight: 700; color: var(--color-accent); margin: 1rem 0; }

.pricing-wrapper { display: flex; gap: 2rem; justify-content: center; flex-wrap: wrap; margin-top: 2rem; }
.pricing-card { background: var(--color-card-bg); padding: 2.5rem; border-radius: var(--radius); box-shadow: var(--shadow); width: 100%; max-width: 350px; text-align: center; position: relative; border: 1px solid #eee; }
.pricing-card--featured { border: 2px solid var(--color-accent); transform: scale(1.05); }
.badge { position: absolute; top: -12px; left: 50%; transform: translateX(-50%); background: var(--color-accent); color: white; padding: 0.25rem 1rem; border-radius: 20px; font-size: 0.85rem; font-weight: 600; }
.pricing-card__price { font-size: 2.5rem; font-weight: 700; margin: 1rem 0; }
.pricing-card__price span { font-size: 1rem; font-weight: 400; opacity: 0.7; }
.pricing-card__list { text-align: left; margin: 1.5rem 0; }
.pricing-card__list li { margin-bottom: 0.75rem; }

.comparison-slider { position: relative; width: 100%; max-width: 800px; margin: 0 auto; aspect-ratio: 16/9; overflow: hidden; border-radius: var(--radius); cursor: col-resize; }
.comparison-slider__image { position: absolute; top: 0; left: 0; width: 100%; height: 100%; }
.comparison-slider__image img { width: 100%; height: 100%; object-fit: cover; }
.comparison-slider__image--before { width: 50%; border-right: 2px solid white; z-index: 2; overflow: hidden; }
.comparison-slider__handle { position: absolute; top: 0; bottom: 0; left: 50%; width: 40px; transform: translateX(-50%); z-index: 3; display: flex; align-items: center; justify-content: center; pointer-events: none; }
.comparison-slider__line { position: absolute; width: 2px; height: 100%; background: white; }
.comparison-slider__button { width: 40px; height: 40px; background: white; border-radius: 50%; display: flex; align-items: center; justify-content: center; box-shadow: 0 2px 6px rgba(0,0,0,0.3); color: #333; font-weight: bold; }

.contact-info, .contact-form { background: var(--color-card-bg); padding: 2.5rem; border-radius: var(--radius); box-shadow: var(--shadow); }
.contact-item { margin-bottom: 2rem; }
.contact-item h3 { margin-bottom: 0.5rem; }
.contact-note { font-size: 0.9rem; opacity: 0.7; margin-top: 0.5rem; }
.form-group { margin-bottom: 1.5rem; }
.form-group label { display: block; margin-bottom: 0.5rem; font-weight: 600; }
.form-group input, .form-group textarea { width: 100%; padding: 0.75rem; border: 1px solid #ddd; border-radius: var(--radius); font-family: var(--font-main); font-size: 1rem; }
.form-group input:focus, .form-group textarea:focus { outline: none; border-color: var(--color-accent); }

.cta-section { text-align: center; margin-top: 4rem; padding: 3rem; background: var(--color-card-bg); border-radius: var(--radius); box-shadow: var(--shadow); }
.cta-section h2 { margin-bottom: 1rem; }
.cta-section p { margin-bottom: 2rem; opacity: 0.8; }

.footer { background: var(--color-bg-dark); color: var(--color-text-light); padding: 4rem 0 2rem; margin-top: 4rem; }
.footer__grid { display: grid; grid-template-columns: repeat(auto-fit, minmax(250px, 1fr)); gap: 3rem; margin-bottom: 3rem; }
.footer__links a:hover, .footer__contact a:hover { color: var(--color-accent); }
.footer__bottom { text-align: center; border-top: 1px solid #333; padding-top: 2rem; font-size: 0.9rem; opacity: 0.7; }

.whatsapp-float { position: fixed; bottom: 2rem; right: 2rem; background: #25D366; color: white; width: 60px; height: 60px; border-radius: 50%; display: flex; align-items: center; justify-content: center; box-shadow: 0 4px 12px rgba(0,0,0,0.3); z-index: 999; transition: transform 0.3s ease; }
.whatsapp-float:hover { transform: scale(1.1); }

.error-page { min-height: 80vh; display: flex; align-items: center; justify-content: center; text-align: center; }
.error-page h1 { font-size: 6rem; color: var(--color-accent); margin-bottom: 1rem; }
.error-page h2 { font-size: 2rem; margin-bottom: 1rem; }
.error-page p { margin-bottom: 2rem; opacity: 0.8; }

@media (max-width: 768px) {
    .nav__toggle { display: flex; }
    .nav__list { position: fixed; top: 70px; left: 0; width: 100%; background: white; flex-direction: column; padding: 2rem; gap: 1.5rem; transform: translateY(-150%); transition: transform 0.3s ease; box-shadow: var(--shadow); }
    .nav__list.active { transform: translateY(0); }
    .hero__title { font-size: 2.5rem; }
    .pricing-card--featured { transform: scale(1); }
    .section__title { font-size: 2rem; }
    .section { padding: 3rem 0; }
}
CSSEOF

# ============================================================================
# 7. js/main.js
# ============================================================================
echo "⚙️  Generando js/main.js..."
cat > js/main.js << 'JSEOF'
document.addEventListener('DOMContentLoaded', () => {
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
JSEOF

# ============================================================================
# 8. js/pwa-register.js
# ============================================================================
echo "⚙️  Generando js/pwa-register.js..."
cat > js/pwa-register.js << 'JSEOF'
if ('serviceWorker' in navigator) {
    window.addEventListener('load', () => {
        navigator.serviceWorker.register('/sw.js')
            .then(reg => console.log('SW registrado:', reg.scope))
            .catch(err => console.log('SW error:', err));
    });
}
JSEOF

# ============================================================================
# 9. manifest.json
# ============================================================================
echo "📱 Generando manifest.json..."
cat > manifest.json << 'JSONEOF'
{
  "name": "Kabello - Prótesis Capilar Masculina",
  "short_name": "Kabello",
  "start_url": "/",
  "display": "standalone",
  "background_color": "#FAFAFA",
  "theme_color": "#111111",
  "icons": [
    {
      "src": "assets/icons/icon-192.png",
      "sizes": "192x192",
      "type": "image/png"
    },
    {
      "src": "assets/icons/icon-512.png",
      "sizes": "512x512",
      "type": "image/png"
    }
  ]
}
JSONEOF

# ============================================================================
# 10. sw.js (Service Worker)
# ============================================================================
echo "🔧 Generando sw.js..."
cat > sw.js << 'SWEOF'
const CACHE_NAME = 'kabello-v1';
const ASSETS = [
    '/',
    '/index.html',
    '/servicios.html',
    '/catalogo.html',
    '/contacto.html',
    '/css/styles.css',
    '/js/main.js',
    '/js/pwa-register.js',
    '/manifest.json'
];

self.addEventListener('install', event => {
    event.waitUntil(
        caches.open(CACHE_NAME).then(cache => cache.addAll(ASSETS))
    );
});

self.addEventListener('fetch', event => {
    event.respondWith(
        caches.match(event.request).then(response => {
            return response || fetch(event.request).then(fetchResponse => {
                return caches.open(CACHE_NAME).then(cache => {
                    if (event.request.url.startsWith(self.location.origin)) {
                        cache.put(event.request, fetchResponse.clone());
                    }
                    return fetchResponse;
                });
            });
        }).catch(() => caches.match('/index.html'))
    );
});

self.addEventListener('activate', event => {
    event.waitUntil(
        caches.keys().then(names => {
            return Promise.all(
                names.filter(name => name !== CACHE_NAME).map(name => caches.delete(name))
            );
        })
    );
});
SWEOF

# ============================================================================
# 11. robots.txt
# ============================================================================
echo "🤖 Generando robots.txt..."
cat > robots.txt << 'ROBEOF'
User-agent: *
Allow: /

# Bloqueo de bots de IA y scraping
User-agent: GPTBot
Disallow: /

User-agent: ChatGPT-User
Disallow: /

User-agent: CCBot
Disallow: /

User-agent: Google-Extended
Disallow: /

User-agent: Omgilibot
Disallow: /

User-agent: FacebookBot
Disallow: /

Sitemap: https://kabello.es/sitemap.xml
ROBEOF

# ============================================================================
# 12. sitemap.xml
# ============================================================================
echo "🗺️  Generando sitemap.xml..."
cat > sitemap.xml << 'SITEMAPEOF'
<?xml version="1.0" encoding="UTF-8"?>
<urlset xmlns="http://www.sitemaps.org/schemas/sitemap/0.9">
    <url>
        <loc>https://kabello.es/</loc>
        <changefreq>weekly</changefreq>
        <priority>1.0</priority>
    </url>
    <url>
        <loc>https://kabello.es/servicios.html</loc>
        <changefreq>monthly</changefreq>
        <priority>0.8</priority>
    </url>
    <url>
        <loc>https://kabello.es/catalogo.html</loc>
        <changefreq>monthly</changefreq>
        <priority>0.8</priority>
    </url>
    <url>
        <loc>https://kabello.es/contacto.html</loc>
        <changefreq>monthly</changefreq>
        <priority>0.7</priority>
    </url>
</urlset>
SITEMAPEOF

# ============================================================================
# 13. _headers (Cloudflare Pages)
# ============================================================================
echo "🔒 Generando _headers..."
cat > _headers << 'HEADEOF'
/*
  X-Frame-Options: DENY
  X-Content-Type-Options: nosniff
  Referrer-Policy: strict-origin-when-cross-origin
  Permissions-Policy: camera=(), microphone=(), geolocation=()
  Strict-Transport-Security: max-age=31536000; includeSubDomains; preload
HEADEOF

# ============================================================================
# 14. .well-known/security.txt
# ============================================================================
echo "🛡️  Generando security.txt..."
cat > .well-known/security.txt << 'SECEOF'
Contact: mailto:info@kabello.es
Preferred-Languages: es, en
Canonical: https://kabello.es/.well-known/security.txt
SECEOF

# ============================================================================
# 15. humans.txt
# ============================================================================
echo "👥 Generando humans.txt..."
cat > humans.txt << 'HUMEOF'
/* TEAM */
Developer: Systema Vworks / AVStack
Site: https://avstack.es
Location: Andalucía, Spain

/* SITE */
Last update: 2026/09/26
Standards: HTML5, CSS3, Vanilla JS
Components: PWA, Service Worker
Software: VS Code, Git
HUMEOF

# ============================================================================
# 16. Placeholders legales (básicos)
# ============================================================================
echo "⚖️  Generando páginas legales básicas..."

cat > legal/aviso-legal.html << 'LEGALEOF'
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Aviso Legal | Kabello</title>
    <link rel="stylesheet" href="../css/styles.css">
</head>
<body>
    <main class="section">
        <div class="container">
            <h1 class="section__title">Aviso Legal</h1>
            <p>En cumplimiento de la Ley 34/2002, de Servicios de la Sociedad de la Información y Comercio Electrónico, le informamos:</p>
            <ul style="margin: 2rem 0; padding-left: 2rem;">
                <li><strong>Titular:</strong> [Nombre del titular]</li>
                <li><strong>NIF/CIF:</strong> [Número de identificación]</li>
                <li><strong>Domicilio:</strong> [Dirección completa]</li>
                <li><strong>Email:</strong> info@kabello.es</li>
                <li><strong>Actividad:</strong> Servicios capilares y venta de prótesis</li>
            </ul>
            <p><a href="../index.html">← Volver al inicio</a></p>
        </div>
    </main>
</body>
</html>
LEGALEOF

cat > legal/privacidad.html << 'PRIVEOF'
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Política de Privacidad | Kabello</title>
    <link rel="stylesheet" href="../css/styles.css">
</head>
<body>
    <main class="section">
        <div class="container">
            <h1 class="section__title">Política de Privacidad</h1>
            <p>En Kabello nos tomamos muy en serio tu privacidad. Esta web no utiliza cookies de terceros, ni sistemas de tracking, ni analítica externa.</p>
            <h2 style="margin-top: 2rem;">Datos que recopilamos</h2>
            <p>Solo los datos que tú nos proporcionas voluntariamente a través del formulario de contacto o WhatsApp.</p>
            <h2 style="margin-top: 2rem;">Tus derechos (RGPD)</h2>
            <p>Puedes ejercer tus derechos de acceso, rectificación, supresión, oposición, limitación y portabilidad escribiendo a info@kabello.es.</p>
            <p style="margin-top: 2rem;"><a href="../index.html">← Volver al inicio</a></p>
        </div>
    </main>
</body>
</html>
PRIVEOF

cat > legal/cookies.html << 'COOKEOF'
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Política de Cookies | Kabello</title>
    <link rel="stylesheet" href="../css/styles.css">
</head>
<body>
    <main class="section">
        <div class="container">
            <h1 class="section__title">Política de Cookies</h1>
            <p><strong>Esta web NO utiliza cookies.</strong></p>
            <p style="margin-top: 1rem;">Solo se utiliza el Service Worker para almacenar en caché los archivos necesarios para que la web funcione sin conexión (PWA). Estos datos se guardan únicamente en tu navegador y pueden eliminarse en cualquier momento desde los ajustes del mismo.</p>
            <p style="margin-top: 2rem;"><a href="../index.html">← Volver al inicio</a></p>
        </div>
    </main>
</body>
</html>
COOKEOF

# ============================================================================
# 17. CNAME (para GitHub Pages)
# ============================================================================
echo "🌐 Generando CNAME..."
echo "kabello.es" > CNAME

# ============================================================================
# 18. Imágenes placeholder (para pruebas)
# ============================================================================
echo "🖼️  Creando imágenes placeholder..."

# Crear un SVG simple como placeholder para before/after
cat > assets/before-after/placeholder.svg << 'SVGEOF'
<svg xmlns="http://www.w3.org/2000/svg" width="800" height="600" viewBox="0 0 800 600">
  <rect width="800" height="600" fill="#e5e7eb"/>
  <text x="400" y="300" font-family="Inter, sans-serif" font-size="32" fill="#6b7280" text-anchor="middle" dominant-baseline="middle">Sustituir por imagen real</text>
</svg>
SVGEOF

# Copiar placeholder como before.webp y after.webp (en producción se reemplazarán)
cp assets/before-after/placeholder.svg assets/before-after/before.webp
cp assets/before-after/placeholder.svg assets/before-after/after.webp

# Crear favicon simple
cat > assets/icons/favicon-32.png << 'ICOEOF'
ICOEOF

# ============================================================================
# Resumen final
# ============================================================================
echo ""
echo "✅ ¡Proyecto $PROJECT_NAME generado con éxito!"
echo ""
echo "📂 Estructura creada:"
find . -type f | sort | sed 's/^/   /'
echo ""
echo "🚀 Próximos pasos:"
echo "   1. cd $PROJECT_NAME"
echo "   2. python3 -m http.server 8080"
echo "   3. Abre http://localhost:8080 en tu navegador"
echo ""
echo "📝 Para personalizar:"
echo "   - Cambia el número de WhatsApp (busca '34600000000' en todos los archivos)"
echo "   - Sustituye las imágenes en assets/before-after/ por las reales (formato WebP)"
echo "   - Añade los iconos PWA en assets/icons/ (icon-192.png, icon-512.png, favicon-32.png)"
echo "   - Rellena los datos legales en legal/aviso-legal.html"
echo ""
echo "🎯 ¡Listo para desarrollar!"
