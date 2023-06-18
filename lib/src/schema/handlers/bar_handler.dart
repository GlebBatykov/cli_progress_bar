import '../constants.dart';
import 'schema_handler.dart';

final class BarHandler implements SchemaHandler {
  @override
  String handle(final String schema, final HandleSchemaContext context) {
    final bar = _buildBar(context);

    return schema.replaceAll(barTag, bar);
  }

  String _buildBar(final HandleSchemaContext context) {
    final buffer = StringBuffer();

    final filledCount = _getFilledCount(context);

    for (var i = 0; i < filledCount - 1; i++) {
      buffer.write(context.filled);
    }

    if (filledCount > 0) {
      buffer.write(context.edge);
    }

    for (var i = filledCount; i < context.size; i++) {
      buffer.write(context.notFilled);
    }

    return buffer.toString();
  }

  int _getFilledCount(final HandleSchemaContext context) =>
      ((context.value / context.max) * context.size).toInt();
}
