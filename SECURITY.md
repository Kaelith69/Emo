# 🔐 Security Policy

## Supported Versions

| Version | Supported |
|---|---|
| 1.0.x | ✅ Yes |

---

## 🚨 Reporting a Vulnerability

Found a security issue? Please **do not** open a public GitHub issue for it. Posting a vulnerability publicly before it's patched is like announcing a house key under the doormat — not great.

**Instead, report it privately:**

1. Email the maintainer directly via a [GitHub security advisory](https://github.com/Kaelith69/Emo/security/advisories/new)
2. Or use GitHub's "Report a vulnerability" button on the [Security tab](https://github.com/Kaelith69/Emo/security)

**Include in your report:**
- Description of the vulnerability
- Steps to reproduce
- Potential impact
- Suggested fix (optional, but appreciated)

---

## ⏱️ Response Timeline

| Stage | Target |
|---|---|
| Acknowledgement | Within 3 business days |
| Initial assessment | Within 7 days |
| Fix / patch | Depends on severity — critical issues get priority |
| Public disclosure | After patch is released |

---

## ⚠️ Known Considerations

### API Key Exposure
The app currently stores the Gemini API key as a compile-time constant in `lib/main.dart`. This is intentional for simplicity in development, but:

- **Do not commit a real API key** to a public repository
- For production builds, use `--dart-define`, environment variables, or a secrets manager
- API keys embedded in compiled mobile apps can technically be extracted — treat your Gemini key as sensitive

### Data Transmission
User messages are sent to Google's Generative AI API. This is by design — that's literally how the app works. If this concerns you for a particular use case, this app may not be appropriate for that context.

### Local Storage
`shared_preferences` stores bot responses on-device in plain text. There is no encryption applied. For a personal emotional support app on a personal device, this is considered acceptable. If you're building on top of this and handling sensitive data, add encryption.

---

## 🙏 Responsible Disclosure

We appreciate security researchers who follow responsible disclosure. If you report a valid vulnerability, we'll:

- Credit you in the fix commit (if you want)
- Say thank you publicly (if you want)
- Not be weird about it

Thanks for helping keep Emo safe. 💜
