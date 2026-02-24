# 🔒 Privacy

Let's be transparent about what Emo does and doesn't do with your data. No legalese, no buried footnotes.

---

## 📊 Data Summary

| Data | Sent Externally? | Stored Locally? | Encrypted? |
|---|---|---|---|
| Your typed messages | ✅ Yes — to Google Gemini API | ❌ No | In transit: yes (HTTPS) |
| Bot responses | ❌ No | ✅ Yes — shared_preferences | ❌ No (plain text) |
| Conversation context (last exchange) | ✅ Yes — included in API prompt | ❌ No | In transit: yes (HTTPS) |
| Analytics / telemetry | ❌ Never | ❌ Never | N/A |
| User account / identity | ❌ Never | ❌ Never | N/A |
| Location data | ❌ Never | ❌ Never | N/A |

---

## 🌐 What Goes to the Gemini API

Every time you tap Send, the following is transmitted to Google's Generative AI API:

1. **Your current message** — the text you typed
2. **Your previous message** — for conversation context
3. **The bot's previous response** — also for context
4. **The prompt template** — the system instruction telling Gemini how to respond

This data travels over HTTPS to `generativelanguage.googleapis.com`. It is processed by Google's Gemini 1.5 Flash model to generate a response.

**Emo has no control over what Google does with this data.** Google's [Privacy Policy](https://policies.google.com/privacy) and [Generative AI terms](https://policies.google.com/terms/generative-ai/use-policy) apply to data processed by the Gemini API.

> 💡 **Practical note:** Don't share personally identifiable information, account credentials, or anything you'd be uncomfortable with Google processing. Treat it like any other LLM-powered product.

---

## 💾 What Stays on Your Device

Bot responses are saved locally using `shared_preferences`. This stores data in the app's private storage directory on your device:

- **Android:** `/data/data/com.artemis369.emo/shared_prefs/`
- **iOS:** App's `NSUserDefaults` sandbox
- **Web:** Browser `localStorage`
- **Desktop:** OS-specific app data directory

This data:
- Never leaves your device
- Is not synced to any cloud service
- Is not accessible to other apps (OS-enforced sandboxing on mobile)
- Is deleted when you uninstall the app

**However:** It is stored in **plain text, unencrypted**. On a rooted Android device or a device that's been physically compromised, this data could theoretically be accessed. For a personal emotional support app on your own device, this is a generally acceptable tradeoff. If you're building on top of Emo for a more sensitive use case, add encryption.

---

## 🚫 What Emo Does NOT Do

- No analytics SDK (no Firebase Analytics, no Mixpanel, no Amplitude)
- No crash reporting SDK (no Sentry, no Crashlytics) — unless you add one
- No ad networks
- No user accounts or sign-in
- No cloud sync
- No background processes or background data access
- No access to contacts, camera, microphone, or location
- No tracking pixels
- No third-party SDKs besides Flutter, `http`, `google_fonts`, and `shared_preferences`

---

## 🔑 API Key Security

The Gemini API key is stored in the compiled app source as a constant. In a production deployment:

- The key could potentially be extracted from the compiled binary (especially on Android with reverse engineering tools)
- Use `--dart-define` to pass the key at build time instead of hardcoding it
- Consider server-side proxying for production apps where you don't want any chance of key exposure

This is a known limitation, documented transparently. For personal use and development, it's acceptable. For a public app, use a proxy.

---

## 📬 Questions

If you have privacy-specific concerns, open a [GitHub issue](https://github.com/Kaelith69/Emo/issues) or see [SECURITY.md](../SECURITY.md) for how to report sensitive issues privately.
