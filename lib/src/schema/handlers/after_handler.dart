import '../constants.dart';
import 'schema_handler.dart';

final class AfterHandler implements SchemaHandler {
  @override
  String handle(final String schema, final HandleSchemaContext context) {
    final after = context.after;

    if (after == null) {
      return schema.replaceAll(afterTag, '');
    }

    return schema.replaceAll(afterTag, after);
  }
}
