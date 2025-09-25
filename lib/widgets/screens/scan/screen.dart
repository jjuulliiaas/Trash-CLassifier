import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:trash_classifier/generated/l10n.dart';
import 'body.dart';
import 'components/icon_button.dart';

class ScanScreen extends StatelessWidget{
  const ScanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final $ = S.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text($.scanTrash),
        centerTitle: true,
        actionsPadding: const EdgeInsets.all(8.0),
        leading: CIconButton(
          onIconTap: () => Navigator.pop(context),
          icon: const Icon(
              FluentIcons.chevron_left_20_filled,
          ),
        ),
        actions: <Widget>[
          CIconButton(
            onIconTap: () {  },
            icon: const Icon(
              FluentIcons.checkmark_32_filled,
            ),
          ),
        ],
      ),
      body: const ScanBody(),
      // bottomNavigationBar: CBottomBar(currentIndex: 1,),
    );
  }
}