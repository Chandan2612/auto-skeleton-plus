/// Auto Skeleton Plus
///
/// A Flutter package that automatically generates skeleton loading UI
/// from your existing widgets using:
/// - Runtime conversion (AutoSkeleton)
/// - Code generation (@GenerateSkeleton)
///
/// ## Features
/// - Convert UI → skeleton automatically
/// - Preserve layout structure (Column, Row)
/// - Support Text and Image placeholders
/// - Ignore specific widgets using [SkeletonIgnore]
/// - Generate skeleton widgets using annotations
///
/// ## Usage
/// ```dart
/// import 'package:auto_skeleton_plus/auto_skeleton_plus.dart';
///
/// AutoSkeleton(
///   isLoading: true,
///   child: MyScreen(),
/// )
/// ```
///
/// For advanced usage, use [GenerateSkeleton] annotation
/// and run build_runner to generate `.skeleton.dart` files.
library auto_skeleton_plus;

/// Annotation for generating skeleton widgets
export 'src/annotation.dart';

/// Main widget for runtime skeleton conversion
export 'src/runtime/auto_skeleton.dart';

/// Widget to exclude specific UI from skeleton conversion
export 'src/runtime/skeleton_ignore.dart';

/// Theme configuration for skeleton UI
export 'src/runtime/skeleton_theme.dart';
