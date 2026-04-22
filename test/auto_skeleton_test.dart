import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:auto_skeleton_plus/auto_skeleton_plus.dart';

void main() {

  testWidgets('SkeletonIgnore works', (tester) async {

    await tester.pumpWidget(
      const MaterialApp(
        home: AutoSkeleton(
          isLoading: true,
          child: SkeletonIgnore(
            child: Text('Do not change'),
          ),
        ),
      ),
    );

    expect(find.text('Do not change'), findsOneWidget);
  });
}
