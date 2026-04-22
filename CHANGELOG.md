# Changelog

All notable changes to this project will be documented in this file.

---

## 0.0.2

### 🚀 Improvements
- Improved skeleton rendering for better UI consistency
- Enhanced layout handling for Column and Row
- Minor performance optimizations in runtime builder

### 🐛 Fixes
- Fixed issue with `SkeletonIgnore` not working in nested widgets
- Fixed edge cases in widget parsing

### 🧠 Internal
- Refactored AST parsing logic for better maintainability
- Code cleanup and improved documentation

---

## 0.0.1

### ✨ Initial Release

#### 🚀 Features
- Introduced `AutoSkeleton` widget for automatic skeleton loading
- Automatically converts basic widgets:
  - `Text` → skeleton placeholder
  - `Image` → skeleton container
  - `Column` / `Row` → layout preserved
- Added `SkeletonIgnore` to exclude widgets from skeleton conversion
- Implemented runtime skeleton rendering engine

#### ⚙️ Code Generation
- Added support for `@GenerateSkeleton` annotation
- Generates `.skeleton.dart` files using `build_runner` and `source_gen`
- Parses widget tree using AST for skeleton generation

#### 📦 Package Setup
- Included example app demonstrating usage
- Added basic widget tests
- Added documentation and README
