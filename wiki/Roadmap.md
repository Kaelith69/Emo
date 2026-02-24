# 🗺️ Roadmap

Where Emo is going — roughly in order of likelihood and usefulness.

This is an honest roadmap, not a marketing checklist. Items here are things that would genuinely improve the app. Some will ship. Some might not. Real talk.

---

## 🚧 In Progress / High Priority

### 🔑 Secure API Key Loading

**Status:** Planned  
**Why it matters:** Hardcoding the API key in source is fine for development but not great for production or public forks.

**Approach:**
```bash
flutter run --dart-define=GEMINI_KEY=your_key
flutter build apk --dart-define=GEMINI_KEY=your_key
```
```dart
const String _kApiKey = String.fromEnvironment('GEMINI_KEY');
```

This way the key is injected at build time and never appears in the source repository.

---

## 📋 Backlog — Features

### 💬 Multi-Turn Conversation History

**Status:** Planned  
**Why it matters:** Right now, Emo only remembers the last exchange (one message pair). A proper conversation history would make the context much richer.

**Approach:** Send the last N message pairs to Gemini as a structured `contents` array instead of embedding previous messages as string interpolation in the prompt.

```json
{
  "contents": [
    { "role": "user", "parts": [{ "text": "I'm stressed about work" }] },
    { "role": "model", "parts": [{ "text": "That sounds really tough..." }] },
    { "role": "user", "parts": [{ "text": "Yeah, my deadline is tomorrow" }] }
  ]
}
```

---

### 🔍 Search Within Saved Messages

**Status:** Planned  
**Why it matters:** Once you have 50+ saved messages, scrolling through all of them to find a specific one gets tedious.

**Approach:** Add a search TextField at the top of the drawer that filters the saved messages list in real time.

---

### 🌅 Light Mode / System Theme Toggle

**Status:** Planned  
**Why it matters:** Not everyone uses dark mode 24/7. Let the app follow the system theme, or add a manual toggle.

**Approach:** Check `MediaQuery.of(context).platformBrightness` and apply a light `ThemeData` variant accordingly.

---

### 📤 Export Chat History

**Status:** Planned  
**Why it matters:** Sometimes you want to save a particularly helpful conversation outside the app — as a text file, a PDF, or just copy it to another app.

**Approach:** Add a share/export button in the drawer. Use the `share_plus` package to share saved messages as text.

---

### 🔔 Daily Affirmation Notifications

**Status:** Backlog  
**Why it matters:** A gentle nudge of positivity once a day could be a nice wellness feature.

**Approach:** Use `flutter_local_notifications` + a scheduler. Generate affirmations from Gemini or use a curated local list.

**Complexity:** Medium-high (background tasks, notification permissions on all platforms).

---

### 📅 Timestamps on Saved Messages

**Status:** Backlog  
**Why it matters:** Knowing when a message was saved adds context (e.g., "that was a rough week in November").

**Approach:** Store `{text, timestamp}` JSON objects instead of raw strings. Requires a migration for existing saved data.

---

### 🏷️ Tags / Categories for Saved Messages

**Status:** Backlog  
**Why it matters:** Being able to tag saved messages ("motivation", "anxiety", "work stress") would make them more useful to revisit.

---

### ♿ Accessibility Improvements

**Status:** Backlog  
**Why it matters:** Screen reader support, sufficient color contrast, and semantic labels make the app usable by more people.

**Specific items:**
- Add `Semantics` labels to the send button and drawer icon
- Verify color contrast ratios meet WCAG AA
- Test with TalkBack (Android) and VoiceOver (iOS)

---

### 📳 Haptic Feedback on Send

**Status:** Nice to have  
**Why it matters:** A small physical confirmation when you send a message adds a subtle but satisfying tactile response.

**Approach:** `HapticFeedback.lightImpact()` in `_sendMessage()` when the user taps send.

---

## 🚫 Explicitly Not Planned

These are things we're intentionally *not* building, at least not now:

| Feature | Why not |
|---|---|
| User accounts / sign-in | Adds complexity, privacy concerns, server costs. Not aligned with the app's local-first nature. |
| Cloud sync of saved messages | Same as above. If you want cloud sync, use your device's backup. |
| Multiple AI provider support | Gemini works well. Adding OpenAI/Anthropic/etc. adds configuration complexity without meaningfully improving the core use case. |
| Social / sharing features | Emo is personal. Sharing emotional support conversations isn't the goal. |
| Web scraping / news feed | Scope creep. Hard no. |

---

## 💡 Want to Contribute to a Roadmap Item?

Check [CONTRIBUTING.md](../CONTRIBUTING.md) for how to get started. Comment on the relevant [GitHub issue](https://github.com/Kaelith69/Emo/issues) (or create one if it doesn't exist) before starting a big feature — alignment upfront saves everyone time.

---

<div align="center">
  <sub>Roadmap is subject to the whims of free time, motivation, and caffeine levels ☕</sub>
</div>
