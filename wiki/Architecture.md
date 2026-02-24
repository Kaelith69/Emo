# 🏗️ Architecture

Emo is deliberately simple. This is a feature, not a limitation.

The entire application lives in a single file: `lib/main.dart`. There's no BLoC, no Riverpod, no Provider, no GetX. Just `StatefulWidget` + `setState` + good old-fashioned Flutter widget composition.

If that sounds boring — it is. Boringly correct. The app is single-screen, single-concern, and doesn't need an enterprise architecture pattern.

---

## 📦 Component Breakdown

```
lib/main.dart
├── Configuration constants
│   ├── _kApiKey        — Gemini API key (placeholder, set yours here)
│   └── _kApiUrl        — Gemini 1.5 Flash endpoint URL
│
├── Message (data model)
│   ├── text: String    — message content
│   └── isUser: bool    — true = user bubble, false = bot bubble
│
├── MyApp (StatelessWidget)
│   └── MaterialApp with dark theme (#121212 background)
│
├── MyHomePage (StatefulWidget)
│   ├── State: _messages (List<Message>), _isLoading (bool)
│   ├── State: _lastUserInput, _lastBotResponse (context tracking)
│   ├── _sendMessage()  — builds prompt, calls Gemini, updates state
│   ├── _addMessage()   — appends message + triggers scroll animation
│   └── _saveMessage()  — persists bot reply to shared_preferences
│
├── MessageBubble (StatelessWidget)
│   ├── User messages   — right-aligned, #432e81 background
│   └── Bot messages    — left-aligned, #1c1b1f background
│
└── MyDrawer (StatefulWidget)
    ├── _loadSavedMessages()  — reads from shared_preferences on init
    └── _deleteMessage()      — removes by index, updates storage + state
```

---

## 🧠 State Management

**Pattern:** `StatefulWidget` + `setState`

The app manages two types of state:

| State | Location | Contents |
|---|---|---|
| Chat state | `_MyHomePageState` | `_messages` list, `_isLoading` flag, context strings |
| Drawer state | `_MyDrawerState` | `_savedMessages` list loaded from SharedPreferences |

`setState()` is called any time the UI needs to refresh: when a message is added, when loading starts/stops, when a saved message is deleted.

There's no need for anything more complex here. The two states are independent — the chat screen doesn't need to know about the drawer's saved messages list in real time. When the drawer opens, it loads fresh from storage.

---

## 🌐 Network Layer

**Package:** `http` (^1.1.0)

All API calls go through a single method: `_sendMessage()`.

```dart
final response = await http.post(
  Uri.parse('$_kApiUrl?key=$_kApiKey'),
  headers: {'Content-Type': 'application/json'},
  body: jsonEncode(requestBody),
);
```

The Gemini API is called as a simple REST endpoint — no SDK, no streaming. The request body includes the prompt (with injected context), and the response is parsed directly from JSON.

**Error handling:**
- HTTP errors (non-200 status): displays error message in chat
- Network exceptions (caught): displays connection error message
- Empty candidates list: silently ignored (edge case that shouldn't occur with Gemini Flash)

---

## 💾 Storage Layer

**Package:** `shared_preferences` (^2.2.1)

Only bot responses are persisted — not user messages. The storage schema:

```
Key:   "saved_messages"
Value: List<String>  (each string is one bot response)
```

Operations:
- **Save:** append to list on every successful bot response
- **Load:** read full list when the drawer opens (`initState`)
- **Delete:** remove by index, overwrite the list

This is intentionally lightweight. No SQLite, no Isar, no Hive. For the current use case (saving a handful of bot messages for later re-reading), a string list in shared_preferences is perfectly adequate.

---

## ✍️ Prompt Engineering

The prompt sent to Gemini is constructed dynamically in `_sendMessage()`:

```dart
"Give a brief uplifting and caring reply that sounds like emotional support 
from a friend for the following text message (use appropriate emojis too, 
don't repeat the response): '$inputText', in the context of my previous 
input: '$_lastUserInput', and your previous response: '$_lastBotResponse'"
```

This is a single-turn prompt that injects:
1. The current user message
2. The previous user message (context)
3. The previous bot response (context)

It's not a multi-turn conversation history — it's a two-message context window. Simple, effective, and keeps prompt length predictable.

**Temperature: 0.9** — high enough to feel human and warm, low enough to stay coherent. Goldilocks zone for emotional support responses.

---

## 🎨 UI Design Decisions

| Decision | Reasoning |
|---|---|
| `#121212` background | AMOLED-friendly dark theme — saves battery on OLED screens |
| `#432e81` user bubbles | Deep purple — visually distinct, matches the app's purple palette |
| `#1c1b1f` bot bubbles | Slightly lighter dark — clearly different from background |
| Playfair Display title | Serif in a dark UI gives character without being precious |
| Circular send button | Consistent with Material 3 FAB aesthetic for action buttons |
| No status bar color override | Let the OS handle it — less maintenance |

---

## 🔮 Where Architecture Could Evolve

Right now the app is intentionally minimal. If it grows, here's the natural evolution path:

- **Multi-screen:** Extract routes, consider `go_router`
- **Complex state:** Consider Riverpod (simpler) or BLoC (if you enjoy architecture astronautics)
- **Local DB:** If saved messages need richer metadata (timestamps, tags), migrate to Isar or SQLite
- **API abstraction:** Extract Gemini API calls to a separate service class for testability
