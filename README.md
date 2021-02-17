# Github Issues Tracker App

A simple mobile applicaiton made with [Flutter Framework](https://flutter.dev/) to help you track issues on your github repositories. The app is available on Google Playstore and is currently in _Version: 1.0.0+1_.

---

### Inspiration

The Girhub Issues Tracker App was inspired by the need to keep track of all issues on my personal repository. Initially, before GitHub published their native mobile application, it was tiresome to keep logging into the browser to keep track of all issues.

### Geting Started

##### Step 1

```Bash
git clone https://github.com/stivo-m/github_issues_app.git
```

##### Step 2

```Bash
cd github_issues_app
```

##### Step 3

```Bash
flutter pub get
```

##### Step 4

You need to configure various keys for the app to function properly. Navigate to the _Lib > constants > secret_keys.dart_ as below.

```
|- lib/
    |- constants/
        |- secret_keys.dart
```

You can find these keys from both [Github's oAuth Apps](https://github.com/settings/developers) and [Firebase Console](https://console.firebase.google.com/) websites for your app

```
const GITHUB_CLIENT_ID = "your-client-id";
const GITHUB_CLIENT_SECRET = "your-client-secret";
const FIREBASE_API_KEY = "firebase-api-key";
const FIREBASE_APP_ID = "firebase-app-id";
const FIREBASE_MESSAGING_SENDER_ID = "firebase-messaging-sender-id";
const FIREBASE_PROJECT_ID = "firebase-project-id";
const AUTH_DOMAIN =
    "https://[your-firebase-project-id-here].firebaseapp.com/__/auth/handler";
```

You can copy the above configurations into the _Lib > constants > secret_keys.dart_ and update them with your keys.

##### Step 5

Before running this step, ensure you have your emulator/simulator running

```Bash
flutter run
```

---

### File Structure

```
github_issues_app/
|- android
|- assets
|- build
|- ios
|- lib/
    |- constants
    |- graphql
    |- models
    |- redux/
        |- actions
        |- middleware
        |- reducers
        |- state
    |- routes
    |- screens/
        |-authentication
        |-issues
        |-navigation
    |- services
    |- main.dart
|- .gitignore
|- pubspec.lock
|- pubspec.yaml
|- README.md
```

### Technologies and packages

The Girhub Issues Tracker App employs various technologies and packages, including:

- [Flutter Framework with Dart](https://flutter.dev/)
- firebase_core: ^0.7.0
- firebase_auth: ^0.20.0+1
- url_launcher: ^5.7.10
- uni_links: ^0.4.0
- redux: ^4.0.0+3
- flutter_redux: ^0.7.0
- dio: ^3.0.10
- gql_dio_link: ^0.0.4
- shared_preferences: ^0.5.12+4
- time_ago_provider: ^3.2.0

### Contributing

You can contribute to this project by submitting a pull request to [Pull Request Here](https://github.com/stivo-m/github_issues_app/pulls) with a descriptive title and message.

### License

Copyright &copy; 2021, Steven Maina

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
