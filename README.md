# ZooWho 🦁

A fun iOS quiz game where players guess animals based on clues and images. Test your wildlife knowledge across multiple rounds and difficulty levels!

---

## 🛠 Technologies

| Layer | Tool |
|---|---|
| Language | Swift |
| UI | SwiftUI |
| Testing | XCTest |
| Code Signing | Fastlane Match |
| Deployment | Fastlane + TestFlight |
| CI/CD | GitHub Actions |

---

## ⚙️ CI/CD Pipeline

This project uses a fully automated CI/CD pipeline with GitHub Actions and Fastlane.

### How it works

```
Push tag (vX.X.X)
       │
       ▼
┌─────────────┐
│  CI — Tests  │  Runs XCTest suite on every push
└─────────────┘
       │
       ▼
┌──────────────────┐
│  CD — Build &    │  Triggered on version tags (v*)
│  Deploy          │
└──────────────────┘
       │
       ├──▶ Fastlane Match (certificates & profiles)
       ├──▶ Fastlane Beta Lane (build + sign)
       ├──▶ Upload to TestFlight
       └──▶ Create GitHub Release
```
### Deploying a new version

```bash
git tag v1.0.0
git push origin v1.0.0
```

This triggers the CD workflow automatically.

---

## 📦 Project Structure

```
ZooWho/
├── ZooWho/               # App source code
├── ZooWhoTests/          # Unit tests (XCTest)
├── fastlane/
│   ├── Fastfile          # Lane definitions (test, beta)
│   ├── Matchfile         # Code signing configuration
│   └── Appfile           # App metadata
└── .github/
    └── workflows/
        ├── ci.yml        # Runs tests on every push
        └── cd.yml        # Builds and deploys on version tags
```

---

## 📲 TestFlight

New builds are automatically uploaded to TestFlight on every version tag push. Internal testers receive the build within minutes.
