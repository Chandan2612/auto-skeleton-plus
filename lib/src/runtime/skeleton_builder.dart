import 'package:flutter/material.dart';
import 'skeleton_ignore.dart';

/// A utility class responsible for converting normal widgets
/// into skeleton (placeholder) widgets.
///
/// This class is used internally by [AutoSkeleton] to recursively
/// traverse the widget tree and replace supported widgets with
/// their skeleton equivalents.
class SkeletonBuilder {
  /// Builds a skeleton version of the given [widget].
  ///
  /// If the widget type is supported (e.g., Text, Image, Column, Row),
  /// it will be converted into a placeholder UI.
  ///
  /// Unsupported widgets fall back to a generic skeleton container.
  static Widget build(Widget widget) {
    // 🔹 If widget is marked with SkeletonIgnore,
    // return the original widget without converting it.
    if (widget is SkeletonIgnore) {
      return widget.child;
    }

    // 🔹 Convert Text widget into a small grey rectangle
    // representing a text line.
    if (widget is Text) {
      return Container(
        height: 12, // approximate text height
        width: 100, // fixed width for placeholder
        color: Colors.grey.shade300,
      );
    }

    // 🔹 Handle Column by recursively converting all children
    // into their skeleton versions while preserving layout.
    if (widget is Column) {
      return Column(
        children: widget.children.map(build).toList(),
      );
    }

    // 🔹 Handle Row similarly by converting each child widget.
    if (widget is Row) {
      return Row(
        children: widget.children.map(build).toList(),
      );
    }

    // 🔹 Convert Image widget into a rectangular placeholder
    // using provided height/width or fallback values.
    if (widget is Image) {
      return Container(
        height: widget.height ?? 100,
        width: widget.width ?? double.infinity,
        color: Colors.grey.shade300,
      );
    }

    // 🔹 Default fallback:
    // For unsupported widgets, return a generic skeleton box.
    return Container(
      height: 50,
      width: double.infinity,
      color: Colors.grey.shade300,
    );
  }
}
