# 🤖 Robot Framework Practice

Test automation practice project using **Robot Framework + SeleniumLibrary** for [saucedemo.com](https://www.saucedemo.com).

---

## 📁 Project Structure

```
robot-framework-practice/
│
├── README.md
├── requirements.txt
│
└── tests/
    └── *.robot
```

---

## ⚙️ Setup

```bash
pip install robotframework
pip install robotframework-seleniumlibrary
```

---

## ▶️ Running the tests

Run all tests:
```bash
robot tests/
```

Run a specific file:
```bash
robot tests/login_test.robot
```

---

## 📊 Reports

After each run, Robot Framework automatically generates:

| File | Description |
|---|---|
| `report.html` | Visual summary of results |
| `log.html` | Detailed log of each keyword executed |
| `output.xml` | Raw output for CI/CD integration |

---

## 👤 Saucedemo test users

| Username | Password | Status |
|---|---|---|
| `standard_user` | `secret_sauce` | ✅ Normal |
| `locked_out_user` | `secret_sauce` | 🔒 Blocked |
| `problem_user` | `secret_sauce` | 🐛 Visual bugs |
| `performance_glitch_user` | `secret_sauce` | 🐌 Slow on purpose |
