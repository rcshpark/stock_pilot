# StockPilot

StockPilot is a Flutter-based investment companion for quickly understanding a company through core metrics, valuation signals, market activity, and AI-assisted summaries.

## Overview

- Search companies and review analysis in a structured flow.
- Summarize financial indicators, valuation context, and recent issues in one place.
- Support faster investment research without making direct investment recommendations.

## Tech Stack

- Flutter
- Dart
- go_router
- flutter_svg
- Material 3 UI

## Architecture

- `lib/presentation/`: screens, widgets, routing
- `lib/core/`: shared constants and app-level foundations
- `lib/l10n/`: localization resources
- Platform runners: Android, iOS, macOS, Linux, Windows, Web

## Development

```bash
flutter pub get
flutter analyze
flutter test
flutter run
```

## Local Notes

Detailed product notes and working documentation are kept in `README.local.md`, which is intended for local-only use and is excluded from Git.
