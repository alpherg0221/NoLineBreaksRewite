extension TextConverter on String {
  String deleteLineBreak() {
    return replaceAll(RegExp('\n+'), ' ');
  }

  String oneLineBreaks() {
    return replaceAll('. ', '.\n')
        .replaceAll('i.e.\n', 'i.e. ')
        .replaceAll('e.g.\n', 'e.g. ');
  }

  String twoLineBreaks() {
    return replaceAll('. ', '.\n')
        .replaceAll('\n', '\n\n')
        .replaceAll('i.e.\n\n', 'i.e. ')
        .replaceAll('e.g.\n\n', 'e.g. ');
  }
}

String urlText(String text) {
  return Uri.encodeComponent(text);
}
