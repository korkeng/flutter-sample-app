import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';

class WorksheetPage extends StatefulWidget {
  final String path;
  WorksheetPage({Key? key, required this.path}) : super(key: key);

  @override
  _WorksheetPageState createState() => _WorksheetPageState();
}

class _WorksheetPageState extends State<WorksheetPage> {
  int? pages = 0;
  bool isReady = false;
  String pathPDF = '';
  String errorMessage = '';

  Completer<PDFViewController> _controller = Completer<PDFViewController>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        PDFView(
          filePath: widget.path,
          onRender: (_pages) {
            setState(() {
              pages = _pages;
              isReady = true;
            });
          },
          onError: (error) {
            print(error.toString());
            errorMessage = error.toString();
          },
          onPageError: (page, error) {
            print('$page: ${error.toString()}');
            errorMessage = error.toString();
          },
          onViewCreated: (PDFViewController pdfViewController) {
            _controller.complete(pdfViewController);
          },
          onPageChanged: (int? page, int? total) {
            print('page change: $page/$total');
          },
        ),
        errorMessage.isEmpty
            ? !isReady
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : Container()
            : Center(
                child: Text(errorMessage),
              ),
        Positioned(
          top: 60,
          right: 16,
          child: GestureDetector(
            child: Icon(Icons.close),
            onTap: () => Navigator.pop(context),
          ),
        )
      ],
    );
  }
}
