import 'dart:async';
import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screen_manager/flutter_screen_manager.dart';

const kScreenEventDisplayAdded = 'display-added';
const kScreenEventDisplayRemoved = 'display-removed';

class ScreenRetriever {
  ScreenRetriever._() {
    _channel.setMethodCallHandler(_methodCallHandler);
  }

  /// The shared instance of [ScreenRetriever].
  static final ScreenRetriever instance = ScreenRetriever._();

  final MethodChannel _channel = const MethodChannel('flutter_screen_manager');

  final ObserverList<ScreenListener> _listeners =
      ObserverList<ScreenListener>();

  @visibleForTesting
  MethodChannel get channel => _channel;

  Future<void> _methodCallHandler(MethodCall call) async {
    final List<ScreenListener> localListeners =
        List<ScreenListener>.from(_listeners);
    for (final ScreenListener listener in localListeners) {
      if (!_listeners.contains(listener)) {
        return;
      }

      if (call.method != 'onEvent') throw UnimplementedError();

      String eventName = call.arguments['eventName'];
      listener.onScreenEvent(eventName);
    }
  }

  bool get hasListeners {
    return _listeners.isNotEmpty;
  }

  void addListener(ScreenListener listener) {
    _listeners.add(listener);
  }

  void removeListener(ScreenListener listener) {
    _listeners.remove(listener);
  }

  Future<Offset> getCursorScreenPoint(BuildContext context) async {
    final FlutterView view = View.of(context);
    final Map<String, dynamic> arguments = {
      'devicePixelRatio': view.devicePixelRatio,
    };
    final Map<dynamic, dynamic> resultData =
        await _channel.invokeMethod('getCursorScreenPoint', arguments);
    return Offset(
      resultData['x'],
      resultData['y'],
    );
  }

  Future<Display> getPrimaryDisplay(BuildContext context) async {
    final FlutterView view = View.of(context);
    final Map<String, dynamic> arguments = {
      'devicePixelRatio': view.devicePixelRatio,
    };
    final Map<dynamic, dynamic> resultData =
        await _channel.invokeMethod('getPrimaryDisplay', arguments);
    return Display.fromJson(Map<String, dynamic>.from(resultData));
  }

  Future<List<Display>> getAllDisplays(BuildContext context) async {
    final FlutterView view = View.of(context);
    final Map<String, dynamic> arguments = {
      'devicePixelRatio': view.devicePixelRatio,
    };
    final Map<dynamic, dynamic> resultData =
        await _channel.invokeMethod('getAllDisplays', arguments);

    List<Display> displayList = [];

    if (resultData['displays'] != null) {
      displayList = (resultData['displays'] as List)
          .map((item) => Display.fromJson(Map<String, dynamic>.from(item)))
          .toList();
    }

    return displayList;
  }
}

final screenRetriever = ScreenRetriever.instance;
