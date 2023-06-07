extension TextConverter on String {
  String deleteLineBreak() {
    return replaceAll(RegExp('\n+'), ' ');
  }

  String oneLineBreaks() {
    return replaceAll('. ', '.\n')
        .replaceAll('i.e.\n', 'i.e. ')
        .replaceAll('e.g.\n', 'e.g. ')
        .replaceAll('Fig.\n', 'Fig. ')
        .replaceAll('Tab.\n', 'Tab. ')
        .replaceAll('et al.\n', 'et al. ')
        .replaceAll('et.\n\nal.\n', 'et. al. ')
        .replaceAll(' vs.\n', 'vs. ')
        .replaceAll('rf.\n', 'rf. ');
  }

  String twoLineBreaks() {
    return replaceAll('. ', '.\n')
        .replaceAll('\n', '\n\n')
        .replaceAll('i.e.\n\n', 'i.e. ')
        .replaceAll('e.g.\n\n', 'e.g. ')
        .replaceAll('Fig.\n\n', 'Fig. ')
        .replaceAll('Tab.\n\n', 'Tab. ')
        .replaceAll('et al.\n\n', 'et al. ')
        .replaceAll('et.\n\nal.\n\n', 'et. al. ')
        .replaceAll(' vs.\n\n', ' vs. ')
        .replaceAll('rf.\n\n', 'rf. ');
  }
}

String urlText(String text) {
  return Uri.encodeComponent(text).replaceAll('/', '\\%2F');
}
