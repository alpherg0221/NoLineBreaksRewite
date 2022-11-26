import 'dart:html' as html;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:no_line_breaks/utils/text_formatter.dart';

final homeStateProvider =
    StateNotifierProvider<HomeViewModel, HomeState>((ref) => HomeViewModel());

@immutable
class HomeState {
  const HomeState({required this.text, required this.fixedText});

  final String text;
  final String fixedText;

  HomeState copy({String? text, String? fixedText}) {
    return HomeState(
      text: text ?? this.text,
      fixedText: fixedText ?? this.fixedText,
    );
  }
}

class HomeViewModel extends StateNotifier<HomeState> {
  HomeViewModel() : super(const HomeState(text: '', fixedText: ''));

  Future<void> copyText() async {
    Clipboard.setData(ClipboardData(text: state.fixedText));
    Get.snackbar(
      'NoLineBreaks',
      'Copied text',
      snackStyle: SnackStyle.FLOATING,
      icon: const Icon(Icons.copy_rounded),
      shouldIconPulse: true,
    );
  }

  Future<void> openInDeepL() async {
    html.window.open(
      'https://www.deepl.com/ja/translator#en/ja/${urlText(state.fixedText)}',
      '',
    );
  }

  void deleteAll() {
    state = state.copy(text: '', fixedText: '');
  }

  void changeText(String newText, bool isBreakLine) {
    var converted = newText.deleteLineBreak();
    if (isBreakLine) {
      converted = converted.twoLineBreaks();
    }
    state = state.copy(text: newText, fixedText: converted);
  }
}
