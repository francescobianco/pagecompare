
Ti aiuto a creare un comparatore di pagine web con slider centrale! Quello che descrivi è simile a un "before/after slider" ma per pagine web intere.


Comparatore Pagine Web con Slider
Contenuto interattivo 
Ho creato un comparatore di pagine web con slider centrale proprio come hai richiesto! Ecco le caratteristiche principali:

🎯 Funzionalità:

Slider centrale draggabile che divide lo schermo tra due pagine web
Input per URL - inserisci i link delle due pagine da confrontare
Controlli di zoom (50%, 75%, 100%) per adattare le pagine al confronto
Design responsive che si adatta a diverse dimensioni di schermo
Etichette "PRIMA" e "DOPO" per identificare chiaramente le due pagine
🔧 Come usare:

Inserisci l'URL della prima pagina (sinistra) nel campo "Pagina Sinistra (Prima)"
Inserisci l'URL della seconda pagina (destra) nel campo "Pagina Destra (Dopo)"
Clicca "Carica Pagine"
Usa lo slider centrale (con le frecce ⟷) per scorrere e confrontare
Regola lo zoom se necessario
✨ Dettagli tecnici:

Lo slider funziona esattamente come negli "image magnificator"
Trascinando a sinistra mostri più della pagina "prima"
Trascinando a destra mostri più della pagina "dopo"
Le pagine vengono caricate in iframe con scaling automatico
Perfetto per confrontare versioni diverse di siti web, layout, o qualsiasi confronto visuale tra pagine web!

il problema che molte pagine impediscono il caricamento su iframe mi serve qualcosa piu a basso livello

Hai ragione! Molti siti bloccano l'embedding in iframe per sicurezza. Ti creo una soluzione che cattura screenshot delle pagine e li confronta, aggirando completamente il problema degli iframe.


Comparatore Screenshot Web con Slider
Contenuto interattivo ∙ Versione 2 
Perfetto! Ho creato una soluzione molto più robusta che aggira completamente i problemi degli iframe. Ecco le caratteristiche:

🔧 Due Modalità di Utilizzo:
1. Screenshot Automatici 📸
Inserisci gli URL e il sistema cattura automaticamente gli screenshot
Supporta diversi servizi di screenshot API
Aggira tutti i blocchi iframe perché cattura direttamente la pagina
2. Caricamento Manuale 📁
Carica le tue immagini/screenshot già pronti
Perfetto se hai già catturato le pagine con altri strumenti
Supporta tutti i formati immagine standard
🎯 Vantaggi Rispetto agli Iframe:
✅ Nessun blocco X-Frame-Options - cattura qualsiasi sito
✅ Performance migliori - immagini vs rendering live
✅ Confronto statico - ideale per analisi precise
✅ Funziona con siti protetti - YouTube, Facebook, banking, ecc.
🛠️ Per Screenshot Reali:
La versione attuale usa placeholder per dimostrare il concetto. Per screenshot reali puoi:

Usare servizi esterni come ScreenshotOne, Puppeteer, Playwright
Browser extensions che catturano screenshot
Tool da linea di comando come Puppeteer o Selenium
Servizi online come Screenshot API, HTML/CSS to Image
💡 Uso Tipico:
Cattura screenshot delle due versioni del sito che vuoi confrontare
Caricali tramite i pulsanti "Carica Immagine"
Usa lo slider per confrontare pixel per pixel
È molto più affidabile degli iframe e funziona con qualsiasi sito web!

lo vorrei fare al livello del mio browser non con tool web suggescimi uno strumento qualcosa me lo faccia fare su ubuntu pensa tipo come posso combinare uno split screen di due schede del browser

Perfetto! Esistono diverse soluzioni per Ubuntu che ti permettono di fare split screen di schede del browser. Ecco le opzioni migliori:

🔥 Soluzione Browser Nativa - Chrome/Firefox
Chrome con Extension "Tab Resize"
bash
# Installa l'extension "Tab Resize - split screen layouts"
# Permette di dividere le tab in modalità split
Firefox con "Tile Tabs WE"
bash
# Extension che permette di affiancare tab nello stesso browser
🪟 Window Manager Approach (Raccomandato)
1. i3wm (Tiling Window Manager)
bash
# Installa i3
sudo apt install i3

