import 'package:flutter/material.dart';
import 'package:sample_app/utils/add_import.dart';

class Changelanguage extends StatelessWidget {
  const Changelanguage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        await context.setLocale(
          context.locale.toString() == 'en'
              ? const Locale('th')
              : const Locale('en'),
        );
      },
      child: Container(
        color: Colors.transparent,
        height: 50,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  width: 40,
                  height: 40,
                  alignment: Alignment.center,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xFF9ECEFA),
                  ),
                  child: const Icon(
                    Icons.language,
                    color: Colors.blue,
                    size: 28,
                  ),
                ),
                const SizedBox(width: 16),
                const Text(
                  'Change language',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ],
            ),
            const Icon(
              Icons.chevron_right_rounded,
              size: 32,
            ),
          ],
        ),
      ),
    );
  }
}
