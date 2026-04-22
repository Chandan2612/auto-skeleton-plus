import 'package:flutter/material.dart';
import 'skeleton_builder.dart';

/// A widget that automatically converts its [child] into a skeleton UI
/// when [isLoading] is set to `true`.
///
/// This is the main entry point for using the auto skeleton feature.
///
/// When loading:
/// - Replaces supported widgets (Text, Image, etc.) with placeholders
/// - Preserves layout structure (Column, Row)
///
/// When not loading:
/// - Displays the original UI as-is
///
/// ## Example
/// ```dart
/// AutoSkeleton(
///   isLoading: true,
///   child: MyScreen(),
/// )
/// ```
///
/// ## How it works
/// Internally, this widget uses [SkeletonBuilder] to recursively
/// traverse the widget tree and convert supported widgets into
/// skeleton placeholders.
///
/// ## Limitations
/// - Custom widgets may not be fully supported
/// - Complex UI may require manual adjustments
class AutoSkeleton extends StatelessWidget {

  /// Controls whether skeleton UI should be shown.
  ///
  /// - `true` → show skeleton
  /// - `false` → show actual UI
  final bool isLoading;

  /// The original widget tree that will be converted into skeleton UI.
  final Widget child;

  /// Creates an [AutoSkeleton] widget.
  const AutoSkeleton({
    super.key,
    required this.isLoading,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {

    // 🔹 If not loading, return the original widget
    if (!isLoading) return child;

    // 🔹 Convert the widget tree into skeleton UI
    return SkeletonBuilder.build(child);
  }
}