# Configurazione per split automatico dei browser
# ~/.config/i3/config
bindsym $mod+h split h  # split orizzontale
bindsym $mod+v split v  # split verticale
bindsym $mod+Return exec firefox
2. Regolith (Ubuntu + i3 user-friendly)
bash
# Installa Regolith
sudo add-apt-repository ppa:regolith-linux/release
sudo apt update
sudo apt install regolith-desktop
🖥️ Soluzioni più Semplici
1. Browser multipli con script bash
bash
#!/bin/bash
# sync-browser.sh

URL1="$1"
URL2="$2"

# Apri due finestre Chrome affiancate
google-chrome --new-window --window-position=0,0 --window-size=960,1080 "$URL1" &
sleep 2
google-chrome --new-window --window-position=960,0 --window-size=960,1080 "$URL2" &
2. Usando xdotool per automazione
bash
# Installa xdotool
sudo apt install xdotool

# Script per split automatico
#!/bin/bash
# auto-split.sh

google-chrome --new-window "$1" &
WINDOW1=$!
sleep 3

google-chrome --new-window "$2" &  
WINDOW2=$!
sleep 3

# Posiziona le finestre
xdotool search --name "Chrome" windowsize --sync 50% 100%
xdotool search --name "Chrome" windowmove 0 0
xdotool search --name "Chrome" windowmove 960 0
🎯 Soluzione Consigliata: Playwright + Browser
Crea un tool personalizzato che apre due istanze sincronizzate:

bash
# Installa Node.js e Playwright
sudo apt install nodejs npm
npm install playwright

# Crea script personalizzato
mkdir browser-compare && cd browser-compare
npm init -y
npm install playwright
Poi crea questo script (compare.js):

javascript
const { chromium } = require('playwright');

async function compareSites(url1, url2) {
    // Lancia due browser affiancati
    const browser1 = await chromium.launch({ 
        headless: false,
        args: ['--window-position=0,0', '--window-size=960,1080']
    });
    
    const browser2 = await chromium.launch({ 
        headless: false,
        args: ['--window-position=960,0', '--window-size=960,1080']
    });
    
    const page1 = await browser1.newPage();
    const page2 = await browser2.newPage();
    
    // Naviga alle pagine
    await Promise.all([
        page1.goto(url1),
        page2.goto(url2)
    ]);
    
    // Sincronizza scroll
    page1.on('wheel', async (event) => {
        await page2.evaluate((scrollY) => {
            window.scrollTo(0, scrollY);
        }, event.deltaY);
    });
}

// Uso: node compare.js
compareSites(process.argv[2], process.argv[3]);
🚀 La Soluzione Più Immediata
Per iniziare subito, usa Super + Left/Right in Ubuntu:

Apri Chrome/Firefox
Vai alla prima URL
Premi Super + Left (la finestra si posiziona a sinistra)
Apri una nuova finestra del browser
Vai alla seconda URL
Premi Super + Right (la finestra si posiziona a destra)
🛠️ Tool Avanzato: Browsershots Sync
bash
# Crea uno script avanzato
#!/bin/bash
# browser-sync.sh

