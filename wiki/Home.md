# 🏠 Emo Wiki — Home

Welcome to the Emo wiki. You found the secret knowledge vault. 🗝️

Emo is a cross-platform Flutter app that gives you a safe, judgment-free space to share how you're feeling — and replies with warm, empathetic, emoji-packed responses powered by Google Gemini 1.5 Flash.

It's small. It's focused. It does one thing really well. There's no user database, no ad tracking, no subscription model. Just you, the app, and some very thoughtful AI-generated replies.

---

## 📖 Wiki Pages

| Page | What's in it |
|---|---|
| [Architecture](Architecture.md) | How the app is structured, component breakdown, state management |
| [Installation](Installation.md) | Step-by-step setup guide for all platforms |
| [Usage](Usage.md) | How to use the app, API configuration, keyboard shortcuts |
| [Privacy](Privacy.md) | What data is used, what goes to the API, what stays local |
| [Troubleshooting](Troubleshooting.md) | Common errors, fixes, and "have you tried turning it off and on again" |
| [Roadmap](Roadmap.md) | Where the project is headed (features in flight, ideas in the backlog) |

---

## 🔭 Project Overview

```
Platform:      Flutter / Dart
AI Backend:    Google Gemini 1.5 Flash (REST API)
Persistence:   shared_preferences (local, on-device)
Networking:    http package (standard REST calls)
Typography:    google_fonts — Playfair Display
Target:        Android, iOS, Web, Linux, macOS, Windows
Version:       1.0.0
```

---

## ⚡ Quick Start

```bash
git clone https://github.com/Kaelith69/Emo.git
cd Emo
flutter pub get
# Add your Gemini API key to lib/main.dart
flutter run
```

Full setup details → [Installation](Installation.md)

---

## 🤝 Contributing

See [CONTRIBUTING.md](../CONTRIBUTING.md) in the repo root for the branching model, commit style, and PR process.

Short version: fork, branch off `main`, commit with conventional commits, open a PR. Be nice.

---

## 🐛 Found a Bug?

- [Open an issue](https://github.com/Kaelith69/Emo/issues) for bugs and feature requests
- See [SECURITY.md](../SECURITY.md) for vulnerability reporting (please don't post security issues publicly)
- Check [Troubleshooting](Troubleshooting.md) first — your problem might already have a known fix

---

<div align="center">
  <sub>Emo v1.0.0 · MIT License · Built with Flutter 💜</sub>
</div>
