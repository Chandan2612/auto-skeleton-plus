import 'package:flutter/widgets.dart';
/// Prevents a widget from being converted into a skeleton.
///
/// Useful when you want to keep some UI visible during loading.
class SkeletonIgnore extends StatelessWidget {
  final Widget child;

  const SkeletonIgnore({super.key, required this.child});

  @override
  Widget build(BuildContext context) => child;
}
