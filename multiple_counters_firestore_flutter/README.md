# Multiple Counters Flutter App with Cloud Firestore

This sample app shows how to implement multiple counters, which are stored with Cloud Firestore.

# Running the project with Firebase

To use this project with Firebase authentication, some configuration steps are required.

- Create a new project with the Firebase console.
- Add Android apps in the Firebase project settings.
- On Android, use `br.com.capsistema.multiple_counters_firestore_flutter` as the package name (a SHA-1 certificate fingerprint is also needed for Google sign-in).
- then, [download and copy](https://firebase.google.com/docs/flutter/setup#configure_an_android_app) `google-services.json` into `android/app`.

See this document for full instructions:

- [https://firebase.google.com/docs/flutter/setup](https://firebase.google.com/docs/flutter/setup) 
