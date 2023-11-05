[<img src="https://raw.githubusercontent.com/alestiago/postgrest_errors/b4d4f6422e3d5f61bba5582b3d6b7ffbfb1fcb9f/packages/postgrest_errors/assets/logo.png" width="65px" align="left"/>](https://github.com/alestiago/postgrest_errors)

# PostgREST errors' scraper

![coverage](https://img.shields.io/badge/coverage-100-gree)
[![License: MIT](https://img.shields.io/badge/license-MIT-blue.svg)](https://opensource.org/licenses/MIT)
[![style: very good analysis](https://img.shields.io/badge/style-very_good_analysis-B22C89.svg)](https://pub.dev/packages/very_good_analysis)

Scrapes PostgREST errors from the Postgrest documentation website.

## Usage 🧑‍💻

1. Install a valid [Dart SDK](https://dart.dev/get-dart) in your local environment. Compatible Dart SDK versions with `package:postgrest_errors_scraper` can be found within the [pubspec](pubspec.yaml). If you have Flutter installed, you likely have a valid Dart SDK version already installed.

2. Update the `data/errors.json`:

```sh
# Update the `data/errors.json` file (from tools/postgrest_errors_scraper):
dart lib/main.dart
```
