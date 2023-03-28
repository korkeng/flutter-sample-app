import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:sample_app/assets/constants/translation_keys.dart';
import 'package:sample_app/src/components/custom_bottom_sheet.dart';
import 'package:sample_app/src/widgets/change_language.dart';
import 'package:sample_app/src/widgets/logout_widget.dart';

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
                      return CustomBottomSheet(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              tr(TranslationKey.settingPageTitle),
                              style: const TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 24),
                            LogoutWidget(),
                            const SizedBox(height: 24),
                            ChangeLanguage(),
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
