import 'package:dart_console/dart_console.dart';

final class ProgressBarPainter {
  late final Console _console = Console();

  void paint(final String value) {
    _console.cursorPosition = _barCoordinate;

    _console.eraseLine();

    _console.write(value);
  }

  Coordinate get _barCoordinate =>
      Coordinate(_console.cursorPosition?.row ?? _console.windowHeight - 1, 0);
}
