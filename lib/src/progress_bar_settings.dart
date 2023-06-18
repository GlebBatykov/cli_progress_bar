final class ProgressBarSettings {
  final int size;

  final int max;

  final String filled;

  final String notFilled;

  final String edge;

  ProgressBarSettings({
    this.size = 10,
    this.max = 100,
    this.filled = '=',
    this.notFilled = '|',
    this.edge = '>',
  });
}