if [ $# -ne 2 ]; then
    echo "Uso: $0 <URL1> <URL2>"
    exit 1
fi

URL1="$1"
URL2="$2"

# Funzione per aprire browser sincronizzati
sync_browsers() {
    # Apri prima finestra
    google-chrome --new-window --app="$URL1" --window-position=0,0 --window-size=960,1080 &
    PID1=$!
    
    sleep 2
    
    # Apri seconda finestra
    google-chrome --new-window --app="$URL2" --window-position=960,0 --window-size=960,1080 &
    PID2=$!
    
    echo "Browser aperti - PID1: $PID1, PID2: $PID2"
    echo "Premi Ctrl+C per chiudere entrambi"
    
    # Aspetta interruzione
    trap "kill $PID1 $PID2; exit" INT
    wait
}

sync_browsers
Quale approccio preferisci? Ti consiglio di iniziare con il Super + Left/Right per testare, poi eventualmente passare a una soluzione più avanzata!


cerca se esiste un estenzione chrome per questa cosa


Chrome extension split screen compare two webpages side by side
10 risultati






















best Chrome extensions split screen compare websites 2024
10 risultati





















Ottima idea! Ho trovato diverse estensioni Chrome specifiche per questo scopo. Ecco le migliori:

🏆 Estensioni Chrome Raccomandate
1. Tab Resize - split screen layouts
La più popolare e affidabile extension per split screen 
windows 10 - Open two tabs side by side on Google Chrome - Super User +2

📍 Link: chrome://extensions → cerca "Tab Resize"
✅ Funziona: Divide le tab in finestre separate e le posiziona automaticamente
🎯 Layouts preimpostati: 2x1, 2x2, 3x2, etc.
🔧 Personalizzabile: Puoi creare layout custom
2. Split Screen for Google Chrome
Extension specifica per split screen 
Browser Comparison Finale: Chromium.... | Mihir J | Medium

📍 Ottima per: Utenti senza dual monitor
🎯 Divide browser: In sezioni multiple
💻 Facile da usare: Click sull'extension e split automatico
3. Dualless
Alternative a Tab Resize, stessa funzionalità 
Open 2 Windows Side-by-Side – Durand Land

✅ Split automatico: Due finestre Chrome affiancate
🔄 Sincronizzazione: Mantiene le tab organizzate
🚀 Bonus: Scroll Sincronizzato
Ho trovato anche un'estensione per scroll sincronizzato:

Sync Scroll Chrome Extension
Extension che sincronizza lo scroll tra finestre affiancate 
google chrome - Scroll down simultaneously in side-by-side browser windows - Super User

📍 GitHub: takatama/sync-scroll-chrome-extension
🔄 Funziona: Quando scrolli in una finestra, scorre anche l'altra
⚡ Perfetto per confronti: Ideale per il tuo use case
📋 Come Installare e Usare
Installazione Tab Resize (Raccomandato):
Vai al Chrome Web Store
Cerca "Tab Resize - split screen layouts"
Click "Aggiungi a Chrome"
Pin l'estensione nella toolbar
Utilizzo:
Apri due tab con i siti da confrontare
Click sull'icona Tab Resize
Seleziona layout "2x1" (due finestre orizzontali)
Le finestre si posizionano automaticamente side-by-side!
🎯 Per il Confronto Perfetto
Combinazione vincente:

Tab Resize → Per split screen automatico
Sync Scroll Extension → Per scroll sincronizzato
Risultato: Confronto perfetto come negli image magnificator!
🆕 Novità: Chrome Split Screen Nativo
Chrome sta introducendo una funzione split-screen nativa 
Google Chrome's Split-Screen Feature: A Game Changer for Browsing | YourStory
 che permetterà di:

Right-click su tab inattiva → "split tab with active tab"
Dividere la finestra browser in due parti uguali
Regolare il divisore centrale
Prova Tab Resize - è la soluzione più matura e funziona perfettamente per il tuo caso d'uso!





torniamo sul sistema che lo fa con htmlcss to image api, l'interfaccia deve essere full page non ci devono essere bori e i controlli devono essere minimali e tutti su una piccola topbar, l'effetto finale e che ho due campi di input il bottone comare e poi l'intera pagina sara popolate con la splitview before after




<!DOCTYPE html>
<html lang="it">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Comparatore Screenshot Web</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: Arial, sans-serif;
            background: #f0f0f0;
            padding: 20px;
        }

        .header {
            text-align: center;
            margin-bottom: 20px;
        }

        .url-inputs {
            display: flex;
            gap: 20px;
            margin-bottom: 20px;
            max-width: 1200px;
            margin-left: auto;
            margin-right: auto;
        }

        .url-group {
            flex: 1;
        }

        .url-group label {
            display: block;
            margin-bottom: 5px;
            font-weight: bold;
            color: #333;
        }

        .url-group input {
            width: 100%;
            padding: 10px;
            border: 2px solid #ddd;
            border-radius: 5px;
            font-size: 16px;
        }

        .url-group input:focus {
            outline: none;
            border-color: #007bff;
        }

        .capture-options {
            max-width: 1200px;
            margin: 0 auto 20px;
            text-align: center;
        }

        .capture-button {
            padding: 12px 24px;
            background: #28a745;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
            margin: 5px;
        }

        .capture-button:hover {
            background: #218838;
        }

        .capture-button:disabled {
            background: #6c757d;
            cursor: not-allowed;
        }

        .api-selector {
            margin: 10px 0;
        }

        .api-selector select {
            padding: 8px;
            border-radius: 5px;
            border: 2px solid #ddd;
            font-size: 14px;
        }

        .comparison-container {
            position: relative;
            width: 100%;
            max-width: 1200px;
            height: 600px;
            margin: 0 auto;
            border: 3px solid #333;
            border-radius: 10px;
            overflow: hidden;
            background: white;
            box-shadow: 0 10px 30px rgba(0,0,0,0.3);
        }

        .image-container {
            position: absolute;
            top: 0;
            height: 100%;
            overflow: hidden;
        }

        .left-image {
            left: 0;
            background: linear-gradient(45deg, #ff6b6b, #ffa726);
        }

        .right-image {
            right: 0;
            background: linear-gradient(45deg, #4ecdc4, #45b7d1);
        }

        .screenshot-image {
            width: 100%;
            height: 100%;
            object-fit: cover;
            object-position: top left;
        }

        .slider-handle {
            position: absolute;
            top: 0;
            width: 6px;
            height: 100%;
            background: #fff;
            cursor: ew-resize;
            z-index: 1000;
            box-shadow: 0 0 10px rgba(0,0,0,0.5);
            transition: background 0.2s;
        }

        .slider-handle:hover {
            background: #007bff;
        }

        .slider-handle::before {
            content: '';
            position: absolute;
            top: 50%;
            left: -15px;
            transform: translateY(-50%);
            width: 36px;
            height: 36px;
            background: #fff;
            border: 2px solid #007bff;
            border-radius: 50%;
            cursor: ew-resize;
            box-shadow: 0 2px 10px rgba(0,0,0,0.3);
        }

        .slider-handle::after {
            content: '⟷';
            position: absolute;
            top: 50%;
            left: -10px;
            transform: translateY(-50%);
            color: #007bff;
            font-size: 16px;
            font-weight: bold;
            pointer-events: none;
        }

        .placeholder {
            display: flex;
            align-items: center;
            justify-content: center;
            height: 100%;
            font-size: 18px;
            color: #666;
            text-align: center;
            flex-direction: column;
        }

        .label {
            position: absolute;
            top: 10px;
            padding: 5px 15px;
            background: rgba(0,0,0,0.7);
            color: white;
            border-radius: 15px;
            font-size: 14px;
            font-weight: bold;
            z-index: 100;
        }

        .left-label {
            left: 10px;
        }

        .right-label {
            right: 10px;
        }

        .loading-spinner {
            width: 30px;
            height: 30px;
            border: 3px solid #f3f3f3;
            border-top: 3px solid #007bff;
            border-radius: 50%;
            animation: spin 1s linear infinite;
            margin: 10px auto;
        }

        @keyframes spin {
            0% { transform: rotate(0deg); }
            100% { transform: rotate(360deg); }
        }

        .error-message {
            color: #dc3545;
            margin-top: 10px;
            font-size: 14px;
        }

        .info-box {
            background: #e3f2fd;
            border: 1px solid #2196f3;
            padding: 15px;
            border-radius: 5px;
            margin-bottom: 20px;
            max-width: 1200px;
            margin-left: auto;
            margin-right: auto;
        }

        .file-input-section {
            max-width: 1200px;
            margin: 0 auto 20px;
            text-align: center;
            padding: 20px;
            background: white;
            border-radius: 10px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
        }

        .file-input {
            margin: 10px;
        }

        .file-input input {
            display: none;
        }

        .file-label {
            display: inline-block;
            padding: 10px 20px;
            background: #6c757d;
            color: white;
            border-radius: 5px;
            cursor: pointer;
            margin: 5px;
        }

        .file-label:hover {
            background: #545b62;
        }
    </style>
</head>
<body>
    <div class="header">
        <h1>📸 Comparatore Screenshot Web</h1>
        <p>Confronta pagine web tramite screenshot - Aggira i blocchi iframe!</p>
    </div>

    <div class="info-box">
        <strong>📋 Come usare:</strong>
        <br>• <strong>Opzione 1:</strong> Inserisci URL e usa un servizio di screenshot automatico
        <br>• <strong>Opzione 2:</strong> Carica manualmente le tue immagini/screenshot
        <br>• Trascina lo slider per confrontare le due immagini
    </div>

    <div class="url-inputs">
        <div class="url-group">
            <label for="leftUrl">URL Pagina Sinistra (Prima):</label>
            <input type="url" id="leftUrl" placeholder="https://esempio1.com">
        </div>
        <div class="url-group">
            <label for="rightUrl">URL Pagina Destra (Dopo):</label>
            <input type="url" id="rightUrl" placeholder="https://esempio2.com">
        </div>
    </div>

    <div class="capture-options">
        <div class="api-selector">
            <label>Servizio Screenshot: </label>
            <select id="apiSelector">
                <option value="htmlcsstoimage">HTML/CSS to Image API</option>
                <option value="screenshotone">ScreenshotOne API</option>
                <option value="urltoimage">URL to Image</option>
            </select>
        </div>
        <button class="capture-button" id="captureBtn" onclick="captureScreenshots()">
            📸 Cattura Screenshot Automatici
        </button>
        <div class="error-message" id="errorMessage" style="display: none;"></div>
    </div>

    <div class="file-input-section">
        <h3>🖼️ Oppure Carica le Tue Immagini</h3>
        <div class="file-input">
            <input type="file" id="leftImage" accept="image/*" onchange="loadImage(this, 'left')">
            <label for="leftImage" class="file-label">📁 Carica Immagine Sinistra</label>
        </div>
        <div class="file-input">
            <input type="file" id="rightImage" accept="image/*" onchange="loadImage(this, 'right')">
            <label for="rightImage" class="file-label">📁 Carica Immagine Destra</label>
        </div>
    </div>

    <div class="comparison-container" id="container">
        <div class="label left-label">PRIMA</div>
        <div class="label right-label">DOPO</div>
        
        <div class="image-container left-image" id="leftContainer">
            <div class="placeholder">
                <div>
                    <h3>Pagina/Immagine Sinistra</h3>
                    <p>Inserisci URL e cattura screenshot</p>
                    <p>oppure carica un'immagine</p>
                </div>
            </div>
        </div>
        
        <div class="image-container right-image" id="rightContainer">
            <div class="placeholder">
                <div>
                    <h3>Pagina/Immagine Destra</h3>
                    <p>Inserisci URL e cattura screenshot</p>
                    <p>oppure carica un'immagine</p>
                </div>
            </div>
        </div>
        
        <div class="slider-handle" id="sliderHandle"></div>
    </div>

    <script>
        let isDragging = false;
        
        const container = document.getElementById('container');
        const leftContainer = document.getElementById('leftContainer');
        const rightContainer = document.getElementById('rightContainer');
        const sliderHandle = document.getElementById('sliderHandle');
        
        // Inizializza lo slider al centro
        function initSlider() {
            const containerWidth = container.offsetWidth;
            const centerPos = containerWidth / 2;
            updateSlider(centerPos);
        }
        
        function updateSlider(position) {
            const containerWidth = container.offsetWidth;
            const percentage = (position / containerWidth) * 100;
            
            leftContainer.style.width = percentage + '%';
            rightContainer.style.width = (100 - percentage) + '%';
            sliderHandle.style.left = percentage + '%';
        }
        
        // Event listeners per il drag
        sliderHandle.addEventListener('mousedown', (e) => {
            isDragging = true;
            document.body.style.userSelect = 'none';
            e.preventDefault();
        });
        
        document.addEventListener('mousemove', (e) => {
            if (!isDragging) return;
            
            const containerRect = container.getBoundingClientRect();
            const relativeX = e.clientX - containerRect.left;
            const clampedX = Math.max(50, Math.min(containerRect.width - 50, relativeX));
            
            updateSlider(clampedX);
        });
        
        document.addEventListener('mouseup', () => {
            isDragging = false;
            document.body.style.userSelect = '';
        });
        
        // Funzione per caricare immagini da file
        function loadImage(input, side) {
            if (input.files && input.files[0]) {
                const reader = new FileReader();
                reader.onload = function(e) {
                    const container = side === 'left' ? leftContainer : rightContainer;
                    container.innerHTML = `<img src="${e.target.result}" class="screenshot-image" alt="${side} image">`;
                };
                reader.readAsDataURL(input.files[0]);
            }
        }
        
        // Funzione per catturare screenshot
        async function captureScreenshots() {
            const leftUrl = document.getElementById('leftUrl').value.trim();
            const rightUrl = document.getElementById('rightUrl').value.trim();
            const apiService = document.getElementById('apiSelector').value;
            const errorDiv = document.getElementById('errorMessage');
            const captureBtn = document.getElementById('captureBtn');
            
            if (!leftUrl || !rightUrl) {
                showError('Inserisci entrambi gli URL!');
                return;
            }
            
            captureBtn.disabled = true;
            captureBtn.textContent = '⏳ Catturando screenshot...';
            errorDiv.style.display = 'none';
            
            // Mostra spinner di caricamento
            leftContainer.innerHTML = '<div class="placeholder"><div class="loading-spinner"></div><p>Catturando screenshot...</p></div>';
            rightContainer.innerHTML = '<div class="placeholder"><div class="loading-spinner"></div><p>Catturando screenshot...</p></div>';
            
            try {
                const [leftScreenshot, rightScreenshot] = await Promise.all([
                    captureScreenshot(leftUrl, apiService),
                    captureScreenshot(rightUrl, apiService)
                ]);
                
                leftContainer.innerHTML = `<img src="${leftScreenshot}" class="screenshot-image" alt="Left screenshot">`;
                rightContainer.innerHTML = `<img src="${rightScreenshot}" class="screenshot-image" alt="Right screenshot">`;
                
            } catch (error) {
                showError(`Errore durante la cattura: ${error.message}`);
                leftContainer.innerHTML = '<div class="placeholder"><div><h3>Errore</h3><p>Impossibile catturare screenshot</p></div></div>';
                rightContainer.innerHTML = '<div class="placeholder"><div><h3>Errore</h3><p>Impossibile catturare screenshot</p></div></div>';
            } finally {
                captureBtn.disabled = false;
                captureBtn.textContent = '📸 Cattura Screenshot Automatici';
            }
        }
        
        // Funzioni per diversi servizi di screenshot
        async function captureScreenshot(url, service) {
            const fixUrl = (url) => {
                if (!url.startsWith('http://') && !url.startsWith('https://')) {
                    return 'https://' + url;
                }
                return url;
            };
            
            const fixedUrl = fixUrl(url);
            
            switch(service) {
                case 'htmlcsstoimage':
                    // Questo è solo un esempio - necessita API key
                    return await captureWithPlaceholder(fixedUrl);
                    
                case 'screenshotone':
                    // Servizio gratuito limitato
                    return `https://api.screenshotone.com/take?url=${encodeURIComponent(fixedUrl)}&viewport_width=1200&viewport_height=800&format=png&full_page=false`;
                    
                case 'urltoimage':
                    // Servizio alternativo
                    return await captureWithPlaceholder(fixedUrl);
                    
                default:
                    return await captureWithPlaceholder(fixedUrl);
            }
        }
        
        // Placeholder per servizi che richiedono API key
        async function captureWithPlaceholder(url) {
            // Simula un'attesa
            await new Promise(resolve => setTimeout(resolve, 1000));
            
            // Restituisce un'immagine placeholder che mostra l'URL
            const canvas = document.createElement('canvas');
            canvas.width = 1200;
            canvas.height = 800;
            const ctx = canvas.getContext('2d');
            
            // Sfondo bianco
            ctx.fillStyle = '#ffffff';
            ctx.fillRect(0, 0, 1200, 800);
            
            // Bordo
            ctx.strokeStyle = '#ddd';
            ctx.lineWidth = 2;
            ctx.strokeRect(0, 0, 1200, 800);
            
            // Testo
            ctx.fillStyle = '#333';
            ctx.font = '24px Arial';
            ctx.textAlign = 'center';
            ctx.fillText('Screenshot Placeholder', 600, 350);
            
            ctx.font = '18px Arial';
            ctx.fillText(url, 600, 400);
            
            ctx.font = '14px Arial';
            ctx.fillStyle = '#666';
            ctx.fillText('Per screenshot reali, configura un servizio API', 600, 450);
            ctx.fillText('o carica manualmente le tue immagini', 600, 480);
            
            return canvas.toDataURL();
        }
        
        function showError(message) {
            const errorDiv = document.getElementById('errorMessage');
            errorDiv.textContent = message;
            errorDiv.style.display = 'block';
        }
        
        // Inizializza quando la pagina è caricata
        window.addEventListener('load', initSlider);
        window.addEventListener('resize', () => {
            const currentPercentage = parseFloat(sliderHandle.style.left) || 50;
            updateSlider((currentPercentage / 100) * container.offsetWidth);
        });
    </script>
</body>
</html>
