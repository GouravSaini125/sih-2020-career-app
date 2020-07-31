import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:hello/FullPdfViewerScreen.dart';
import 'package:hello/Pdf.dart';
import 'package:path_provider/path_provider.dart';

class PdfList extends StatefulWidget {
  PdfList({Key key}) : super(key: key);

  @override
  _PdfListState createState() => _PdfListState();
}

class _PdfListState extends State<PdfList> {

  final pdfs = Pdf.fetchAllPdfs();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Opening a PDF"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Stack(
            children: <Widget>[
              Divider(
                color: Colors.teal,
                thickness: 2.0,
              ),
              Center(
                child: Container(
                  padding: EdgeInsets.only(
                    left: 20.0,
                    right: 20.0,
                  ),
                  color: Colors.white,
                  child: Text(
                    "Recommended Articles",
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20.0,
          ),
          Container(
            height: 200.0,
            margin: EdgeInsets.only(
              bottom: 50.0,
            ),
            child: ListView.builder(
              itemCount: pdfs.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext ctxt, int i) {
                return GestureDetector(
                  onTap: (){
                    prepareTestPdf(pdfs[i].path).then((path) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => FullPdfViewerScreen(path)),
                      );
                    });
                  },
                  child: Container(
                    margin: EdgeInsets.only(
                      left: 20.0,
                      right: 20.0,
                    ),
                    color: Colors.teal,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Container(
                          height: 150.0,
                          width: MediaQuery.of(context).size.width/1.5,
                          child: Image.asset(
                              pdfs[i].image,
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width/1.5 - 20.0,
                          child: Center(
                            child: Text(
                              pdfs[i].title,
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Future<String> prepareTestPdf(documentPath) async {
    final ByteData bytes =
    await DefaultAssetBundle.of(context).load(documentPath);
    final Uint8List list = bytes.buffer.asUint8List();

    final tempDir = await getTemporaryDirectory();
    final tempDocumentPath = '${tempDir.path}/$documentPath';

    final file = await File(tempDocumentPath).create(recursive: true);
    file.writeAsBytesSync(list);
    return tempDocumentPath;
  }

}
