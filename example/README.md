<div align="center">

[![pub package](https://img.shields.io/pub/v/cli_progress_bar.svg?label=cli_progress_bar&color=blue)](https://pub.dev/packages/cli_progress_bar)

**Languages:**
  
[![English](https://img.shields.io/badge/Language-English-blue?style=?style=flat-square)](README.md)
[![Russian](https://img.shields.io/badge/Language-Russian-blue?style=?style=flat-square)](README.ru.md)

</div>

Example of creating progress bar:

```dart
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
```

Example of creating custom progress bar:

```dart
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

  bar.update();

  var progress = 0;

  Timer.periodic(Duration(seconds: 1), (timer) {
    progress += 40;

    if (progress > max) {
      timer.cancel();

      return;
    }

    bar.setProgress(progress);

    bar.setAfter('$progress/$max');

    bar.update();
  });
}
```
