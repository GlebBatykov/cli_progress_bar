import 'progress_bar_painter.dart';
import 'progress_bar_settings.dart';
import 'schema/handlers.dart';
import 'schema/schema_handler_pipeline.dart';

final class ProgressBar {
  final String _schema;

  final ProgressBarSettings _settings;

  late final ProgressBarPainter _painter = ProgressBarPainter();

  late final SchemaHandlerPipeline _pipeline = SchemaHandlerPipeline(
    handers: [
      AfterHandler(),
      BeforeHandler(),
      BarHandler(),
    ],
  );

  int _value = 0;

  String? _before;

  String? _after;

  int get value => _value;

  int get _max => _settings.max;

  ProgressBar({
    required String schema,
    final ProgressBarSettings? settings,
    final String? before,
    final String? after,
  })  : _schema = schema,
        _settings = settings ?? ProgressBarSettings(),
        _before = before,
        _after = after;

  void _print() {
    final value = _pipeline.handle(_schema, _context);

    _painter.paint(value);
  }

  HandleSchemaContext get _context => HandleSchemaContext(
        after: _after,
        before: _before,
        settings: _settings,
        value: _value,
      );

  void setProgress(final int progress) {
    if (_value >= _max && progress >= _max) {
      return;
    }

    _value = progress > _max ? _max : progress;
  }

  void increment() {
    setProgress(_value + 1);
  }

  void decrement() {
    setProgress(_value - 1);
  }

  void setBefore(final String? value) {
    _before = value;
  }

  void setAfter(final String? value) {
    _after = value;
  }

  void update() {
    _print();
  }
}
