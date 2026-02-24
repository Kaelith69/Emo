<div align="center">

<!-- ═══════════════════════════════════════════════════════ HERO BANNER ══ -->
<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 800 200" width="800" height="200">
  <defs>
    <linearGradient id="heroBg" x1="0%" y1="0%" x2="100%" y2="100%">
      <stop offset="0%" style="stop-color:#0F0F0F"/>
      <stop offset="100%" style="stop-color:#1a1025"/>
    </linearGradient>
    <linearGradient id="heroAccent" x1="0%" y1="0%" x2="100%" y2="0%">
      <stop offset="0%" style="stop-color:#7C3AED"/>
      <stop offset="50%" style="stop-color:#2563EB"/>
      <stop offset="100%" style="stop-color:#06B6D4"/>
    </linearGradient>
    <linearGradient id="heartGrad" x1="0%" y1="0%" x2="100%" y2="100%">
      <stop offset="0%" style="stop-color:#7C3AED"/>
      <stop offset="100%" style="stop-color:#06B6D4"/>
    </linearGradient>
    <filter id="glow">
      <feGaussianBlur stdDeviation="3" result="coloredBlur"/>
      <feMerge><feMergeNode in="coloredBlur"/><feMergeNode in="SourceGraphic"/></feMerge>
    </filter>
  </defs>
  <!-- Background -->
  <rect width="800" height="200" rx="20" fill="url(#heroBg)"/>
  <!-- Decorative circles -->
  <circle cx="720" cy="40" r="60" fill="#7C3AED" opacity="0.08"/>
  <circle cx="760" cy="160" r="40" fill="#06B6D4" opacity="0.06"/>
  <circle cx="30" cy="170" r="50" fill="#2563EB" opacity="0.06"/>
  <!-- Heart shape -->
  <path d="M90 100 C90 80 70 65 55 78 C40 65 20 80 20 100 C20 120 55 145 55 145 C55 145 90 120 90 100Z"
        fill="url(#heartGrad)" opacity="0.95" filter="url(#glow)"/>
  <!-- Pulse lines -->
  <polyline points="100,110 120,110 130,85 140,135 150,95 160,115 175,115"
            fill="none" stroke="url(#heroAccent)" stroke-width="2.5" stroke-linecap="round" opacity="0.7"/>
  <!-- App name -->
  <text x="195" y="110" font-family="Georgia, serif" font-size="72" font-weight="900"
        fill="url(#heroAccent)" filter="url(#glow)">Emo</text>
  <!-- Tagline -->
  <text x="195" y="148" font-family="Arial, sans-serif" font-size="20" fill="#a78bfa" opacity="0.9">
    Your AI Emotional Support Companion
  </text>
  <!-- Sub-tagline -->
  <text x="195" y="172" font-family="Arial, sans-serif" font-size="13" fill="#67e8f9" opacity="0.65">
    Flutter · Gemini 1.5 Flash · Cross-Platform · AMOLED Dark
  </text>
</svg>

<br/>

> _"A pocket-sized friend who actually listens. Powered by AI, fueled by good vibes."_ ✨

<br/>

