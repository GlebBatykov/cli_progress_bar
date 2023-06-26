<div align="center">

[![pub package](https://img.shields.io/pub/v/cli_progress_bar.svg?label=cli_progress_bar&color=blue)](https://pub.dev/packages/cli_progress_bar)

**Языки:**
  
[![English](https://img.shields.io/badge/Language-English-blue?style=?style=flat-square)](README.md)
[![Russian](https://img.shields.io/badge/Language-Russian-blue?style=?style=flat-square)](README.ru.md)

</div>

- [О пакете](#о-пакете)
- [Пример](#пример)
- [Как использовать](#как-использовать)

# О пакете

Пакет предоставляет возможность вывести в терминал progress bar, изменять его внешний вид и менять степень прогресса в нем.

# Пример

![Alt Text](https://raw.githubusercontent.com/GlebBatykov/cli_progress_bar/main/doc/gifs/1.gif)

![Alt Text](https://raw.githubusercontent.com/GlebBatykov/cli_progress_bar/main/doc/gifs/2.gif)

# Как использовать

Progress bar состоит из 3 основных частей:

- `before`. Произвольное содержимое пользователя. В схеме помечается тэгом `#before`. Если равно null, то вместо тэга `#before` не будет выводится ничего;
- `bar`. В схеме помечается тэгом `#bar`, вместо тэга будет выводится сам progress bar;
- `after`. Произвольное содержимое пользователя. В схеме помечается тэгом `#after`. Если равно null, то вместо тэга `#after` не будет выводится ничего.

При создании progress bar-а необходимо указать схему. В схеме используются тэги для того чтобы указать места в которых будет выводится содержимое.

Пример схемы: '#before #bar #after'. Вместо тэга `#before` будет выведен `before` содержимое, вместо тэга `#after` будет выведено after содержимое, вместо тэга `#bar` будет выведен сам progress bar.

Пример создания и запуска progress bar-а, увеличения его заполненности:

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

bar.update();

bar.setProgress(10);

bar.update();
```

Вы можете изменять внешний вид и настройки вашего progress bar-а при помощи `ProgressBarSettings`:

- `max`. Максимальный прогресс;
- `size`. Размер progress bar-а в символах;
- `filled`. Символ заполненной части;
- `notFilled`. Символ не заполненной части;
- `edge`. Символ крайнего символа заполненной части.
