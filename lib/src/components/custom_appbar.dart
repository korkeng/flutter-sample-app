import 'package:flutter/material.dart';
import 'package:sample_app/src/pages/setting_page.dart';

class CustomAppBar extends AppBar {
  //final BuildContext context;

  CustomAppBar({
    Key? key,
    String? title,
    Widget? leading,
    List<Widget>? actions,
    bool? centerTitle,
    required BuildContext context,
  }) : super(
          key: key,
          title: Text(title ?? ''),
          centerTitle: centerTitle ?? true,
          leading: leading ??
              Padding(
                padding: const EdgeInsets.only(left: 24),
                child: IconButton(
                  iconSize: 36,
                  icon: const Icon(Icons.arrow_back_rounded),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 24),
              child: IconButton(
                iconSize: 36,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) => const SettingPage(),
                    ),
                  );
                },
                icon: const Icon(Icons.settings),
              ),
            ),
          ],
        );
}
