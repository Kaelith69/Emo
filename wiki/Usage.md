# 📖 Usage

Emo is intentionally simple to use. There's one screen, one purpose: talk about how you're feeling, get a warm response.

---

## 🖥️ Interface Overview

When you open the app you'll see:

```
┌─────────────────────────────────┐
│  ☰              Emo             │  ← AppBar
├─────────────────────────────────┤
│                                 │
│  [Chat messages appear here]    │  ← Scrollable message list
│                                 │
│  Bot: Hey, that sounds really   │
│  tough. You've got this 💪      │
│                                 │
│            User: I'm stressed   │
│                                 │
├─────────────────────────────────┤
│  [How are you feeling now?...]  │  ← Text input + Send button
└─────────────────────────────────┘
```

- **Top-left ☰** — opens the Saved Messages drawer
- **Center title** — just "Emo" in Playfair Display serif
- **Message list** — scrollable, auto-scrolls to newest message
- **Text input** — multiline, rounded pill shape
- **Send button** — shows spinner while waiting for API response

---

## 💬 Sending a Message

1. Tap the text input at the bottom
2. Type whatever you're feeling — there's no character limit, but shorter messages tend to get better responses
3. Hit **Send** (the icon button) or press **Enter**
4. A loading spinner replaces the send icon while Gemini processes
5. The bot's reply appears as a left-aligned bubble with the bot's response

The send button is **disabled during loading** — you can't spam-send. This is intentional: double-sending mid-request would mess up the conversation context.

---

## 🔄 How Context Works

Each message you send includes:
- Your **current** message
- Your **previous** message (from the last exchange)
- The **bot's previous reply** (from the last exchange)

This gives Gemini enough context for natural follow-ups like:

> **You:** "I'm overwhelmed with work"
> **Emo:** "That sounds really draining 😔 Remember to take it one task at a time..."
>
> **You:** "Yeah and my boss keeps adding more tasks"
> **Emo:** [Now responds with awareness of the work stress context]

The context window is limited to one exchange deep (not the full conversation history). Replies reference the recent conversation but don't accumulate all previous messages indefinitely.

---

## 💾 Saving Messages

Every bot response is automatically saved to local storage (via `shared_preferences`). You don't have to do anything — if Emo says something that resonates, it's already stored.

To access saved messages:
1. Tap the **☰ menu icon** in the top-left
2. The **Saved Messages drawer** slides in from the left
3. Scroll through your saved responses

---

## 🗑️ Deleting Saved Messages

1. Open the drawer (☰ menu icon)
2. Find the message you want to remove
3. Tap the **🗑️ delete icon** on the right side of the message
4. It's gone. Immediately. No confirmation dialog. (Decisive. We respect that.)

If the drawer is empty, you'll see: `"No saved messages yet."` — which is also a totally valid state.

---

## ⌨️ Keyboard Behaviour

- **Enter** submits the message (same as tapping Send)
- The input field supports **multiline** — you can write as much as you want
- On desktop, the field resizes vertically as you type more lines

---

## 🔧 API Configuration

The app calls the Gemini 1.5 Flash API with these settings:

| Parameter | Value | Effect |
|---|---|---|
| `temperature` | 0.9 | High creativity — replies feel warm and human, not robotic |
| `candidateCount` | 1 | One response per request — deterministic enough |
| Model | `gemini-1.5-flash` | Fast, capable, free-tier friendly |

The prompt template (constructed in `_sendMessage()`):

```
Give a brief uplifting and caring reply that sounds like emotional support 
from a friend for the following text message (use appropriate emojis too, 
don't repeat the response): '{userMessage}', in the context of my previous 
input: '{previousUserMessage}', and your previous response: '{previousBotResponse}'
```

This tells Gemini to:
- Keep it brief (not write an essay)
- Sound like a friend, not a therapist
- Use emojis appropriately
- Not repeat itself between messages

---

## 🚫 What Happens When Things Go Wrong

**Network error:**
> `"Something went wrong. Please check your connection and try again."`

This appears as a bot message in the chat. The loading spinner stops and the send button re-enables.

**API error (e.g., invalid API key, rate limit):**
> `"Failed to get a response (401). Please try again."`

The HTTP status code is included in the error message so you know what actually happened.

In both cases, the user's typed message is *not* added to the chat — the input field stays populated so you can try again without re-typing.

Wait, actually — the current implementation adds the user message only after a successful API call. If the request fails, no message appears in the chat at all. This is the intended behavior (no phantom messages).
