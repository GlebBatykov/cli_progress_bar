import '../constants.dart';
import 'schema_handler.dart';

final class BeforeHandler implements SchemaHandler {
  @override
  String handle(final String schema, final HandleSchemaContext context) {
    final before = context.before;

    if (before == null) {
      return schema.replaceAll(beforeTag, '');
    }

    return schema.replaceAll(beforeTag, before);
  }
}
