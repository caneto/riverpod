# Flutter Movies app with Riverpod (TMDB API)

This is an improved version of my [old movies app](https://github.com/caneto/AppFilmesGetx) based on the Getx.

## Motivation

I built this app to showcase the **latest APIs** for popular packages such as Riverpod and GoRouter.

This is not meant to be a complete movies app, yet it should implement common use cases and features. 👇

## Current Features

- Infinite scrolling with pagination
- Pull to refresh
- Search functionality
- Loading UI with the [Shimmer](https://pub.dev/packages/shimmer) package
- Stateful nested routing with [`StatefulShellRoute`](https://pub.dev/documentation/go_router/latest/go_router/StatefulShellRoute-class.html)

## Planned Features (no promises 😅)

- Favourites
- Responsive UI

## Packages in use

- [flutter_riverpod](https://pub.dev/packages/riverpod) and [riverpod_generator](https://pub.dev/packages/riverpod_generator) for data caching (and much more!)
- [freezed](https://pub.dev/packages/freezed) for JSON serialization
- [dio](https://pub.dev/packages/dio) for networking
- [go_router](https://pub.dev/packages/go_router) for navigation
- [shimmer](https://pub.dev/packages/shimmer) for the loading UI
- [envied](https://pub.dev/packages/envied) for handling API keys
- [cached_network_image](https://pub.dev/packages/cached_network_image) for caching images

## App Architecture & Folder structure

The project follows my Riverpod app architecture with a feature-first project structure.

It also uses the new [Riverpod Generator](https://pub.dev/packages/riverpod_generator) package, which I have covered here:

## Getting a TMDB API key

This project uses the TMDB API to get the latest movies data.

Before running the app you need to [sign up on the TMDB website](https://www.themoviedb.org/signup), then obtain an API key on the [settings API page](https://www.themoviedb.org/settings/api).

Once you have this, create an `.env` file **at the root of the project** and add your key:

```dart
// .env
TMDB_KEY=your-api-key
```

Then, run the code generator:

```
flutter pub run build_runner build --delete-conflicting-outputs
```

This will generate a `env.g.dart` file inside `lib/env`. This contains the `tmdbApiKey` that is used when making requests to the TMDB API.

Congratulations, you're good to go. 😎

## Note: Loading images from insecure HTTP endpoints

The data returned by the TMBD API points to image URLs using http rather than https. In order for images to load correctly, the following changes have been made:

### Android

Created a file at `android/app/src/main/res/xml/network_security_config.xml` with these contents:

```
<?xml version="1.0" encoding="utf-8"?>
<network-security-config>
    <base-config cleartextTrafficPermitted="true" />
</network-security-config>
```

Added this to the application tag in the `AndroidManifest.xml`:

```
android:networkSecurityConfig="@xml/network_security_config"




## [LICENSE: MIT](LICENSE.md)