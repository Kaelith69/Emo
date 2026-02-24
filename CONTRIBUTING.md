# 🤝 Contributing to Emo

First off — thanks for even reading this file. That already puts you ahead of 90% of would-be contributors. 🎉

Emo is a Flutter/Dart project and a genuinely simple codebase (one main.dart, some widgets, some tests). Contributing should feel approachable, not intimidating.

---

## 🧠 Before You Start

- Check [existing issues](https://github.com/Kaelith69/Emo/issues) — someone might already be working on what you want
- For major changes (new features, architecture shifts), open an issue first so we can discuss it before you spend hours coding something that might not fit
- For minor stuff (typos, bug fixes, small improvements) — just open a PR, don't overthink it

---

## 🔀 Branching Model

We keep it simple:

| Branch | Purpose |
|---|---|
| `main` | Stable, production-ish code |
| `feature/<name>` | New features |
| `fix/<name>` | Bug fixes |
| `docs/<name>` | Documentation changes |
| `chore/<name>` | Config, deps, tooling |

```bash
# Example: working on a new feature
git checkout -b feature/light-mode

# Bug fix
git checkout -b fix/drawer-scroll-crash

# Docs update
git checkout -b docs/update-wiki-installation
```

Always branch off from `main`. Don't work directly on `main`. That's a fast track to a bad time.

---

## ✍️ Commit Style

We follow [Conventional Commits](https://www.conventionalcommits.org/). The gist:

```
<type>(<optional scope>): <short description>
```

**Types:**

| Type | When to use |
|---|---|
| `feat` | New feature |
| `fix` | Bug fix |
| `docs` | Documentation only |
| `style` | Formatting, no logic changes |
| `refactor` | Code change that doesn't fix a bug or add a feature |
| `test` | Adding or updating tests |
| `chore` | Dependency updates, config changes |

**Examples:**

```
feat(drawer): add swipe-to-delete for saved messages
fix(api): handle empty candidates list from Gemini response
docs: add installation section to wiki
test: add widget test for empty drawer state
chore: upgrade google_fonts to ^6.1.0
```

Keep the subject line under 72 characters. Write in the imperative mood ("add" not "added", "fix" not "fixed").

---

## 🛠️ Development Setup

```bash
# Fork and clone
git clone https://github.com/YOUR_USERNAME/Emo.git
cd Emo

# Install dependencies
flutter pub get

# Set your API key (never commit a real one!)
# Edit lib/main.dart and set _kApiKey = 'your-test-key'

# Run the app
flutter run

# Run tests
flutter test

# Run the linter
flutter analyze
```

---

## 🧪 Tests

If you add a new feature, add a test for it. If you fix a bug, add a test that would have caught it.

Tests live in `test/widget_test.dart`. Look at the existing tests for style reference — they use `flutter_test` and `shared_preferences` mock initial values.

```bash
flutter test
```

All tests must pass before opening a PR. This is not negotiable (but it's also easy — the bar is reasonable).

---

## 🔍 Code Style

- Follow the existing Dart style (it's not exotic — just standard Flutter conventions)
- `flutter analyze` should pass with zero warnings
- Use `const` constructors wherever possible
- Don't leave debug `print()` statements in production code
- Keep widgets small and focused — if a widget is getting long, extract it

---

## 🔐 Security Rules

**Do not commit API keys.** Not even placeholder-looking ones that happen to be real. Use `YOUR_GEMINI_API_KEY` as the placeholder string. The CI will eventually thank you.

If you find a security vulnerability, please read [SECURITY.md](SECURITY.md) and report it privately, not as a public issue.

---

## 📬 Submitting a Pull Request

1. Fork the repository
2. Create a branch with a descriptive name (`git checkout -b feature/search-saved-messages`)
3. Make your changes
4. Run `flutter test` and `flutter analyze` — fix any issues
5. Commit with a clean, conventional commit message
6. Push to your fork (`git push origin feature/search-saved-messages`)
7. Open a Pull Request against `main`
8. Fill in the PR description — what did you change and why?

---

## 💬 Code of Conduct

Be a decent human. That's it.

- Be kind in code review comments — critique the code, not the person
- Constructive feedback only
- Assume good intent
- If someone makes a mistake, help them fix it

This is a small project. Let's keep the vibes good. ✌️

---

<div align="center">
  <sub>Thanks for contributing — Emo appreciates you 💜</sub>
</div>
