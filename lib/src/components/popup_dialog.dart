import 'package:flutter/material.dart';

class PopupDialog extends StatelessWidget {
  final String title;
  final String description;
  final IconData image;
  final String? textButton1;
  final Function? fnButton1;
  final String? textButton2;
  final Function? fnButton2;

  const PopupDialog({
    Key? key,
    required this.title,
    required this.description,
    required this.image,
    this.textButton1,
    this.fnButton1,
    this.textButton2,
    this.fnButton2,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: MediaQuery.of(context).size.width * 0.9,
        height: textButton1 != null || textButton2 != null
            ? MediaQuery.of(context).size.height * 0.5
            : MediaQuery.of(context).size.height * 0.4,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(8)),
          color: Colors.white.withOpacity(0.95),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: EdgeInsets.only(right: 16, top: 12),
                child: GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Icon(Icons.close, color: Colors.black),
                ),
              ),
            ),
            Icon(
              image,
              size: 128,
              color: Colors.redAccent,
            ),
            SizedBox(height: 16),
            Text(
              title,
              style: TextStyle(
                color: Colors.black87,
                fontSize: 28,
                fontWeight: FontWeight.bold,
                fontFamily: 'Subject Condensed',
                decoration: TextDecoration.none,
              ),
            ),
            SizedBox(height: 12),
            Text(
              description,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black87,
                fontSize: 22,
                fontFamily: 'Subject Condensed',
                fontWeight: FontWeight.normal,
                decoration: TextDecoration.none,
              ),
            ),
            SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                if (textButton1 != null)
                  ElevatedButton(
                    onPressed: () => fnButton1?.call() ?? null,
                    style: ButtonStyle(
                      textStyle: MaterialStateProperty.all(
                        const TextStyle(
                          fontSize: 20,
                          fontFamily: 'Subject Condensed',
                        ),
                      ),
                      fixedSize: MaterialStateProperty.all(const Size(120, 56)),
                    ),
                    child: Text(
                      textButton1!,
                      style: TextStyle(
                        fontSize: 20,
                        fontFamily: 'Subject Condensed',
                      ),
                    ),
                  ),
                if (textButton2 != null)
                  ElevatedButton(
                    onPressed: () => fnButton2?.call() ?? null,
                    style: ButtonStyle(
                      textStyle: MaterialStateProperty.all(
                        const TextStyle(
                          fontSize: 20,
                          fontFamily: 'Subject Condensed',
                        ),
                      ),
                      fixedSize: MaterialStateProperty.all(const Size(120, 56)),
                    ),
                    child: Text(
                      textButton2!,
                      style: TextStyle(
                        fontSize: 20,
                        fontFamily: 'Subject Condensed',
                      ),
                    ),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
