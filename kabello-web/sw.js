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
