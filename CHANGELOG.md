# Changelog

## 0.0.1

### ✨ Initial Release

- Added `AutoSkeleton` widget for automatic skeleton loading
- Converts basic widgets:
  - Text → skeleton box
  - Image → skeleton placeholder
  - Column / Row → preserved layout
- Added `SkeletonIgnore` to exclude widgets from skeleton conversion
- Added basic runtime skeleton engine
- Added code generation support using `@GenerateSkeleton`
- Generates `.skeleton.dart` files using build_runner
- Included example app demonstrating usage
- Added basic widget tests
