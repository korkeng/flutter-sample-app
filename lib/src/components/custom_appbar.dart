import 'package:flutter/material.dart';

class CustomAppBar extends AppBar {
  //final BuildContext context;

  CustomAppBar({
    Key? key,
    String? title,
    bool? centerTitle,
  }) : super(
          key: key,
          title: Text(title ?? ''),
          centerTitle: centerTitle ?? true,
          leading: Padding(
            padding: const EdgeInsets.only(left: 24),
            child: IconButton(
              iconSize: 36,
              icon: const Icon(Icons.account_circle_outlined),
              onPressed: () {},
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 24),
              child: IconButton(
                iconSize: 36,
                onPressed: () {},
                icon: const Icon(Icons.settings),
              ),
            ),
          ],
        );
}
