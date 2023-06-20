# flutter_screen_manager

[![pub version][pub-image]][pub-url] [![][codecov-image]][codecov-url] [![][discord-image]][discord-url] ![][visits-count-image]

[pub-image]: https://img.shields.io/pub/v/flutter_screen_manager.svg
[pub-url]: https://pub.dev/packages/flutter_screen_manager
[codecov-image]: https://codecov.io/gh/leanflutter/flutter_screen_manager/branch/main/graph/badge.svg?token=9UET13JP0B
[codecov-url]: https://codecov.io/gh/leanflutter/flutter_screen_manager
[discord-image]: https://img.shields.io/discord/884679008049037342.svg
[discord-url]: https://discord.gg/zPa6EZ2jqb
[visits-count-image]: https://img.shields.io/badge/dynamic/json?label=Visits%20Count&query=value&url=https://api.countapi.xyz/hit/leanflutter.flutter_screen_manager/visits

This plugin allows Flutter desktop apps to Retrieve information about screen size, displays, cursor position, etc.

---

English | [简体中文](./README-ZH.md)

---

<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->

- [flutter_screen_manager](#flutter_screen_manager)
  - [Platform Support](#platform-support)
  - [Quick Start](#quick-start)
    - [Installation](#installation)
    - [Usage](#usage)
  - [Who's using it?](#whos-using-it)
  - [API](#api)
    - [ScreenRetriever](#screenretriever)
  - [License](#license)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

## Platform Support

| Linux | macOS | Windows |
| :---: | :---: | :-----: |
|  ✔️   |  ✔️   |   ✔️    |

## Quick Start

### Installation

Add this to your package's pubspec.yaml file:

```yaml
dependencies:
  flutter_screen_manager: ^0.1.6
```

Or

```yaml
dependencies:
  flutter_screen_manager:
    git:
      url: https://github.com/leanflutter/flutter_screen_manager.git
      ref: main
```

### Usage

```dart
Display? _primaryDisplay;
List<Display> _displayList = [];

void _init() async {
  _primaryDisplay = await screenRetriever.getPrimaryDisplay();
  _displayList = await screenRetriever.getAllDisplays();
  setState(() {});
}
```

> Please see the example app of this plugin for a full example.

## Who's using it?

- [Biyi (比译)](https://biyidev.com/) - A convenient translation and dictionary app.

## API

### ScreenRetriever

| Method                 | Description                                                                  | Linux | macOS | Windows |
| ---------------------- | ---------------------------------------------------------------------------- | ----- | ----- | ------- |
| `getCursorScreenPoint` | Returns `Offset` - The current absolute position of the mouse pointer.       | ✔️    | ✔️    | ✔️      |
| `getPrimaryDisplay`    | Returns `Display` - The primary display.                                     | ✔️    | ✔️    | ✔️      |
| `getAllDisplays`       | Returns `List<Display>` - An array of displays that are currently available. | ✔️    | ✔️    | ✔️      |

## License

[MIT](./LICENSE)
