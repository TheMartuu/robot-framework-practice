🤖 Robot Framework Practice
Test automation practice project using Robot Framework + SeleniumLibrary against saucedemo.com.

📁 Project Structure
robot-framework-practice/
│
├── README.md
├── requirements.txt
│
└── tests/
    └── *.robot

⚙️ Setup
bashpip install robotframework
pip install robotframework-seleniumlibrary

▶️ Running the tests
Run all tests:
bashrobot tests/
Run a specific file:
bashrobot tests/login_test.robot

📊 Reports
After each run, Robot Framework automatically generates:
FileDescriptionreport.htmlVisual summary of resultslog.htmlDetailed log of each keyword executedoutput.xmlRaw output for CI/CD integration

👤 Saucedemo test users
UsernamePasswordStatusstandard_usersecret_sauce✅ Normallocked_out_usersecret_sauce🔒 Blockedproblem_usersecret_sauce🐛 Visual bugsperformance_glitch_usersecret_sauce🐌 Slow on purpose
