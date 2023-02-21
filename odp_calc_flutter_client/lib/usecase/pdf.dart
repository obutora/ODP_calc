import 'package:flutter/services.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

class PdfCreator {
  static Future<pw.Document> create() async {
    final fontData =
        await rootBundle.load('assets/fonts/IBMPlexSansJP-Regular.ttf');
    final font = pw.Font.ttf(fontData);

    print(font);

    final pdf = pw.Document(
      author: "haga",
      title: "barcode list",
      theme: pw.ThemeData.withFont(
        base: font,
      ),
    );

    pdf.addPage(
      pw.Page(
        pageFormat: PdfPageFormat.a4,
        build: (pw.Context context) {
          return pw.GridView(crossAxisCount: 3, children: [
            pw.Column(children: [
              pw.BarcodeWidget(
                barcode: pw.Barcode.ean13(),
                data: '123456789012',
                width: 120,
                height: 48,
              ),
              pw.Text('JAN(ean13)日本語'),
            ]),
            pw.Column(children: [
              pw.BarcodeWidget(
                barcode: pw.Barcode.code128(),
                data: '123456789012',
                width: 120,
                height: 48,
              ),
              pw.Text('code 128'),
            ]),
            pw.Column(children: [
              pw.BarcodeWidget(
                barcode: pw.Barcode.gs128(),
                data: '987654321',
                width: 120,
                height: 48,
              ),
              pw.Text('GS-1 128'),
            ])
          ]); // Center
        },
      ),
    );

    return pdf;
  }
}
