# Contribution Guide 🤝

Thank you for your interest in contributing to **Speech Roulette**! This project is open to improvements and new ideas. By following the guidelines below, we can ensure effective and organized collaboration.

---

## 📋 General Guidelines
Contributing to Speech Roulette is simple and highly appreciated! Before getting started, please review these guidelines:

- Keep the code readable and well-organized.
- Follow the existing style for consistency.
- Use clear names for variables, functions, and commits.
- Write comments to explain any complex parts of the code.
- Test your changes before submitting a pull request.

---

## 📂 Project Structure (Flutter)
The project is built entirely with **Flutter**.
- **Logic & UI:** The main source code is located in `lib/`.
- **Assets:** Images and fonts are stored in the `assets/` directory.
- **Tests:** All unit and widget tests are located in `test/`.
- **Topics:** Game topics are managed through data files within the project.

---

## 🚀 Getting Started

1. **Fork and Clone the repository**:
    ```bash
    git clone [https://github.com/Dr-Faxzty/speech_roulette](https://github.com/Dr-Faxzty/speech_roulette)
    cd speech_roulette
    ```
2. **Environment Setup**:
   Ensure you have Flutter installed on your system (`flutter doctor`).
   ```bash
   flutter pub get
   ```

3. **Code Generation (Mocks/Runner)**:
   If you modify classes that require code generation:
   ```bash
   dart run build_runner build --delete-conflicting-outputs
   ```
   
4. **API Key Configuration**:
   To test Unsplash images locally, use the `--dart-define` flag during execution:
   ```bash
   flutter run -d chrome --dart-define=UNSPLASH_ACCESS_KEY=your_api_key
   ```
5. **Create a Branch**:
   Create a new branch for your feature or bug fix:
   ```bash
    git checkout -b feature/your-feature-name
    ```
   
---

## 📝Rules for Commits

We use the Conventional Commits standard to maintain a clear and consistent commit history.

The format is as follows:
```<type>(<scope>): <description>```

### Types:
- **feat**: A new feature for the user.
- **fix**: A bug fix for the user.
- **docs**: Changes to the documentation.
- **style**: Changes that do not affect the meaning of the code (white-space, formatting, missing semi-colons, etc).
- **refactor**: A code change that neither fixes a bug nor adds a feature.
- **test**: Adding missing tests or correcting existing tests.

### Example:
```feat(game): add new game mode for advanced players```

---

## 🛠️ Testing

Our CI/CD workflow requires a test coverage of at least **70%**.
Before submitting a PR, please run:
```bash
# Run tests and generate coverage report
flutter test --coverage

# Static code analysis
flutter analyze
```

---

## 📢How to Submit a Pull Request

Submitting a pull request is straightforward. If you’re new to pull requests or open source, check out this helpful guide:  
👉 **[How to create a pull request](https://opensource.guide/how-to-contribute/#pull-requests)**

### Main Steps:
1. **Fork this repository**.

2. **Create a new branch** for your changes:
    ```bash
    git checkout -b feature/your-new-branch
    ```
3. **Commit your changes** with a clear message:
    ```bash
    git commit -m "Add new feature X"
    ```
4. **Push the branch** to your fork:
    ```bash
    git push origin feature/your-new-branch
    ```
5. **Open a pull request** on this repository, describing what you’ve changed.

---

## ✅ TODO List

Here are some ideas and tasks to improve Speech Roulette. Feel free to pick one and contribute!

### 🌟 Key Ideas
- **New Topics**: Add fresh topics to enrich the game while maintaining consistency with the style and difficulty levels.

- **UI/UX**:
    - Enhance the user interface for a more intuitive experience.
    - Add engaging animations to make the game more dynamic.

- **Code Optimization**:
    - Improve the efficiency of existing functions.
    - Refactor code to enhance readability and modularity.

- **Translations**:
  Help us make the game available in other languages.

---

## ✉️ Support and Contact
Do you have questions, bug reports, or suggestions? We’d love to hear from you! Here’s how you can reach out:

- **Open an Issue**: Report a problem or propose a new feature by opening an **[issue](https://github.com/Dr-Faxzty/speech_roulette/issues)** on GitHub.

Thank you for your support and interest in improving Speech Roulette! Every contribution helps make the project even more engaging and fun. 🎉

---

## 🙏 Acknowledgments
Thank you for your time and effort in contributing to **Speech Roulette**. Every contribution, big or small, is valuable in improving the project and engaging more people in this experience!
