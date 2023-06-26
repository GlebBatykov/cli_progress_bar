import 'dart:async';

import 'package:cli_progress_bar/cli_progress_bar.dart';

void main() {
  final schema = '#before | #bar | #after';

  final max = 400;

  final bar = ProgressBar(
    schema: schema,
    before: 'Custom progress bar',
    after: 'progress 0/$max',
    settings: ProgressBarSettings(
      max: max,
      size: 40,
      filled: '0',
      notFilled: '.',
      edge: '>',
    ),
  );

  bar.start();

  var progress = 0;

  Timer.periodic(Duration(seconds: 1), (timer) {
    progress += 40;

    if (progress > max) {
      timer.cancel();

      return;
    }

    bar.update(progress);

    bar.updateAfter('$progress/$max');
  });
}
