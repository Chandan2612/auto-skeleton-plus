/// Utility class for identifying different types of Flutter widgets
/// based on their names.
///
/// This is used during AST parsing to determine how a widget should
/// be converted into its skeleton equivalent.
class WidgetAnalyzer {

  /// Checks if the widget is a layout widget.
  ///
  /// Layout widgets define structure and contain child widgets.
  /// Example: Column, Row
  static bool isLayout(String name) =>
      name == 'Column' || name == 'Row';

  /// Checks if the widget is a Text widget.
  ///
  /// Text widgets are converted into small rectangular placeholders.
  static bool isText(String name) => name == 'Text';

  /// Checks if the widget is an Image widget.
  ///
  /// Image widgets are converted into larger rectangular placeholders.
  static bool isImage(String name) => name == 'Image';
}
