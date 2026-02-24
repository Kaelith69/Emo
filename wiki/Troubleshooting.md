# 🔧 Troubleshooting

Something not working? This page covers the most common issues. If your problem isn't here, [open an issue](https://github.com/Kaelith69/Emo/issues) — just describe what happened, what you expected, and what platform you're on.

---

## 🚀 Installation Issues

### `flutter: command not found`

Flutter isn't in your `PATH`.

```bash
# Add to ~/.bashrc, ~/.zshrc, or equivalent:
export PATH="$PATH:/path/to/your/flutter/bin"

# Then reload:
source ~/.bashrc
```

Or check the [official Flutter installation guide](https://docs.flutter.dev/get-started/install) for your OS.

---

### `flutter pub get` fails with a network error

```
Failed to fetch
pub.dev is unreachable
```

- Check your internet connection
- If you're behind a proxy, configure `PUB_HOSTED_URL` and `FLUTTER_STORAGE_BASE_URL`
- Try: `flutter pub get --verbose` to see what's actually failing
- On corporate networks: VPN or firewall may be blocking pub.dev

---

### `No supported devices found`

You need a target device. Options:

```bash
# List available devices
flutter devices

# Run in Chrome (no device setup needed)
flutter run -d chrome

# Start an Android emulator first, then:
flutter run -d android

# For iOS (macOS only):
open Simulator  # or open via Xcode
flutter run -d ios
```

---

## 🔑 API Key Issues

### App shows: `"Failed to get a response (401). Please try again."`

Your API key is missing or wrong.

1. Open `lib/main.dart`
2. Find `const String _kApiKey = '...'`
3. Make sure you've replaced `'YOUR_GEMINI_API_KEY'` with your actual key
4. Check there are no extra spaces or characters
5. Verify the key is active at [Google AI Studio](https://aistudio.google.com/app/apikey)

---

### App shows: `"Failed to get a response (429). Please try again."`

You've hit the Gemini API rate limit for the free tier.

- Wait a minute and try again
- The free tier has per-minute and per-day limits
- For heavier usage, consider upgrading your Google AI plan

---

### App shows: `"Failed to get a response (403). Please try again."`

The API key exists but doesn't have permission to use the Gemini API.

- Go to [Google AI Studio](https://aistudio.google.com/app/apikey) and check if the key is enabled
- Make sure you accepted the terms of service for Generative AI

---

### App shows: `"Something went wrong. Please check your connection and try again."`

A network exception was thrown (not an HTTP error).

- Check your internet connection
- On web: make sure your browser isn't blocking the request (check DevTools → Network tab)
- If you're on a device with a restrictive firewall: `generativelanguage.googleapis.com` must be accessible

---

## 💾 Saved Messages Issues

### Saved messages are empty after reinstalling the app

Expected behaviour. `shared_preferences` data is deleted when you uninstall the app. There's no cloud sync — it's local storage.

---

### A saved message I deleted is still showing

Try closing and reopening the drawer. The drawer loads from `shared_preferences` on `initState` — if something is out of sync, a fresh open will reload the correct list.

---

### The drawer shows duplicate messages

This can happen if you have an old version of the app that had a bug, or if the shared_preferences data was somehow corrupted. Clearing app data (Android: Settings → Apps → Emo → Clear Data) will reset it.

---

## 🖥️ Platform-Specific Issues

### Android: app crashes on startup

Run with `flutter run --verbose` and look at the logcat output. Common causes:

- Missing Android SDK / wrong SDK version
- Emulator is too old (target API level too low)
- `flutter clean && flutter pub get` to clear cached build artifacts

```bash
flutter clean
flutter pub get
flutter run
```

### iOS: `pod install` fails

```bash
cd ios
pod install --repo-update
cd ..
flutter run -d ios
```

If that doesn't work, run `flutter doctor` and fix any Xcode or CocoaPods issues it flags.

### Web: blank screen in browser

Open browser DevTools (F12) → Console tab. Look for JavaScript errors.

- If you see CORS errors: the Gemini API supports browser requests — this shouldn't happen with a valid key, but double-check
- If the page is completely blank with no errors, try `flutter run -d chrome --web-renderer html`

### Desktop: window doesn't open

Make sure desktop support is enabled:

```bash
flutter config --enable-linux-desktop   # or macos / windows
flutter pub get
flutter run -d linux
```

---

## 🧪 Test Failures

### Tests fail with `SharedPreferences` errors

The tests require `SharedPreferences.setMockInitialValues({})` in `setUp`. If you're adding new tests, make sure this is called before any widget that uses SharedPreferences is pumped.

---

### `flutter test` fails to compile

```bash
flutter clean
flutter pub get
flutter test
```

If it still fails, check if there's a Dart syntax error in `lib/main.dart` with `flutter analyze`.

---

## 📮 Still Stuck?

If none of the above helps:

1. Run `flutter doctor -v` and copy the output
2. Run `flutter analyze` and copy any errors
3. [Open a GitHub issue](https://github.com/Kaelith69/Emo/issues) with:
   - What you tried to do
   - What happened instead
   - Your platform (Android / iOS / web / desktop + OS version)
   - The `flutter doctor` output
   - Any error messages

The more context you give, the faster you'll get an answer. 🙏
