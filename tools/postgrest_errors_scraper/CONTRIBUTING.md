# Contributing to `package:postgrest_errors_scraper`

### Creating a Pull Request

Before creating a Pull Request please:

1. [Fork](https://docs.github.com/en/get-started/quickstart/contributing-to-projects) the [GitHub repository](https://github.com/alestiago/postgrest_errors.git) and create your branch from `main`:

```sh
# 🪵 Branch from `main`
git branch <branch-name>
git checkout <branch-name>
```

Where `<branch-name>` is an appropriate name describing your change.

2. Install dependencies:

```sh
# Manually install project dependencies (from: tools/postgrest_errors_scraper)
dart pub get
```

3. Ensure you have a meaningful [semantic][conventional_commits_link] commit message.

4. Add tests! Pull Requests without test coverage will **not** be merged. If you're unsure on how to do so watch our [Testing Fundamentals Course](https://www.youtube.com/watch?v=M_eZg-X789w&list=PLprI2satkVdFwpxo_bjFkCxXz5RluG8FY).

5. Ensure the existing test suite passes locally:

```sh
# 🧪 Run `package:postgrest_errors_scraper` unit test (from: tools/postgrest_errors_scraper)
dart test
```

6. Format your code:

```sh
# 🧼 Run Dart's formatter (from: tools/postgrest_errors_scraper)
dart format lib test
```

7. Analyze your code:

```sh
# 🔍 Run Dart's analyzer (from: tools/postgrest_errors_scraper)
dart analyze --fatal-infos --fatal-warnings .
```

Some analysis issues may be fixed automatically with:

```sh
# Automatically fix analysis issues that have associated automated fixes (from: tools/postgrest_errors_scraper)
dart fix --apply
```

💡 **Note**: Our repositories use [Very Good Analysis](https://github.com/VeryGoodOpenSource/very_good_analysis).

8. Create the Pull Request with a meaningful description, linking to the original issue where possible.

9. Verify that all [status checks](https://github.com/alestiago/postgrest_errors/actions) are passing for your Pull Request once they have been approved to run by a maintainer.

💡 **Note**: While the prerequisites above must be satisfied prior to having your pull request reviewed, the reviewer(s) may ask you to complete additional work, tests, or other changes before your pull request can be accepted.

[conventional_commits_link]: https://www.conventionalcommits.org/en/v1.0.0
