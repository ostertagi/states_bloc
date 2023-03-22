//voir usage en bas
class Logger {
  static const line = '◢ ◤◢ ◤◢ ◤◢ ◤◢ ◤◢ ◤◢ ◤◢ ◤◢ ◤◢ ◤◢ ◤◢ ◤◢ ◤◢ ◤◢ ◤◢ ◤◢ ◤';

  static void log(LogMessage msg) {
    String color = '';
    if (msg.level == LogLevel.fine) {
      color = '\x1b[93m';
    } else if (msg.level == LogLevel.info || msg.level == LogLevel.debug) {
      color = '\x1b[92m';
    } else if (msg.level == LogLevel.warning) {
      color = '\x1b[31m';
    } else if (msg.level == LogLevel.error) {
      color = '\x1b[97;41m';
    }

    print(
        '$color${msg.loggerName}: [${msg.level}] - ${msg.timestamp} => ${msg.message}');
  }

  static void fine({String? tag, String? message}) {
    print(line);
    log(LogMessage(tag, LogLevel.fine, "🎾 ${message}", DateTime.now()));
  }

  static void debug({String? tag, String? message}) {
    print(line);
    log(LogMessage(tag, LogLevel.debug, "👀 ${message}", DateTime.now()));
  }

  static void info({String? tag, String? message}) {
    print(line);
    log(LogMessage(tag, LogLevel.info, "👻 ${message}", DateTime.now()));
  }

  static void warning({String? tag, String? message}) {
    print(line);
    log(LogMessage(tag, LogLevel.warning, "⚠️ ${message}", DateTime.now()));
  }

  static void error({String? tag, String? message}) {
    print(line);
    log(LogMessage(tag, LogLevel.error, "😡 ${message}", DateTime.now()));
  }

  static void printWrapped(String text) {
    final pattern = RegExp('.{1,800}'); // 800 is the size of each chunk
    pattern.allMatches(text).forEach((match) {
      print(match.group(0));
      // debug(match.group(0));
    });
  }
}

//===== Log_level

class LogLevel implements Comparable<LogLevel> {
  static const fine = LogLevel(0, 'FINE');
  static const debug = LogLevel(1, 'DEBUG');
  static const info = LogLevel(2, 'INFO');
  static const warning = LogLevel(3, 'WARNING');
  static const error = LogLevel(4, 'ERROR');

  final int value;
  final String name;

  const LogLevel(this.value, this.name);

  @override
  bool operator ==(Object other) => other is LogLevel && value == other.value;

  @override
  int compareTo(LogLevel other) => value - other.value;

  @override
  String toString() => name;
}

//=========  Log_message

class LogMessage {
  final String? loggerName;
  final LogLevel level;
  final String message;
  final DateTime timestamp;

  const LogMessage(
    this.loggerName,
    this.level,
    this.message,
    this.timestamp,
  );
}

//=====================

class ExampleView {
  final String _tag = "ExampleView";

