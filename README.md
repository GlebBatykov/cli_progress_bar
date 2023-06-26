<div align="center">

[![pub package](https://img.shields.io/pub/v/cli_progress_bar.svg?label=cli_progress_bar&color=blue)](https://pub.dev/packages/cli_progress_bar)

**Languages:**
  
[![English](https://img.shields.io/badge/Language-English-blue?style=?style=flat-square)](README.md)
[![Russian](https://img.shields.io/badge/Language-Russian-blue?style=?style=flat-square)](README.ru.md)

</div>

- [About package](#about-package)
- [Example](#example)
- [How to use](#how-to-use)

# About package

The package provides the ability to output the progress bar to the terminal, change its appearance and change the degree of progress in it.

# Example

![Alt Text](https://raw.githubusercontent.com/GlebBatykov/cli_progress_bar/main/doc/gifs/1.gif)

![Alt Text](https://raw.githubusercontent.com/GlebBatykov/cli_progress_bar/main/doc/gifs/2.gif)

# How to use

The progress bar consists of 3 main parts:

- `before`. Arbitrary user content. In the scheme, it is marked with the `#before` tag. If it is null, then nothing will be output instead of the `#before` tag;
- `bar`. In the scheme, it is marked with the `#bar` tag, instead of the tag, the progress bar itself will be output;
- `after`. Arbitrary user content. In the scheme, it is marked with the `#after` tag. If null, then nothing will be output instead of the `#after` tag.

When creating progress bar, you must specify the scheme. The scheme uses tags to indicate the places where the content will be displayed.

Example of the scheme: '#before #bar #after'. Instead of the `#before` tag, the before content will be output, instead of the `#after` tag, the after content will be output, instead of the `#bar` tag, the progress bar itself will be output.

Example of creating and launching progress bar, increasing its fullness:

```dart
final schema = '#before [#bar] #after';

final max = 100;

final bar = ProgressBar(
    schema: schema,
    before: 'Progress',
    after: '0/$max',
    settings: ProgressBarSettings(
        max: max,
        size: 100 * 0.1,
    ),
);

bar.start();

bar.update(10);
```

You can change the appearance and settings of your progress bar using `ProgressBarSettings`:

- `max`. Maximum progress;
- `size`. The size of the progress bar in characters;
- `filled`. The symbol of the filled part;
- `notFilled`. Blank part symbol;
- `edge`. The symbol of the extreme character of the filled part.
