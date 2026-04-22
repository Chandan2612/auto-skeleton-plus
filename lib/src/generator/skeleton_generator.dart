import 'package:build/build.dart';
import 'package:source_gen/source_gen.dart';
import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/ast/ast.dart';

import '../annotation.dart';
import 'ast_parser.dart';

/// A code generator that creates skeleton versions of Flutter widgets
/// annotated with [GenerateSkeleton].
///
/// This generator scans the annotated class, extracts its `build` method,
/// parses the widget tree using [ASTParser], and generates a corresponding
/// skeleton widget.
///
/// ## Example
/// ```dart
/// @GenerateSkeleton()
/// class MyScreen extends StatelessWidget {
///   @override
///   Widget build(BuildContext context) {
///     return Text("Hello");
///   }
/// }
/// ```
///
/// Running:
/// ```bash
/// flutter pub run build_runner build
/// ```
///
/// Will generate:
/// ```dart
/// class MyScreenSkeleton extends StatelessWidget { ... }
/// ```
class SkeletonGenerator extends GeneratorForAnnotation<GenerateSkeleton> {

  /// Generates skeleton code for the annotated element.
  ///
  /// This method:
  /// 1. Validates the element is a class
  /// 2. Resolves its AST node
  /// 3. Finds the `build` method
  /// 4. Parses widget tree into skeleton UI
  /// 5. Returns generated Dart code
  @override
  Future<String> generateForAnnotatedElement(
    Element element,
    ConstantReader annotation,
    BuildStep buildStep,
  ) async {

    // 🔹 Ensure the annotated element is a class
    if (element is! ClassElement) return '';

    final className = element.name;

    // 🔹 Get AST node of the class
    final node = await buildStep.resolver.astNodeFor(element);

    // 🔹 Ensure it's a valid class declaration
    if (node is! ClassDeclaration) return '';

    MethodDeclaration? buildMethod;

    // 🔹 Find the build() method inside the class
    for (final member in node.members) {
      if (member is MethodDeclaration &&
          member.name.lexeme == 'build') {
        buildMethod = member;
        break;
      }
    }

    // 🔹 If no build method found, return empty
    if (buildMethod == null) return '';

    // 🔹 Parse widget tree into skeleton structure
    final parsedUI = ASTParser.parse(buildMethod);

    // 🔹 Generate skeleton widget code
    return '''
import 'package:flutter/material.dart';

/// Auto-generated skeleton widget for [$className].
class ${className}Skeleton extends StatelessWidget {
  const ${className}Skeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return $parsedUI;
  }
}
''';
  }
}

/// Builder factory used by build_runner to register this generator.
///
/// This connects the [SkeletonGenerator] with the build system and
/// defines the output file extension (`.skeleton.dart`).
Builder skeletonBuilder(BuilderOptions options) =>
    LibraryBuilder(
      SkeletonGenerator(),
      generatedExtension: '.skeleton.dart',
    );
