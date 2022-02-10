import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:sample_app/assets/constants/image_path.dart';
import 'package:sample_app/assets/constants/translation_keys.dart';
import 'package:sample_app/src/components/custom_appbar.dart';
import 'package:sample_app/src/components/menu_card.dart';

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
        title: tr(TranslationKey.mainPageTitle),
        context: context,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              children: [
                MenuCard(
                  image: ImagePath.test,
                  text: tr(TranslationKey.pretest),
                  colors: Colors.blue.shade400,
                ),
                const SizedBox(height: 24),
                MenuCard(
                  image: ImagePath.book,
                  text: tr(TranslationKey.worksheet),
                  colors: Colors.blue.shade400,
                ),
                const SizedBox(height: 24),
                MenuCard(
                  image: ImagePath.circuit,
                  text: tr(TranslationKey.laboratory),
                  colors: Colors.blue.shade400,
                ),
                const SizedBox(height: 24),
                MenuCard(
                  image: ImagePath.test,
                  text: tr(TranslationKey.posttest),
                  colors: Colors.blue.shade400,
                ),
                const SizedBox(height: 24),
                MenuCard(
                  image: ImagePath.smile,
                  text: tr(TranslationKey.satisfactionsurvey),
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
