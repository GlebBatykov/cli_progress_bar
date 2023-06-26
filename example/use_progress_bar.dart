import 'dart:async';

import 'package:cli_progress_bar/cli_progress_bar.dart';

void main() {
  final schema = '#before [#bar] #after';

  final max = 200;

  final bar = ProgressBar(
    schema: schema,
    before: 'Progress',
    after: '0/$max',
    settings: ProgressBarSettings(
      max: max,
      size: 20,
    ),
  );

  bar.update();

  var progress = 0;

  Timer.periodic(Duration(seconds: 1), (timer) {
    progress += 10;

    if (progress > max) {
      timer.cancel();

      return;
    }

    bar.setProgress(progress);

    bar.setAfter('$progress/$max');

    bar.update();
  });
}
