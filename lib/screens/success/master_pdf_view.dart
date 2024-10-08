import 'dart:io'; // To get file paths
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';
import 'package:path_provider/path_provider.dart';

class MasterPdfView extends StatefulWidget {
  const MasterPdfView({super.key});

  @override
  State<MasterPdfView> createState() => _MasterPdfViewState();
}

class _MasterPdfViewState extends State<MasterPdfView> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () {
          _createPDF();
        },
        child: Text('Generate PDF'),
      ),
    );
  }

  Future<void> _createPDF() async {
    // Create a new PDF document.
    final PdfDocument document = PdfDocument();
    // Add a page and draw text on it.
    final PdfPage page = document.pages.add();
    page.graphics.drawString(
      'Hello, this is a PDF created using Syncfusion!',
      PdfStandardFont(PdfFontFamily.helvetica, 18),
    );

    // Save the PDF to the device.
    List<int> bytes = await document.save();
    document.dispose();

    // Save and open the PDF.
    final directory = await getApplicationDocumentsDirectory();
    final path = directory.path;
    final file = File('$path/syncfusion_example.pdf');
    await file.writeAsBytes(bytes, flush: true);

    // Optionally, you can open the PDF file after saving it.
    print('PDF saved at: $path/syncfusion_example.pdf');
  }
}
