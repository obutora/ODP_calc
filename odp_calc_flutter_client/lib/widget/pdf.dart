import 'package:flutter/material.dart';
import 'package:printing/printing.dart';

import '../usecase/pdf.dart';

class ShowPdf extends StatelessWidget {
  const ShowPdf({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 700, maxHeight: 987),
      child: PdfPreview(
        maxPageWidth: 700,
        allowPrinting: true,
        allowSharing: false,
        canChangeOrientation: false,
        canChangePageFormat: false,
        canDebug: false,
        loadingWidget: const CircularProgressIndicator(),
        build: (format) async {
          final pdf = await PdfCreator.create();
          return pdf.save();
        },
      ),
    );
  }
}
