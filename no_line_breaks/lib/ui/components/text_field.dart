import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ExpandedNoBorderTextField extends HookConsumerWidget {
  const ExpandedNoBorderTextField({
    Key? key,
    this.controller,
    this.onChanged,
    this.onClear,
    this.fontSize,
    this.readOnly = false,
  }) : super(key: key);

  final TextEditingController? controller;
  final void Function(String)? onChanged;
  final void Function()? onClear;
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
        decoration: InputDecoration(
          border: InputBorder.none,
          suffix: onClear != null
              ? IconButton(
                  onPressed: onClear,
                  icon: const Icon(Icons.clear_rounded),
                )
              : null,
        ),
        style: TextStyle(fontSize: fontSize),
        readOnly: readOnly,
      ),
    );
  }
}
