import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ExpandedNoBorderTextField extends HookConsumerWidget {
  const ExpandedNoBorderTextField({
    Key? key,
    this.controller,
    this.onChanged,
    this.fontSize,
    this.readOnly = false,
  }) : super(key: key);

  final TextEditingController? controller;
  final void Function(String)? onChanged;
  final double? fontSize;
  final bool readOnly;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Expanded(
      child: TextField(
        controller: controller,
        onChanged: onChanged,
        maxLines: null,
        maxLength: 5000,
        decoration: const InputDecoration(border: InputBorder.none),
        style: TextStyle(fontSize: fontSize),
        readOnly: readOnly,
      ),
    );
  }
}
