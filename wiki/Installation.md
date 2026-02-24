# 📦 Installation

Getting Emo running is not complicated. If you've built a Flutter app before, you'll be done in 5 minutes. If this is your first Flutter project, allow 20–30 minutes to get Flutter set up — after that it's still fast.

---

## 🛠️ Prerequisites

### 1. Flutter SDK (≥ 3.0.0)

Install Flutter by following the [official guide](https://docs.flutter.dev/get-started/install) for your OS.

After installing, verify it works:

```bash
flutter --version
# Should show: Flutter 3.x.x, Dart 3.x.x
```

Run the doctor to check for any missing dependencies:

```bash
flutter doctor
```

Fix any issues it flags before proceeding. Pay attention to any ✗ symbols — they'll bite you later if ignored.

### 2. Gemini API Key

1. Go to [Google AI Studio](https://aistudio.google.com/app/apikey)
2. Sign in with your Google account
3. Click **Create API key**
4. Copy the key — you'll need it in step 4 below

The free tier is generous. You shouldn't need a paid tier for development and personal use.

### 3. A Platform Target

You need at least one of:
- Android emulator or physical device (Android Studio required for emulator)
- iOS simulator (macOS + Xcode required)
- Chrome browser (for web — works out of the box)
- Your desktop OS (Linux, macOS, or Windows — Flutter supports all three)

---

## 🚀 Installation Steps

### Step 1: Clone the Repository

```bash
git clone https://github.com/Kaelith69/Emo.git
cd Emo
```

### Step 2: Install Dependencies

```bash
flutter pub get
```

This downloads all packages listed in `pubspec.yaml`. Should take about 30 seconds on a decent connection.

### Step 3: (Optional) Verify Everything Looks Good

```bash
flutter analyze
```

Should return zero errors and zero warnings.

### Step 4: Add Your Gemini API Key

Open `lib/main.dart` and find this line near the top (around line 18):

```dart
const String _kApiKey = 'YOUR_GEMINI_API_KEY';
```

Replace `'YOUR_GEMINI_API_KEY'` with your actual Gemini API key:

```dart
const String _kApiKey = 'AIzaSy...your_key_here...';
```

> ⚠️ **Do not commit this change if the key is real.** Add `lib/main.dart` to your `.gitignore` overrides, or better yet, use `--dart-define` so the key never appears in source at all:
>
> ```bash
> flutter run --dart-define=GEMINI_KEY=your_actual_key
> ```
>
> Then in `main.dart`:
> ```dart
> const String _kApiKey = String.fromEnvironment('GEMINI_KEY');
> ```

### Step 5: Run the App

```bash
# Auto-selects a connected device or emulator
flutter run

# Target a specific platform
flutter run -d android
flutter run -d ios
flutter run -d chrome
flutter run -d windows
flutter run -d linux
flutter run -d macos
```

---

## 🧪 Running Tests

```bash
flutter test
```

The test suite is in `test/widget_test.dart`. All 4 tests should pass. If they don't, something went wrong with the setup — check that `flutter pub get` ran cleanly.

---

## 🔧 Platform-Specific Notes

### Android

- Requires Android SDK (installed via Android Studio)
- `flutter doctor` will tell you if the SDK is missing
- Run on a physical device via USB (enable USB debugging in Developer Options) or an Android emulator

### iOS

- Requires macOS and Xcode
- Run `xcode-select --install` if command-line tools are missing
- Physical device deployment requires an Apple Developer account

### Web

```bash
flutter run -d chrome
```

Works out of the box. No extra setup. The app is fully functional in a browser.

### Desktop (Linux / macOS / Windows)

```bash
# Enable if not already enabled
flutter config --enable-linux-desktop
flutter config --enable-macos-desktop
flutter config --enable-windows-desktop

flutter run -d linux   # or macos / windows
```

---

## 🐛 Installation Troubleshooting

**"flutter: command not found"**
→ Flutter's `bin` directory isn't in your `PATH`. Add it:
```bash
export PATH="$PATH:/path/to/flutter/bin"
```

**"No devices found"**
→ Start an emulator, connect a device, or add `-d chrome` to run in browser.

**"flutter pub get fails with network error"**
→ Check your internet connection and proxy settings. Try `flutter pub get --verbose` for more detail.

**API key issues (401 / 403 from Gemini)**
→ Make sure you copied the key correctly (no trailing spaces). Verify the key is active in [Google AI Studio](https://aistudio.google.com/app/apikey).

More troubleshooting → [Troubleshooting](Troubleshooting.md)
