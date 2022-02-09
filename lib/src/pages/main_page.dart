import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:sample_app/assets/constants/image_path.dart';
import 'package:sample_app/assets/constants/translation_keys.dart';
import 'package:sample_app/src/components/custom_appbar.dart';
import 'package:sample_app/src/components/menu_card.dart';
import 'package:sample_app/utils/add_import.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: tr(TranslationKey.mainPage),
        context: context,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              children: [
                TextButton(
                  onPressed: () async {
                    await context.setLocale(
                      context.locale.toString() == 'en'
                          ? const Locale('th')
                          : const Locale('en'),
                    );
                  },
                  child: const Text('change language'),
                ),
                MenuCard(
                  image: ImagePath.test,
                  text: 'แบบทดสอบก่อนเรียน',
                  colors: Colors.blue.shade400,
                ),
                const SizedBox(height: 24),
                MenuCard(
                  image: ImagePath.book,
                  text: 'ใบความรู้',
                  colors: Colors.blue.shade400,
                ),
                const SizedBox(height: 24),
                MenuCard(
                  image: ImagePath.circuit,
                  text: 'การทดลอง',
                  colors: Colors.blue.shade400,
                ),
                const SizedBox(height: 24),
                MenuCard(
                  image: ImagePath.test,
                  text: 'แบบทดสอบหลังเรียน',
                  colors: Colors.blue.shade400,
                ),
                const SizedBox(height: 24),
                MenuCard(
                  image: ImagePath.smile,
                  text: 'แบบประเมินความพึงพอใจ',
                  colors: Colors.blue.shade400,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