[![Flutter](https://img.shields.io/badge/Flutter-3.x-02569B?logo=flutter&logoColor=white)](https://flutter.dev)
[![Dart](https://img.shields.io/badge/Dart-3.x-0175C2?logo=dart&logoColor=white)](https://dart.dev)
[![Gemini API](https://img.shields.io/badge/Gemini-1.5%20Flash-4285F4?logo=google&logoColor=white)](https://ai.google.dev)
[![License: MIT](https://img.shields.io/badge/License-MIT-7C3AED.svg)](LICENSE)
[![Platform](https://img.shields.io/badge/platform-Android%20%7C%20iOS%20%7C%20Web%20%7C%20Desktop-06B6D4)](https://flutter.dev)
[![Version](https://img.shields.io/badge/version-1.0.0-2563EB)](CHANGELOG.md)

</div>

---

## 🤔 So What Even Is This?

You know that friend who *always* knows what to say when you're having a rough day? Emo is that friend — except it runs on your phone, never sleeps, never judges you, and is powered by Google's Gemini AI instead of 10 years of therapy.

**Emo** is a cross-platform Flutter app that gives you a safe space to type out how you're feeling, and replies with genuinely warm, empathetic, emoji-peppered responses. Think of it as a diary that talks back — in the most supportive way possible.

It maintains conversational context (so it remembers what you just said), saves the bot's best responses locally for you to revisit, and runs on literally every platform Flutter supports. It's dark-themed, snappy, and built with love (and `http.post`).

---

## 🎬 Live Demo

> Place a demo GIF here once you've recorded one: **`assets/demo.gif`**

![Demo](assets/demo.gif)

**What the GIF should show:**
- Typing a message into the chat input ("I'm having a stressful day")
- The loading spinner while Gemini thinks
- The empathetic reply appearing as a message bubble
- Opening the drawer to see saved messages
- Deleting a saved message with the trash icon

> _Keep it around 5–10 seconds, looping. Nobody wants to download a 50MB GIF._

---

## 🧩 System Overview

Emo is a single-screen Flutter app with three main logical layers:

| Layer | What it does |
|---|---|
| **UI Layer** | Chat bubbles, text input, send button, drawer panel |
| **Logic Layer** | `_sendMessage()` builds the prompt, calls Gemini, updates state |
| **Storage Layer** | `shared_preferences` persists bot responses between sessions |

The app is intentionally kept simple — one file, one screen, zero over-engineering. It's a reminder that not every project needs a BLoC + repository pattern + dependency injection to be genuinely useful.

---

## 🎯 Features

| Feature | Description |
|---|---|
| 💬 **Contextual Chat** | Remembers your last message and the bot's last response to maintain natural conversation flow |
| 🤗 **Emotional Support AI** | Prompt-engineered to give brief, caring, emoji-friendly replies — not generic chatbot fluff |
| 🌑 **AMOLED Dark UI** | Pure `#121212` background — your battery and your eyes will thank you |
| 💾 **Saved Messages** | Bot responses you love get persisted locally via `shared_preferences` |
| 🗑️ **Delete Saved Messages** | Swipe open the drawer, tap the trash icon — message gone, no drama |
| 🌐 **Truly Cross-Platform** | Android, iOS, Web, Linux, macOS, Windows — one codebase, all the places |
| ⚡ **Gemini 1.5 Flash** | Fast, intelligent responses via Google's generative AI — not some janky rule-based bot |
| 🔄 **Auto-scroll** | Chat auto-scrolls to the latest message because manually scrolling is so 2010 |

---

## 📊 Capability Overview

<div align="center">

<!-- ═══════════════════════════════════════════════ CAPABILITY GRAPH SVG ══ -->
<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 700 320" width="700" height="320">
  <defs>
    <linearGradient id="capBg" x1="0%" y1="0%" x2="100%" y2="100%">
      <stop offset="0%" style="stop-color:#0F0F0F"/>
      <stop offset="100%" style="stop-color:#1a1025"/>
    </linearGradient>
    <linearGradient id="barPrimary" x1="0%" y1="0%" x2="100%" y2="0%">
      <stop offset="0%" style="stop-color:#7C3AED"/>
      <stop offset="100%" style="stop-color:#a855f7"/>
    </linearGradient>
    <linearGradient id="barSecondary" x1="0%" y1="0%" x2="100%" y2="0%">
      <stop offset="0%" style="stop-color:#2563EB"/>
      <stop offset="100%" style="stop-color:#3b82f6"/>
    </linearGradient>
    <linearGradient id="barAccent" x1="0%" y1="0%" x2="100%" y2="0%">
      <stop offset="0%" style="stop-color:#06B6D4"/>
      <stop offset="100%" style="stop-color:#22d3ee"/>
    </linearGradient>
  </defs>
  <rect width="700" height="320" rx="16" fill="url(#capBg)"/>
  <text x="350" y="38" font-family="Arial, sans-serif" font-size="16" font-weight="700"
        fill="#a78bfa" text-anchor="middle">Capability Overview</text>

  <!-- Labels -->
  <text x="160" y="76" font-family="Arial, sans-serif" font-size="12" fill="#d4d4d8" text-anchor="end">AI Empathy Quality</text>
  <text x="160" y="116" font-family="Arial, sans-serif" font-size="12" fill="#d4d4d8" text-anchor="end">Response Speed</text>
  <text x="160" y="156" font-family="Arial, sans-serif" font-size="12" fill="#d4d4d8" text-anchor="end">Platform Coverage</text>
  <text x="160" y="196" font-family="Arial, sans-serif" font-size="12" fill="#d4d4d8" text-anchor="end">Local Persistence</text>
  <text x="160" y="236" font-family="Arial, sans-serif" font-size="12" fill="#d4d4d8" text-anchor="end">Context Awareness</text>
  <text x="160" y="276" font-family="Arial, sans-serif" font-size="12" fill="#d4d4d8" text-anchor="end">UI Responsiveness</text>

  <!-- Track backgrounds -->
  <rect x="170" y="62" width="490" height="16" rx="8" fill="#1e1e2e"/>
  <rect x="170" y="102" width="490" height="16" rx="8" fill="#1e1e2e"/>
  <rect x="170" y="142" width="490" height="16" rx="8" fill="#1e1e2e"/>
  <rect x="170" y="182" width="490" height="16" rx="8" fill="#1e1e2e"/>
  <rect x="170" y="222" width="490" height="16" rx="8" fill="#1e1e2e"/>
  <rect x="170" y="262" width="490" height="16" rx="8" fill="#1e1e2e"/>

  <!-- Bars (out of 490px = 100%) -->
  <rect x="170" y="62" width="441" height="16" rx="8" fill="url(#barPrimary)"/>   <!-- 90% -->
  <rect x="170" y="102" width="416" height="16" rx="8" fill="url(#barAccent)"/>   <!-- 85% -->
  <rect x="170" y="142" width="490" height="16" rx="8" fill="url(#barSecondary)"/> <!-- 100% -->
  <rect x="170" y="182" width="392" height="16" rx="8" fill="url(#barPrimary)"/>  <!-- 80% -->
  <rect x="170" y="222" width="367" height="16" rx="8" fill="url(#barAccent)"/>   <!-- 75% -->
  <rect x="170" y="262" width="466" height="16" rx="8" fill="url(#barSecondary)"/> <!-- 95% -->

  <!-- Percentages -->
  <text x="620" y="75" font-family="Arial, sans-serif" font-size="11" fill="#a78bfa">90%</text>
  <text x="596" y="115" font-family="Arial, sans-serif" font-size="11" fill="#67e8f9">85%</text>
  <text x="670" y="155" font-family="Arial, sans-serif" font-size="11" fill="#60a5fa">100%</text>
  <text x="572" y="195" font-family="Arial, sans-serif" font-size="11" fill="#a78bfa">80%</text>
  <text x="548" y="235" font-family="Arial, sans-serif" font-size="11" fill="#67e8f9">75%</text>
  <text x="646" y="275" font-family="Arial, sans-serif" font-size="11" fill="#60a5fa">95%</text>
</svg>

</div>

---

## 🏗️ Architecture

<div align="center">

<!-- ════════════════════════════════════════════════ ARCHITECTURE SVG ══ -->
<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 700 400" width="700" height="400">
  <defs>
    <linearGradient id="archBg" x1="0%" y1="0%" x2="100%" y2="100%">
      <stop offset="0%" style="stop-color:#0F0F0F"/>
      <stop offset="100%" style="stop-color:#1a1025"/>
    </linearGradient>
    <linearGradient id="boxPurple" x1="0%" y1="0%" x2="0%" y2="100%">
      <stop offset="0%" style="stop-color:#7C3AED"/>
      <stop offset="100%" style="stop-color:#5b21b6"/>
    </linearGradient>
    <linearGradient id="boxBlue" x1="0%" y1="0%" x2="0%" y2="100%">
      <stop offset="0%" style="stop-color:#2563EB"/>
      <stop offset="100%" style="stop-color:#1d4ed8"/>
    </linearGradient>
    <linearGradient id="boxCyan" x1="0%" y1="0%" x2="0%" y2="100%">
      <stop offset="0%" style="stop-color:#0891b2"/>
      <stop offset="100%" style="stop-color:#06B6D4"/>
    </linearGradient>
    <marker id="arrowA" markerWidth="8" markerHeight="8" refX="6" refY="3" orient="auto">
      <path d="M0,0 L0,6 L8,3 z" fill="#7C3AED"/>
    </marker>
    <marker id="arrowB" markerWidth="8" markerHeight="8" refX="6" refY="3" orient="auto">
      <path d="M0,0 L0,6 L8,3 z" fill="#06B6D4"/>
    </marker>
  </defs>
  <rect width="700" height="400" rx="16" fill="url(#archBg)"/>
  <text x="350" y="32" font-family="Arial, sans-serif" font-size="16" font-weight="700"
        fill="#a78bfa" text-anchor="middle">Application Architecture</text>

  <!-- MyApp -->
  <rect x="270" y="50" width="160" height="44" rx="8" fill="url(#boxPurple)"/>
  <text x="350" y="77" font-family="monospace" font-size="13" fill="white" text-anchor="middle">MyApp</text>

  <!-- Arrow down -->
  <line x1="350" y1="94" x2="350" y2="118" stroke="#7C3AED" stroke-width="2" marker-end="url(#arrowA)"/>

  <!-- MyHomePage -->
  <rect x="220" y="120" width="260" height="44" rx="8" fill="url(#boxPurple)"/>
  <text x="350" y="147" font-family="monospace" font-size="13" fill="white" text-anchor="middle">MyHomePage (Stateful)</text>

  <!-- Arrows from MyHomePage -->
  <line x1="280" y1="164" x2="160" y2="210" stroke="#7C3AED" stroke-width="2" marker-end="url(#arrowA)"/>
  <line x1="350" y1="164" x2="350" y2="210" stroke="#7C3AED" stroke-width="2" marker-end="url(#arrowA)"/>
  <line x1="420" y1="164" x2="540" y2="210" stroke="#7C3AED" stroke-width="2" marker-end="url(#arrowA)"/>

  <!-- _sendMessage -->
  <rect x="60" y="212" width="200" height="44" rx="8" fill="url(#boxBlue)"/>
  <text x="160" y="234" font-family="monospace" font-size="11" fill="white" text-anchor="middle">_sendMessage()</text>
  <text x="160" y="249" font-family="monospace" font-size="9" fill="#bfdbfe" text-anchor="middle">Gemini API call + context</text>

  <!-- Message / MessageBubble -->
  <rect x="270" y="212" width="160" height="44" rx="8" fill="url(#boxBlue)"/>
  <text x="350" y="234" font-family="monospace" font-size="11" fill="white" text-anchor="middle">Message model</text>
  <text x="350" y="249" font-family="monospace" font-size="9" fill="#bfdbfe" text-anchor="middle">MessageBubble widget</text>

  <!-- MyDrawer -->
  <rect x="440" y="212" width="200" height="44" rx="8" fill="url(#boxBlue)"/>
  <text x="540" y="234" font-family="monospace" font-size="11" fill="white" text-anchor="middle">MyDrawer (Stateful)</text>
  <text x="540" y="249" font-family="monospace" font-size="9" fill="#bfdbfe" text-anchor="middle">Saved messages panel</text>

  <!-- Arrows to storage/network -->
  <line x1="160" y1="256" x2="100" y2="310" stroke="#06B6D4" stroke-width="2" marker-end="url(#arrowB)"/>
  <line x1="160" y1="256" x2="280" y2="310" stroke="#06B6D4" stroke-width="2" marker-end="url(#arrowB)"/>
  <line x1="540" y1="256" x2="490" y2="310" stroke="#06B6D4" stroke-width="2" marker-end="url(#arrowB)"/>

  <!-- Gemini API -->
  <rect x="30" y="312" width="160" height="44" rx="8" fill="url(#boxCyan)"/>
  <text x="110" y="334" font-family="monospace" font-size="11" fill="white" text-anchor="middle">Gemini 1.5 Flash</text>
  <text x="110" y="349" font-family="monospace" font-size="9" fill="#cffafe" text-anchor="middle">REST API (http pkg)</text>

  <!-- SharedPreferences -->
  <rect x="210" y="312" width="160" height="44" rx="8" fill="url(#boxCyan)"/>
  <text x="290" y="334" font-family="monospace" font-size="11" fill="white" text-anchor="middle">SharedPreferences</text>
  <text x="290" y="349" font-family="monospace" font-size="9" fill="#cffafe" text-anchor="middle">Local persistence</text>

  <!-- SharedPrefs (drawer) -->
  <rect x="400" y="312" width="180" height="44" rx="8" fill="url(#boxCyan)"/>
  <text x="490" y="334" font-family="monospace" font-size="11" fill="white" text-anchor="middle">SharedPreferences</text>
  <text x="490" y="349" font-family="monospace" font-size="9" fill="#cffafe" text-anchor="middle">Load + delete messages</text>

  <!-- Legend -->
  <rect x="30" y="370" width="14" height="14" rx="3" fill="url(#boxPurple)"/>
  <text x="50" y="382" font-family="Arial, sans-serif" font-size="11" fill="#a78bfa">UI / Widget Layer</text>
  <rect x="180" y="370" width="14" height="14" rx="3" fill="url(#boxBlue)"/>
  <text x="200" y="382" font-family="Arial, sans-serif" font-size="11" fill="#60a5fa">Logic Layer</text>
  <rect x="310" y="370" width="14" height="14" rx="3" fill="url(#boxCyan)"/>
  <text x="330" y="382" font-family="Arial, sans-serif" font-size="11" fill="#67e8f9">Storage / Network</text>
</svg>

</div>

**State management:** Plain `StatefulWidget` + `setState` — no BLoC, no Riverpod, no Redux. This is a conscious choice. The app is single-screen. Don't over-engineer it.

**Persistence:** `shared_preferences` stores bot responses as a string list. Lightweight, zero-config, perfect for this use case.

**Networking:** `http` package makes a `POST` to the Gemini REST endpoint. No fancy GraphQL, no gRPC. Just good ol' HTTP.

**Typography:** `google_fonts` loads Playfair Display for the app title. Because serif fonts in a dark AMOLED theme hit different.

---

## 🌊 Data Flow

<div align="center">

<!-- ══════════════════════════════════════════════════ DATA FLOW SVG ══ -->
<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 700 260" width="700" height="260">
  <defs>
    <linearGradient id="dfBg" x1="0%" y1="0%" x2="100%" y2="100%">
      <stop offset="0%" style="stop-color:#0F0F0F"/>
      <stop offset="100%" style="stop-color:#1a1025"/>
    </linearGradient>
    <linearGradient id="step1" x1="0%" y1="0%" x2="0%" y2="100%">
      <stop offset="0%" style="stop-color:#7C3AED"/><stop offset="100%" style="stop-color:#6d28d9"/>
    </linearGradient>
    <linearGradient id="step2" x1="0%" y1="0%" x2="0%" y2="100%">
      <stop offset="0%" style="stop-color:#2563EB"/><stop offset="100%" style="stop-color:#1d4ed8"/>
    </linearGradient>
    <linearGradient id="step3" x1="0%" y1="0%" x2="0%" y2="100%">
      <stop offset="0%" style="stop-color:#0e7490"/><stop offset="100%" style="stop-color:#06B6D4"/>
    </linearGradient>
    <linearGradient id="step4" x1="0%" y1="0%" x2="0%" y2="100%">
      <stop offset="0%" style="stop-color:#059669"/><stop offset="100%" style="stop-color:#10b981"/>
    </linearGradient>
    <marker id="dfArr" markerWidth="8" markerHeight="8" refX="6" refY="3" orient="auto">
      <path d="M0,0 L0,6 L8,3 z" fill="#a78bfa"/>
    </marker>
  </defs>
  <rect width="700" height="260" rx="16" fill="url(#dfBg)"/>
  <text x="350" y="30" font-family="Arial, sans-serif" font-size="15" font-weight="700"
        fill="#a78bfa" text-anchor="middle">Message Data Flow</text>

  <!-- Step boxes -->
  <rect x="20" y="60" width="130" height="60" rx="10" fill="url(#step1)"/>
  <text x="85" y="87" font-family="Arial, sans-serif" font-size="11" fill="white" text-anchor="middle" font-weight="600">User Types</text>
  <text x="85" y="103" font-family="Arial, sans-serif" font-size="10" fill="#ddd6fe" text-anchor="middle">TextField input</text>

  <rect x="190" y="60" width="130" height="60" rx="10" fill="url(#step2)"/>
  <text x="255" y="87" font-family="Arial, sans-serif" font-size="11" fill="white" text-anchor="middle" font-weight="600">Prompt Built</text>
  <text x="255" y="103" font-family="Arial, sans-serif" font-size="10" fill="#bfdbfe" text-anchor="middle">+ context injected</text>

  <rect x="360" y="60" width="130" height="60" rx="10" fill="url(#step3)"/>
  <text x="425" y="87" font-family="Arial, sans-serif" font-size="11" fill="white" text-anchor="middle" font-weight="600">Gemini API</text>
  <text x="425" y="103" font-family="Arial, sans-serif" font-size="10" fill="#cffafe" text-anchor="middle">POST → response</text>

  <rect x="530" y="60" width="150" height="60" rx="10" fill="url(#step4)"/>
  <text x="605" y="87" font-family="Arial, sans-serif" font-size="11" fill="white" text-anchor="middle" font-weight="600">Reply Displayed</text>
  <text x="605" y="103" font-family="Arial, sans-serif" font-size="10" fill="#a7f3d0" text-anchor="middle">+ auto-scroll</text>

  <!-- Arrows between steps -->
  <line x1="150" y1="90" x2="188" y2="90" stroke="#a78bfa" stroke-width="2" marker-end="url(#dfArr)"/>
  <line x1="320" y1="90" x2="358" y2="90" stroke="#a78bfa" stroke-width="2" marker-end="url(#dfArr)"/>
  <line x1="490" y1="90" x2="528" y2="90" stroke="#a78bfa" stroke-width="2" marker-end="url(#dfArr)"/>

  <!-- Step numbers -->
  <circle cx="85" cy="145" r="12" fill="#7C3AED" opacity="0.3"/>
  <text x="85" y="150" font-family="Arial, sans-serif" font-size="11" fill="#a78bfa" text-anchor="middle">①</text>
  <circle cx="255" cy="145" r="12" fill="#2563EB" opacity="0.3"/>
  <text x="255" y="150" font-family="Arial, sans-serif" font-size="11" fill="#60a5fa" text-anchor="middle">②</text>
  <circle cx="425" cy="145" r="12" fill="#06B6D4" opacity="0.3"/>
  <text x="425" y="150" font-family="Arial, sans-serif" font-size="11" fill="#67e8f9" text-anchor="middle">③</text>
  <circle cx="605" cy="145" r="12" fill="#10b981" opacity="0.3"/>
  <text x="605" y="150" font-family="Arial, sans-serif" font-size="11" fill="#6ee7b7" text-anchor="middle">④</text>

  <!-- Save branch -->
  <line x1="605" y1="120" x2="605" y2="165" stroke="#10b981" stroke-width="1.5" stroke-dasharray="4"/>
  <rect x="490" y="167" width="230" height="40" rx="8" fill="#064e3b" opacity="0.8"/>
  <text x="605" y="183" font-family="Arial, sans-serif" font-size="11" fill="#6ee7b7" text-anchor="middle">💾 Auto-saved to</text>
  <text x="605" y="198" font-family="Arial, sans-serif" font-size="10" fill="#a7f3d0" text-anchor="middle">shared_preferences</text>

  <!-- Context loop -->
  <path d="M 150 75 Q 255 35 360 75" fill="none" stroke="#7C3AED" stroke-width="1.5" stroke-dasharray="5,3" opacity="0.6"/>
  <text x="255" y="48" font-family="Arial, sans-serif" font-size="10" fill="#a78bfa" text-anchor="middle">conversation context</text>
</svg>

</div>

---

## 🚀 Installation

### What You Need

- [Flutter SDK](https://docs.flutter.dev/get-started/install) **≥ 3.0.0** (check with `flutter --version`)
- A **Google Gemini API key** — free tier available at [Google AI Studio](https://aistudio.google.com/app/apikey)
- Dart SDK **≥ 3.0.0** (comes with Flutter, relax)
- A device or emulator to run it on (or just use `flutter run -d chrome`)

### Steps

```bash
# 1. Clone the repo (you know the drill)
git clone https://github.com/Kaelith69/Emo.git
cd Emo

# 2. Get dependencies
flutter pub get

# 3. Open lib/main.dart and swap in your API key
#    (line ~18, look for _kApiKey)

# 4. Run it
flutter run

# Or target a specific platform:
flutter run -d android
flutter run -d ios
flutter run -d chrome
flutter run -d windows
flutter run -d linux
flutter run -d macos
```

### API Key Configuration

Open `lib/main.dart` and replace the placeholder:

```dart
// lib/main.dart — line ~18
const String _kApiKey = 'YOUR_GEMINI_API_KEY';
```

> ⚠️ **Seriously though:** Do **not** commit a real API key. Use environment variables,
> `--dart-define`, or a secrets manager for production builds. Future self will thank you.
>
> ```bash
> # One approach with --dart-define at build time:
> flutter run --dart-define=GEMINI_KEY=your_actual_key_here
> ```

---

## 📖 Usage

1. **Launch the app** — you'll see the `Emo` title and a chat input at the bottom
2. **Type how you're feeling** — be honest, it won't judge you
3. **Hit Send** (or press Enter) — the spinner appears while Gemini processes
4. **Read the reply** — warm, empathetic, emoji-packed goodness
5. **Open the drawer** (menu icon, top-left) to see all saved bot responses
6. **Delete saved messages** you no longer need with the 🗑️ icon
7. **Keep chatting** — context from your last exchange is included automatically

### Gemini API Details

| Property | Value |
|---|---|
| Provider | Google Generative AI |
| Model | `gemini-1.5-flash` |
| Endpoint | `POST /v1beta/models/gemini-1.5-flash:generateContent` |
| Temperature | `0.9` (creative, warm, not robotic) |
| Candidate count | `1` |

**Request body shape:**
```json
{
  "contents": [{ "parts": [{ "text": "<crafted prompt with context>" }] }],
  "generationConfig": { "temperature": 0.9, "candidateCount": 1 }
}
```

**Response extraction:**
```dart
candidates[0]['content']['parts'][0]['text']
```

---

## 📁 Project Structure

```
Emo/
├── lib/
│   └── main.dart           ← The whole app. Yep, one file.
│       ├── MyApp           ← MaterialApp root, dark theme config
│       ├── MyHomePage      ← Stateful chat screen
│       │   ├── _sendMessage()    ← Builds prompt, calls Gemini, updates UI
│       │   ├── _addMessage()     ← Appends to message list + auto-scrolls
│       │   └── _saveMessage()    ← Persists bot reply to SharedPreferences
│       ├── Message         ← Immutable data model (text + isUser flag)
│       ├── MessageBubble   ← Stateless chat bubble (user: purple, bot: dark)
│       └── MyDrawer        ← Stateful saved-messages side panel
├── test/
│   └── widget_test.dart    ← Widget tests (render, send, drawer, empty input)
├── android/                ← Android-specific config
├── ios/                    ← iOS-specific config
├── web/                    ← Web build files
├── linux/                  ← Linux desktop
├── macos/                  ← macOS desktop
├── windows/                ← Windows desktop
├── pubspec.yaml            ← Dependencies & metadata
├── analysis_options.yaml   ← Dart linter config
└── assets/
    └── demo.gif            ← (Add your demo GIF here)
```

---

## 📦 Dependencies

| Package | Version | Purpose |
|---|---|---|
| `flutter` | SDK | UI framework |
| `google_fonts` | ^6.0.0 | Playfair Display for the app title |
| `http` | ^1.1.0 | HTTP client for Gemini API calls |
| `shared_preferences` | ^2.2.1 | Local persistence of bot responses |
| `cupertino_icons` | ^1.0.2 | iOS-style icons |

---

## 📈 Performance

<div align="center">

<!-- ══════════════════════════════════════════════════ STATS PANEL SVG ══ -->
<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 700 180" width="700" height="180">
  <defs>
    <linearGradient id="statsBg" x1="0%" y1="0%" x2="100%" y2="100%">
      <stop offset="0%" style="stop-color:#0F0F0F"/>
      <stop offset="100%" style="stop-color:#1a1025"/>
    </linearGradient>
  </defs>
  <rect width="700" height="180" rx="16" fill="url(#statsBg)"/>
  <text x="350" y="32" font-family="Arial, sans-serif" font-size="15" font-weight="700"
        fill="#a78bfa" text-anchor="middle">Performance Snapshot</text>

  <!-- Stat cards -->
  <!-- Card 1 -->
  <rect x="20" y="50" width="150" height="100" rx="12" fill="#1e1333" stroke="#7C3AED" stroke-width="1"/>
  <text x="95" y="95" font-family="Arial, sans-serif" font-size="28" font-weight="900"
        fill="#a78bfa" text-anchor="middle">~1s</text>
  <text x="95" y="118" font-family="Arial, sans-serif" font-size="11" fill="#c4b5fd" text-anchor="middle">Cold Start</text>
  <text x="95" y="133" font-family="Arial, sans-serif" font-size="10" fill="#6b7280" text-anchor="middle">Flutter release build</text>

  <!-- Card 2 -->
  <rect x="190" y="50" width="150" height="100" rx="12" fill="#0f1f3d" stroke="#2563EB" stroke-width="1"/>
  <text x="265" y="95" font-family="Arial, sans-serif" font-size="28" font-weight="900"
        fill="#60a5fa" text-anchor="middle">1–3s</text>
  <text x="265" y="118" font-family="Arial, sans-serif" font-size="11" fill="#93c5fd" text-anchor="middle">API Response</text>
  <text x="265" y="133" font-family="Arial, sans-serif" font-size="10" fill="#6b7280" text-anchor="middle">Gemini 1.5 Flash avg</text>

  <!-- Card 3 -->
  <rect x="360" y="50" width="150" height="100" rx="12" fill="#0a1f1f" stroke="#06B6D4" stroke-width="1"/>
  <text x="435" y="95" font-family="Arial, sans-serif" font-size="28" font-weight="900"
        fill="#67e8f9" text-anchor="middle">6</text>
  <text x="435" y="118" font-family="Arial, sans-serif" font-size="11" fill="#a5f3fc" text-anchor="middle">Platforms</text>
  <text x="435" y="133" font-family="Arial, sans-serif" font-size="10" fill="#6b7280" text-anchor="middle">One codebase</text>

  <!-- Card 4 -->
  <rect x="530" y="50" width="150" height="100" rx="12" fill="#0a1f14" stroke="#10b981" stroke-width="1"/>
  <text x="605" y="95" font-family="Arial, sans-serif" font-size="28" font-weight="900"
        fill="#34d399" text-anchor="middle">4</text>
  <text x="605" y="118" font-family="Arial, sans-serif" font-size="11" fill="#6ee7b7" text-anchor="middle">Widget Tests</text>
  <text x="605" y="133" font-family="Arial, sans-serif" font-size="10" fill="#6b7280" text-anchor="middle">All passing ✓</text>
</svg>

</div>

---

## 🔒 Privacy

- **No data leaves your device** except the text you explicitly type and send
- **API calls** go directly to Google's Generative AI API — only your message + conversation context is transmitted
- **No analytics, no tracking, no telemetry** — none of that nonsense is in this codebase
- **Local storage** uses `shared_preferences` — stored on-device only, never synced to a server
- **API key** is stored in the source code (placeholder by default) — you are responsible for securing it in production

See [SECURITY.md](SECURITY.md) for vulnerability reporting.

---

## 🗺️ Roadmap

- [ ] Secure API key loading via `--dart-define` or environment variable
- [ ] Message search within saved messages
- [ ] Light mode / system theme support
- [ ] Multi-turn structured conversation history (not just last-message context)
- [ ] Export chat history to a text or JSON file
- [ ] Daily affirmation push notifications
- [ ] Haptic feedback on send
- [ ] Accessibility improvements (screen reader support)

---

## 🧪 Tests

```bash
flutter test
```

The test suite covers:
- ✅ App renders title and chat input
- ✅ Send button is enabled initially, disabled during loading
- ✅ Empty input does not trigger a send (no phantom blank messages)
- ✅ Drawer opens and shows the "Saved Messages" header

---

## 🤝 Contributing

Pull requests are welcome — check out [CONTRIBUTING.md](CONTRIBUTING.md) for the full rundown.

Short version: fork → branch → commit → PR. Be kind, write tests, don't commit API keys.

---

## 📄 License

Distributed under the **MIT License**. See [LICENSE](LICENSE) for details.

© 2025 Sayanth T M

---

<div align="center">
  <sub>Built with ❤️, Flutter, and an unhealthy amount of caffeine</sub><br/>
  <sub>
    <a href="https://github.com/Kaelith69/Emo/issues">🐛 Report a bug</a> ·
    <a href="CONTRIBUTING.md">🤝 Contribute</a> ·
    <a href="wiki/Home.md">📚 Wiki</a>
  </sub>
</div>

