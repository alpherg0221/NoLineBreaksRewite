import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:no_line_breaks/ui/components/nav_rail.dart';
import 'package:no_line_breaks/ui/components/text_field.dart';
import 'package:no_line_breaks/ui/home/home_viewmodel.dart';
import 'package:no_line_breaks/ui/settings/settings_viewmodel.dart';

class HomeScreen extends HookConsumerWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = ref.watch(homeStateProvider.notifier);
    final homeState = ref.watch(homeStateProvider);
    final settingsState = ref.watch(settingsStateProvider);

    final editController = useTextEditingController();
    final readController = useTextEditingController();

    final borderColor = Theme.of(context).colorScheme.primary;

    useEffect(() {
      editController.value = TextEditingValue(
        text: homeState.text,
        selection: editController.selection,
      );
      readController.text = homeState.fixedText;
      return null;
    });

    return Scaffold(
      body: Row(
        children: [
          const NavRail(),
          const VerticalDivider(thickness: 1, width: 1),
          Expanded(
            child: Container(
              margin: const EdgeInsets.all(48),
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                border: Border.all(color: borderColor, width: 2.0),
                borderRadius: BorderRadius.circular(4.0),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        ExpandedNoBorderTextField(
                          controller: editController,
                          onChanged: (value) {
                            viewModel.changeText(
                                value, settingsState.isBreakLine);
                          },
                          fontSize: settingsState.textSize.toDouble(),
                        ),
                        VerticalDivider(color: borderColor),
                        ExpandedNoBorderTextField(
                          controller: readController,
                          fontSize: settingsState.textSize.toDouble(),
                          readOnly: true,
                        ),
                      ],
                    ),
                  ),
                  Divider(color: borderColor),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      IconButton(
                        onPressed: viewModel.copyText,
                        iconSize: 48.0,
                        icon: const Icon(Icons.copy_rounded),
                        tooltip: 'Copy',
                      ),
                      IconButton(
                        onPressed: viewModel.openInDeepL,
                        iconSize: 48.0,
                        icon: const Icon(Icons.open_in_new_rounded),
                        tooltip: 'Open in DeepL',
                      ),
                      IconButton(
                        onPressed: viewModel.deleteAll,
                        iconSize: 48.0,
                        icon: const Icon(Icons.delete_forever_outlined),
                        tooltip: 'Delete all',
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
