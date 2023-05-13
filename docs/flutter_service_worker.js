'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  "version.json": "15235b5108d6a877ef74fe3317a96bf7",
"index.html": "675c5241f8749a52fbeefd319ce9c79b",
"/": "675c5241f8749a52fbeefd319ce9c79b",
"main.dart.js": "bb006d2f258ad89604766b334846d091",
"flutter.js": "a85fcf6324d3c4d3ae3be1ae4931e9c5",
"favicon.png": "7a9c0b3a0caf74644fab64ae815cba15",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"manifest.json": "901d86fb8842ec0d66225a542131d689",
"assets/images/Meeting.jpg": "f8931e56c7633093eec2599a44558472",
"assets/images/meeting.png": "0733c8dd3728c6ce87c07bdcfdd3fd6b",
"assets/images/TUATIEEElogo.png": "a7ed9dbc5c3f3f06a3c3f36c7f5ea022",
"assets/images/group.png": "50a104f0fe087b3c5cd283fa29f3b402",
"assets/images/IEEE_SB_brand_small.png": "9efaae4de98fe9b71032e1bdbba0080a",
"assets/images/IMG_4760.JPG": "d503a1b4bdff0969fde8a62a484c97e6",
"assets/images/unknown.png": "f76d242461d2b45da0c2ff5abde9aa33",
"assets/images/IMG_20221031_115447_085.jpeg": "789784d6f1d1bd9c00b8cc521625b3bf",
"assets/images/benkyokai.jpg": "78cdc4c5ef87d7214f62a54baf19b827",
"assets/images/22771349.png": "4e1ff8ca79e528dc3a66a5aabeb22e7f",
"assets/images/Meeting.jpeg": "999b1c2240153716c46b2c16893c2656",
"assets/images/profiel.png": "a44681e373d0ea53e11d6f08f60091c6",
"assets/images/22171414.jpg": "b8c3ef290101fa92d91ce253e82412bc",
"assets/images/22987927.png": "e3f987d0afa33ec7ac572e9693148338",
"assets/images/discoicon.png": "ec085e761f20b7d16151bfd2d2cfec52",
"assets/images/IMG_20220523_162425.jpg": "331cd139eeddfd9a0e963d42078eaff8",
"assets/images/latex.png": "9616755adf07d8ee303b89a18d9598ba",
"assets/web/favicon.png": "7a9c0b3a0caf74644fab64ae815cba15",
"assets/AssetManifest.json": "b3dfff043f1557b734598fd53d48557f",
"assets/NOTICES": "81a2448691ed1fdda47719d52865efcf",
"assets/FontManifest.json": "f922341c6e67b20c71b10040f50bc77d",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "6d342eb68f170c97609e9da345464e5e",
"assets/fonts/NotoSansJP-Regular.otf": "ecfed48e463db4e31d1691c8af367730",
"assets/fonts/NotoSansJP-Medium.otf": "d6c74d39a44c519ff736ac55e5d28a46",
"assets/fonts/NotoSansJP-Light.otf": "137761c9e4b05edc375b06c256e9b65a",
"assets/fonts/NotoSansJP-Thin.otf": "e2b92248795c0cd02d9858aaf2a12ec2",
"assets/fonts/NotoSansJP-Bold.otf": "e463c4b3a2d7fbfb917831767da8c24f",
"assets/fonts/MaterialIcons-Regular.otf": "e7069dfd19b331be16bed984668fe080",
"assets/fonts/NotoSansJP-Black.otf": "5ce4631ec833cd0011936d5653fbd144",
"canvaskit/canvaskit.js": "97937cb4c2c2073c968525a3e08c86a3",
"canvaskit/profiling/canvaskit.js": "c21852696bc1cc82e8894d851c01921a",
"canvaskit/profiling/canvaskit.wasm": "371bc4e204443b0d5e774d64a046eb99",
"canvaskit/canvaskit.wasm": "3de12d898ec208a5f31362cc00f09b9e"
};

// The application shell files that are downloaded before a service worker can
// start.
const CORE = [
  "main.dart.js",
"index.html",
"assets/AssetManifest.json",
"assets/FontManifest.json"];
// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});

// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});

// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});

self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});

// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}

// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
