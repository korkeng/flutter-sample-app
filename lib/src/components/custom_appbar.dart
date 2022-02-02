import 'package:flutter/material.dart';
import 'package:sample_app/src/components/custom_buttom_sheet.dart';

class CustomAppBar extends AppBar {
  CustomAppBar({
    Key? key,
    String? title,
    bool? centerTitle,
    required BuildContext context,
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
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    backgroundColor: Colors.transparent,
                    builder: (BuildContext context) {
                      return CustomButtomSheet(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Setting',
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 24),
                            Container(
                              height: 50,
                              color: Colors.black38,
                            ),
                            const SizedBox(height: 24),
                            Container(
                              height: 50,
                              color: Colors.black38,
                            ),
                          ],
                        ),
                      );
                    },
                  );
                },
                icon: const Icon(Icons.settings),
              ),
            ),
          ],
        );
}
