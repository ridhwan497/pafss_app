
String formatFileSize(int bytes) {
  
  const suffixes = ["B", "KB", "MB", "GB"];

  var i = 0;
  double size = bytes.toDouble();

  while (size >= 1024 && i < suffixes.length - 1) {
    size = size / 1024;
    i++;
  }

  return '${size.toStringAsFixed(1)} ${suffixes[i]}';
}