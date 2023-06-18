import 'package:dart_console/dart_console.dart';

final class ProgressBarPainter {
  late final Console _console = Console();

  void paint(final String value) {
    _console.cursorPosition = _bottomCoordinate;

    _console.eraseLine();

    _console.write(value);
  }

  Coordinate get _bottomCoordinate => Coordinate(_console.windowHeight - 1, 0);
}