  void _init() {
    Logger.info(tag: _tag, message: "This an info message");
    Logger.debug(tag: _tag, message: "This a debug message");
    Logger.error(tag: _tag, message: "This aen error message");
  }
}
/*
import 'dart:convert';

import 'package:logger/src/ansi_color.dart';
import 'package:logger/src/log_printer.dart';
import 'package:logger/src/logger.dart';

//final line = '◢ ◤◢ ◤◢ ◤◢ ◤◢ ◤◢ ◤◢ ◤◢ ◤◢ ◤◢ ◤◢ ◤◢ ◤◢ ◤◢ ◤◢ ◤◢ ◤◢ ◤';
/// Default implementation of [LogPrinter].
///
/// Output looks like this:
/// ```
/// ┌──────────────────────────
/// │ Error info
/// ├┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄
/// │ Method stack history
/// ├┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄
/// │ Log message
/// └──────────────────────────
/// ```
class SimpleLogPrinter extends LogPrinter {
  static const topLeftCorner = '┌';
  static const bottomLeftCorner = '└';
  static const middleCorner = '├';
  static const verticalLine = '│';
  static const doubleDivider = "─";
  static const singleDivider = "┄";

  static final levelColors = {
    Level.verbose: AnsiColor.fg(AnsiColor.grey(0.5)),
    Level.debug: AnsiColor.fg(12),
    Level.info: AnsiColor.fg(22),
    Level.warning: AnsiColor.fg(208),
    Level.error: AnsiColor.fg(196),
    Level.wtf: AnsiColor.fg(199),
  };

  static final levelEmojis = {
    Level.verbose: '',
    Level.debug: '🐛 ',
    Level.info: '💡 ',
    Level.warning: '⚠️ ',
    Level.error: '⛔ ',
    Level.wtf: '👾 ',
  };

  static final stackTraceRegex = RegExp(r'#[0-9]+[\s]+(.+) \(([^\s]+)\)');

  static DateTime? _startTime;

  final int methodCount;
  final int errorMethodCount;
  final int lineLength;
  final bool colors;
  final bool printEmojis;
  final bool printTime;

  String _topBorder = '';
  String _middleBorder = '';
  String _bottomBorder = '';

  SimpleLogPrinter({
    this.methodCount = 1,
    this.errorMethodCount = 8,
    this.lineLength = 120,
    this.colors = true,
    this.printEmojis = true,
    this.printTime = false,
  }) {
    _startTime ??= DateTime.now();

    var doubleDividerLine = StringBuffer();
    var singleDividerLine = StringBuffer();
    for (int i = 0; i < lineLength - 1; i++) {
      doubleDividerLine.write(doubleDivider);
      singleDividerLine.write(singleDivider);
    }

    _topBorder = "$topLeftCorner$doubleDividerLine";
    _middleBorder = "$middleCorner$singleDividerLine";
    _bottomBorder = "$bottomLeftCorner$doubleDividerLine";
  }

  @override
  List<String> log(LogEvent event) {
    var messageStr = stringifyMessage(event.message);

    String stackTraceStr;
    if (event.stackTrace == null) {
      if (methodCount > 0) {
        stackTraceStr = formatStackTrace(StackTrace.current, methodCount);
      }
    } else if (errorMethodCount > 0) {
      stackTraceStr = formatStackTrace(event.stackTrace!, errorMethodCount);
    }

    var errorStr = event.error?.toString();

    String? timeStr;
    if (printTime) {
      timeStr = getTime();
    }

    return _formatAndPrint(
      event.level,
      messageStr,
      timeStr!,
      errorStr!,
      stackTraceStr!,
    );
  }

  String formatStackTrace(StackTrace stackTrace, int methodCount) {
    var lines = stackTrace.toString().split("\n");

    var formatted = <String>[];
    var count = 0;
    for (var line in lines) {
      var match = stackTraceRegex.matchAsPrefix(line);
      if (match != null) {
        if (match.group(2).startsWith('package:logger')) {
          continue;
        }
        if (match.group(2).contains('simple_log_printer')) {
          continue;
        }
        var newLine = "#$count   ${match.group(1)} (${match.group(2)})";
        formatted.add(newLine.replaceAll('<anonymous closure>', '()'));
        if (++count == methodCount) {
          break;
        }
      } else {
        formatted.add(line);
      }
    }

    if (formatted.isEmpty) {
      return null;
    } else {
      return formatted.join('\n');
    }
  }

  String getTime() {
    String _threeDigits(int n) {
      if (n >= 100) return "$n";
      if (n >= 10) return "0$n";
      return "00$n";
    }

    String _twoDigits(int n) {
      if (n >= 10) return "$n";
      return "0$n";
    }

    var now = DateTime.now();
    String h = _twoDigits(now.hour);
    String min = _twoDigits(now.minute);
    String sec = _twoDigits(now.second);
    String ms = _threeDigits(now.millisecond);
    var timeSinceStart = now.difference(_startTime).toString();
    return "$h:$min:$sec.$ms (+$timeSinceStart)";
  }

  String stringifyMessage(dynamic message) {
    if (message is Map || message is Iterable) {
      var encoder = JsonEncoder.withIndent('  ');
      return encoder.convert(message);
    } else {
      return message.toString();
    }
  }

  AnsiColor _getLevelColor(Level level) {
    if (colors) {
      return levelColors[level];
    } else {
      return AnsiColor.none();
    }
  }

  AnsiColor _getErrorColor(Level level) {
    if (colors) {
      if (level == Level.wtf) {
        return levelColors[Level.wtf].toBg();
      } else {
        return levelColors[Level.error].toBg();
      }
    } else {
      return AnsiColor.none();
    }
  }

  String _getEmoji(Level level) {
    if (printEmojis) {
      return levelEmojis[level];
    } else {
      return "";
    }
  }

  List<String> _formatAndPrint(
    Level level,
    String message,
    String time,
    String error,
    String stacktrace,
  ) {
    List<String> buffer = [];
    var color = _getLevelColor(level);
    buffer.add(color(_topBorder));

    if (error != null) {
      var errorColor = _getErrorColor(level);
      for (var line in error.split('\n')) {
        buffer.add(
          color('$verticalLine ') +
              errorColor.resetForeground +
              errorColor(line) +
              errorColor.resetBackground,
        );
      }
      buffer.add(color(_middleBorder));
    }

    if (stacktrace != null) {
      for (var line in stacktrace.split('\n')) {
        buffer.add('$color$verticalLine $line');
      }
      buffer.add(color(_middleBorder));
    }

    if (time != null) {
      buffer
        ..add(color('$verticalLine $time'))
        ..add(color(_middleBorder));
    }

    var emoji = _getEmoji(level);
    for (var line in message.split('\n')) {
      buffer.add(color('$verticalLine $emoji$line'));
    }
    buffer.add(color(_bottomBorder));

    return buffer;
  }
}

Logger getLogger([String className = '']) {
  return Logger(
    printer: SimpleLogPrinter(),
  );
}



*/