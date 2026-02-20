<div align="center">

<!-- Logo / Banner SVG -->
<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 600 160" width="600" height="160">
  <defs>
    <linearGradient id="bg" x1="0%" y1="0%" x2="100%" y2="100%">
      <stop offset="0%" style="stop-color:#121212;stop-opacity:1" />
      <stop offset="100%" style="stop-color:#1c1b1f;stop-opacity:1" />
    </linearGradient>
    <linearGradient id="accent" x1="0%" y1="0%" x2="100%" y2="0%">
      <stop offset="0%" style="stop-color:#7c4dff;stop-opacity:1" />
      <stop offset="100%" style="stop-color:#b39ddb;stop-opacity:1" />
    </linearGradient>
  </defs>
  <rect width="600" height="160" rx="18" fill="url(#bg)" />
  <!-- Heart icon -->
  <path d="M60 75 C60 60 45 50 35 60 C25 70 35 90 60 105 C85 90 95 70 85 60 C75 50 60 60 60 75Z" fill="url(#accent)" opacity="0.9"/>
  <!-- Title -->
  <text x="110" y="85" font-family="Georgia, serif" font-size="56" font-weight="900" fill="url(#accent)">Emo</text>
  <!-- Tagline -->
  <text x="110" y="115" font-family="Arial, sans-serif" font-size="18" fill="#b39ddb" opacity="0.85">Your AI Emotional Support Buddy</text>
</svg>

<br/>

[![Flutter](https://img.shields.io/badge/Flutter-3.x-02569B?logo=flutter&logoColor=white)](https://flutter.dev)
[![Dart](https://img.shields.io/badge/Dart-3.x-0175C2?logo=dart&logoColor=white)](https://dart.dev)
[![Gemini API](https://img.shields.io/badge/Gemini-1.5%20Flash-4285F4?logo=google&logoColor=white)](https://ai.google.dev)
[![License: MIT](https://img.shields.io/badge/License-MIT-purple.svg)](LICENSE)
[![Platform](https://img.shields.io/badge/platform-Android%20%7C%20iOS%20%7C%20Web%20%7C%20Desktop-lightgrey)](https://flutter.dev)

</div>

---

## ✨ What is Emo?

**Emo** is a cross-platform Flutter application that acts as your personal emotional support companion. Powered by Google's **Gemini 1.5 Flash** large language model, Emo listens to how you feel and replies with warm, empathetic, and uplifting messages — like a caring friend in your pocket.

---

## 🎯 Features

| Feature | Description |
|---|---|
| 💬 **Contextual Chat** | Maintains conversation context for natural follow-up replies |
| 🤗 **Emotional Support** | Replies are crafted to be empathetic, uplifting, and emoji-friendly |
| 📱 **AMOLED Dark UI** | Sleek `#121212` background — easy on the eyes and battery |
| 💾 **Saved Messages** | Bot responses are persisted locally via `shared_preferences` |
| 🗑️ **Delete Saved Messages** | Individual saved messages can be removed from the side drawer |
| 🌐 **Cross-platform** | Runs on Android, iOS, Web, Linux, macOS, and Windows |
| ⚡ **Gemini 1.5 Flash** | Fast, high-quality generative responses via Google AI |

---

## 📸 Screenshots

> _Add your screenshots to a `screenshots/` folder and update the paths below._

| Chat Screen | Saved Messages Drawer |
|---|---|
| ![Chat](screenshots/chat.png) | ![Drawer](screenshots/drawer.png) |

---

## 🚀 Getting Started

### Prerequisites

- [Flutter SDK](https://docs.flutter.dev/get-started/install) **≥ 3.0.0**
- A **Google Gemini API key** — get one free at [Google AI Studio](https://aistudio.google.com/app/apikey)

### Installation

```bash
# 1. Clone the repository
git clone https://github.com/Kaelith69/Emo.git
cd Emo

# 2. Install dependencies
flutter pub get

# 3. Add your API key (see Configuration below)

# 4. Run the app
flutter run
```

### Configuration

Open `lib/main.dart` and replace the placeholder with your Gemini API key:

```dart
// lib/main.dart  (line ~18)
const String _kApiKey = 'YOUR_GEMINI_API_KEY';
```

> ⚠️ **Security note:** Never commit a real API key to a public repository.  
> Consider loading the key from an environment variable or a secrets manager for production builds.

---

## 🏗️ Architecture & Design

```
lib/
└── main.dart          # Single-file app (suitable for small projects)
    ├── MyApp          # Root MaterialApp widget
    ├── MyHomePage     # Stateful chat screen
    │   ├── _sendMessage()        # Gemini API call with context
    │   ├── _addMessage()         # Thread-safe message list update
    │   └── _saveMessage()        # SharedPreferences persistence
    ├── Message        # Immutable data model
    ├── MessageBubble  # Stateless chat bubble widget
    └── MyDrawer       # Stateful saved-messages side panel
```

**State management:** Plain `StatefulWidget` + `setState` — sufficient for the current single-screen design.  
**Persistence:** `shared_preferences` for lightweight local storage of bot responses.  
**Networking:** `http` package for REST calls to the Gemini API.  
**Typography:** `google_fonts` (Playfair Display for the app title).

---

## 🔌 API Details

| Property | Value |
|---|---|
| Provider | Google Generative AI |
| Model | `gemini-1.5-flash` |
| Endpoint | `POST /v1beta/models/gemini-1.5-flash:generateContent` |
| Temperature | `0.9` |
| Candidate count | `1` |

**Request schema:**
```json
{
  "contents": [{ "parts": [{ "text": "<prompt>" }] }],
  "generationConfig": { "temperature": 0.9, "candidateCount": 1 }
}
```

**Response parsing:**
```dart
candidates[0]['content']['parts'][0]['text']
```

---

## 📦 Dependencies

| Package | Version | Purpose |
|---|---|---|
| `flutter` | SDK | UI framework |
| `google_fonts` | ^6.0.0 | Playfair Display typography |
| `http` | ^1.1.0 | HTTP client for Gemini API |
| `shared_preferences` | ^2.2.1 | Local message persistence |
| `cupertino_icons` | ^1.0.2 | iOS-style icon set |

---

## 🧪 Running Tests

```bash
flutter test
```

The test suite covers:
- App renders title and chat input
- Send button is disabled while loading
- Empty input is silently ignored (no blank messages sent)
- Drawer opens and shows the "Saved Messages" header

---

## 🗺️ Roadmap

- [ ] Environment-variable / secrets-manager integration for the API key
- [ ] Message search within saved messages
- [ ] Theming / light mode support
- [ ] Multi-turn structured conversation history
- [ ] Export chat history to a file
- [ ] Push notification support for daily affirmations

---

## 🤝 Contributing

Pull requests are welcome! For major changes, please open an issue first.

1. Fork the repo
2. Create your feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a pull request

---

## 📄 License

Distributed under the **MIT License**. See [LICENSE](LICENSE) for details.

---

## 📬 Contact

Have questions or feedback?

- **GitHub Issues:** [github.com/Kaelith69/Emo/issues](https://github.com/Kaelith69/Emo/issues)

---

<div align="center">
  <sub>Built with ❤️ and Flutter</sub>
</div>

