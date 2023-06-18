import 'handlers/schema_handler.dart';

final class SchemaHandlerPipeline {
  final List<SchemaHandler> _handlers;

  SchemaHandlerPipeline({
    required List<SchemaHandler> handers,
  }) : _handlers = handers;

  String handle(final String schema, final HandleSchemaContext context) {
    var value = schema;

    for (final handler in _handlers) {
      value = handler.handle(value, context);
    }

    return value;
  }
}
