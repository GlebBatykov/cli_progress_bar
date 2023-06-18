import '../progress_bar_settings.dart';

final class HandleSchemaContext {
  final String? before;

  final String? after;

  final int value;

  final ProgressBarSettings _settings;

  int get size => _settings.size;

  int get max => _settings.max;

  String get filled => _settings.filled;

  String get notFilled => _settings.notFilled;

  String get edge => _settings.edge;

  HandleSchemaContext({
    required this.before,
    required this.after,
    required final ProgressBarSettings settings,
    required this.value,
  }) : _settings = settings;
}
