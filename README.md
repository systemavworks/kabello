# kabello
# Kabello Web Platform

Sitio web corporativo y catálogo digital para **Kabello** (kabello.es) — servicio premium de colocación y mantenimiento de prótesis capilares para hombres con modelo de suscripción mensual. 

Construido con HTML, CSS y JavaScript puro. Sin frameworks. Sin tracking. Privacidad y rendimiento por diseño.

![HTML5](https://img.shields.io/badge/HTML5-E34F26?style=flat&logo=html5&logoColor=white)
![CSS3](https://img.shields.io/badge/CSS3-1572B6?style=flat&logo=css3&logoColor=white)
![Vanilla JS](https://img.shields.io/badge/JavaScript-F7DF1E?style=flat&logo=javascript&logoColor=black)
![PWA](https://img.shields.io/badge/PWA-5A0FC8?style=flat&logo=pwa&logoColor=white)
![Lighthouse](https://img.shields.io/badge/Lighthouse-100/100-brightgreen)

---

## ⚡ Características Principales

* **Rendimiento Extremo:** 0 dependencias de runtime, 0 frameworks. Carga instantánea garantizada.
* **PWA Offline-First:** Service Worker con estrategia híbrida (Cache-First para assets, Network-First para contenido dinámico). Funciona sin conexión.
* **Privacidad por Diseño:** Sin Google Analytics, sin cookies de terceros, sin rastreadores. Cumplimiento estricto del RGPD.
* **UX/UI Premium:** Diseño responsive, modo oscuro/claro nativo, y slider interactivo "Antes/Después" desarrollado en Vanilla JS para máxima fluidez táctil.
* **Seguridad Reforzada:** Headers HTTP estrictos configurados vía `_headers` (CSP, HSTS, X-Frame-Options).

---

## 🛠️ Stack Técnico

| Área | Tecnologías / Herramientas |
| :--- | :--- |
| **Frontend** | HTML5 semántico, CSS3 (Custom Properties), Vanilla JS (ES2020+) |
| **PWA** | Web App Manifest, Service Workers, IndexedDB (para caché de catálogo) |
| **Optimización** | Imágenes en formato WebP, optimizadas en lote con Python 3 + Pillow |
| **Infraestructura** | GitHub Pages (Hosting), Cloudflare (DNS, CDN, SSL Full Strict) |
| **SEO Técnico** | `sitemap.xml`, `robots.txt` (con bloqueo de bots de IA), metadatos Open Graph |

---

## 📂 Estructura del Proyecto

```text
kabello-web/
├── index.html                # Landing principal (Hero, beneficios, CTA suscripción)
├── servicios.html            # Detalle de colocación y plan de mantenimiento mensual
├── catalogo.html             # Galería de prótesis con slider Antes/Después
├── contacto.html             # Formulario, mapa y enlace directo a WhatsApp Business
├── 404.html                  # Página de error personalizada con estilo de marca
├── manifest.json             # Configuración PWA (nombre, tema, iconos)
├── sw.js                     # Service Worker (lógica de caché)
├── robots.txt                # Directivas para motores de búsqueda y bloqueo de scraping
├── sitemap.xml               # Mapa del sitio para indexación
├── CNAME                     # Dominio personalizado → kabello.es
├── _headers                  # Configuración de HTTP Security Headers (Cloudflare Pages)
├── .well-known/
│   └── security.txt          # RFC 9116 — Contacto de seguridad
├── assets/
│   ├── logo-kabello.webp     # Logotipo optimizado
│   ├── icon-192.png          # PWA icon
│   ├── icon-512.png          # PWA icon
│   ├── before-after/         # Imágenes WebP optimizadas para el slider
│   └── video-hero.webm       # Video de fondo comprimido para la sección Hero
├── css/
│   └── styles.css            # Estilos globales, variables CSS y media queries
└── js/
    ├── main.js               # Lógica de UI: menú móvil, smooth scroll, slider
    └── pwa-register.js       # Registro del Service Worker
