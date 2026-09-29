const CACHE_NAME = 'kabello-v2';
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
    self.skipWaiting();
    event.waitUntil(
        caches.open(CACHE_NAME).then(cache => cache.addAll(ASSETS))
    );
});

// Network-first: siempre intenta traer la versión más reciente y solo usa
// la caché como respaldo si no hay conexión.
self.addEventListener('fetch', event => {
    if (event.request.method !== 'GET') return;
    event.respondWith(
        fetch(event.request).then(fetchResponse => {
            return caches.open(CACHE_NAME).then(cache => {
                if (event.request.url.startsWith(self.location.origin)) {
                    cache.put(event.request, fetchResponse.clone());
                }
                return fetchResponse;
            });
        }).catch(() => caches.match(event.request).then(cached => cached || caches.match('/index.html')))
    );
});

self.addEventListener('activate', event => {
    event.waitUntil(
        caches.keys().then(names => {
            return Promise.all(
                names.filter(name => name !== CACHE_NAME).map(name => caches.delete(name))
            );
        }).then(() => self.clients.claim())
    );
});
