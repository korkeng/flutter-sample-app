import 'dart:io';
import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:sample_app/assets/constants/image_path.dart';
import 'package:sample_app/assets/constants/translation_keys.dart';
import 'package:sample_app/src/components/custom_appbar.dart';
import 'package:sample_app/src/components/menu_card.dart';
import 'package:sample_app/src/pages/laboratory_page.dart';
import 'package:sample_app/src/pages/post_test_page.dart';
import 'package:sample_app/src/pages/pre_test_page.dart';
import 'package:sample_app/src/pages/survey_page.dart';
import 'package:sample_app/src/pages/worksheet_page.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';

class MainPage extends StatefulWidget {
  MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  String pathPDF = '';

  @override
  void initState() {
    super.initState();
    // _permissionHandler();
    fromAsset('lib/assets/files/worksheet.pdf', 'worksheet.pdf').then((f) {
      setState(() {
        // print('======== ${f.path}');
        pathPDF = f.path;
        // pathPDF = 'lib/assets/files/worksheet.pdf';
      });
    });
  }

  Future<File> fromAsset(String asset, String filename) async {
    Completer<File> completer = Completer();
    try {
      var dir = await getApplicationDocumentsDirectory();
      File file = File("${dir.path}/$filename");
      var data = await rootBundle.load(asset);
      var bytes = data.buffer.asUint8List();
      await file.writeAsBytes(bytes, flush: true);
      completer.complete(file);
    } catch (e) {
      throw Exception('Error parsing asset pdf file!');
    }

    return completer.future;
  }

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
                  screenName: PreTestPage(),
                ),
                const SizedBox(height: 24),
                MenuCard(
                  image: ImagePath.book,
                  text: tr(TranslationKey.worksheet),
                  colors: Colors.blue.shade400,
                  screenName: WorksheetPage(path: pathPDF),
                ),
                const SizedBox(height: 24),
                MenuCard(
                  image: ImagePath.circuit,
                  text: tr(TranslationKey.laboratory),
                  colors: Colors.blue.shade400,
                  screenName: LaboratoryPage(),
                ),
                const SizedBox(height: 24),
                MenuCard(
                  image: ImagePath.test,
                  text: tr(TranslationKey.postTest),
                  colors: Colors.blue.shade400,
                  screenName: PostTestPage(),
                ),
                const SizedBox(height: 24),
                MenuCard(
                  image: ImagePath.smile,
                  text: tr(TranslationKey.satisfactionSurvey),
                  colors: Colors.blue.shade400,
                  screenName: SurveyPage(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
