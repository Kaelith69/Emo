# 📋 Changelog

All notable changes to Emo are documented here.

Format follows [Keep a Changelog](https://keepachangelog.com/en/1.0.0/).
Versioning follows [Semantic Versioning](https://semver.org/).

---

## [Unreleased]

### Planned
- Secure API key loading via `--dart-define`
- Saved message search
- Light / system theme toggle
- Multi-turn structured conversation history
- Chat export (text / JSON)
- Daily affirmation push notifications
- Haptic feedback on message send

---

## [1.0.0] — 2025-02-24

> _The one where it all begins. 🎉_

### Added
- **Core chat UI** — AMOLED dark theme (`#121212`), chat bubbles with user/bot distinction
- **Gemini 1.5 Flash integration** — `POST` to Google Generative AI REST API with contextual prompt engineering
- **Conversation context** — last user message and last bot response are injected into each new prompt for natural follow-up replies
- **Saved Messages drawer** — bot responses are persisted locally via `shared_preferences`
- **Delete saved messages** — individual messages deletable from the drawer with a trash icon
- **Auto-scroll** — chat list scrolls to the latest message automatically after each reply
- **Loading state** — send button shows a `CircularProgressIndicator` and disables itself while waiting for the API
- **Error handling** — graceful error messages for network failures and non-200 API responses
- **Cross-platform support** — Android, iOS, Web, Linux, macOS, Windows
- **Widget test suite** — 4 tests covering render, send state, empty input guard, and drawer open
- **Google Fonts** — Playfair Display for the app title because aesthetics matter
- **MIT License**

---

## Version History Summary

| Version | Date | Highlight |
|---|---|---|
| 1.0.0 | 2025-02-24 | Initial release 🚀 |

---

[Unreleased]: https://github.com/Kaelith69/Emo/compare/v1.0.0...HEAD
[1.0.0]: https://github.com/Kaelith69/Emo/releases/tag/v1.0.0
