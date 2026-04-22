import 'package:analyzer/dart/ast/ast.dart';
import 'package:analyzer/dart/ast/visitor.dart';

/// Parses the `build` method of a Flutter widget and converts it
/// into a simplified skeleton representation.
///
/// This class uses AST (Abstract Syntax Tree) traversal to detect
/// widget types like Text, Image, etc., and map them into skeleton UI.
///
/// Used internally by the code generator.
class ASTParser {
  /// Parses a [MethodDeclaration] (usually the `build` method)
  /// and returns a string representing the skeleton UI.
  ///
  /// It uses [_WidgetVisitor] to traverse the widget tree.
  static String parse(MethodDeclaration method) {
    final visitor = _WidgetVisitor();

    // Traverse all child nodes inside the method body
    method.body.visitChildren(visitor);

    // Build final skeleton UI string
    return visitor.buildResult();
  }
}

/// AST visitor that walks through widget creation expressions
/// and collects skeleton representations.
class _WidgetVisitor extends RecursiveAstVisitor<void> {
  /// Stores generated skeleton widgets as strings
  final List<String> widgets = [];

  /// Called whenever a widget (constructor call) is found
  @override
  void visitInstanceCreationExpression(InstanceCreationExpression node) {
    final type = node.constructorName.type;

    String widgetName = '';

    // 🔹 Safely extract widget name (important for analyzer compatibility)
    widgetName = type.name2.lexeme;

    // 🔹 Convert widget into skeleton equivalent
    widgets.add(_mapWidget(widgetName));

    // Continue traversing child nodes
    super.visitInstanceCreationExpression(node);
  }

  /// Maps a widget name to its skeleton representation
  ///
  /// Example:
  /// - Text → small rectangle
  /// - Image → larger rectangle
  /// - Others → generic placeholder
  String _mapWidget(String name) {
    switch (name) {
      case 'Text':
        return 'Container(height: 12, width: 120, color: Color(0xFFE0E0E0))';

      case 'Image':
        return 'Container(height: 100, width: double.infinity, color: Color(0xFFE0E0E0))';

      default:
        return 'Container(height: 50, width: double.infinity, color: Color(0xFFE0E0E0))';
    }
  }

  /// Builds the final skeleton UI as a Column widget string
  ///
  /// All detected widgets are combined into a single Column.
  String buildResult() {
    return '''
Column(
  children: [
    ${widgets.join(',')}
  ],
)
''';
  }
}
