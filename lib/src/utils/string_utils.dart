import 'dart:math';

/// String-related utility class.
class StringUtils {
  /// Get name initial.
  static String? getInitials(String name) {
    return name.isNotEmpty
        ? name.trim().split(' ').map((l) => l[0].toUpperCase()).take(2).join()
        : null;
  }

  /// Get size file.
  static String getFileSize(int numberSize, bool inBinaryFileSize) {
    if (numberSize <= 0) return '0 B';
    const suffixes = ['B', 'KB', 'MB', 'GB', 'TB', 'PB', 'EB', 'ZB', 'YB'];
    var i = (log(numberSize) / log(1024)).floor();
    // ignore: lines_longer_than_80_chars
    return '${(numberSize / pow(inBinaryFileSize ? 1024 : 1000, i)).toStringAsFixed(0)} ${suffixes[i]}';
  }
}
