import 'package:flutter/material.dart';

/// Configuration class for customizing the appearance of skeleton UI.
///
/// This class allows you to define styling properties such as color
/// for skeleton placeholders.
///
/// It can be extended in future to support:
/// - Shimmer effects
/// - Border radius
/// - Gradient colors
/// - Animation settings
class SkeletonThemeData {

  /// The base color used for skeleton placeholders.
  ///
  /// Default is a light grey color (`#E0E0E0`).
  final Color color;

  /// Creates a [SkeletonThemeData] instance.
  ///
  /// You can customize the skeleton appearance by providing a custom [color].
  const SkeletonThemeData({
    this.color = const Color(0xFFE0E0E0),
  });
}
