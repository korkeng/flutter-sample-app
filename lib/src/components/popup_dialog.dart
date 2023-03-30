import 'package:flutter/material.dart';

class PopupDialog extends StatelessWidget {
  const PopupDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: MediaQuery.of(context).size.width * 0.9,
        height: MediaQuery.of(context).size.height * 0.4,
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
              Icons.warning_amber_rounded,
              size: 128,
              color: Colors.redAccent,
            ),
            SizedBox(height: 16),
            Text(
              'ขออภัย',
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
              'ไม่สามารถส่งคำตอบได้เนื่องจาก\nยังเลือกคำตอบไม่ครบ',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black87,
                fontSize: 22,
                fontFamily: 'Subject Condensed',
                fontWeight: FontWeight.normal,
                decoration: TextDecoration.none,
              ),
            )
          ],
        ),
      ),
    );
  }
}
