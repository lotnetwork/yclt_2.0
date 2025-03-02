// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:flutter/rendering.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:path_provider/path_provider.dart';
import 'dart:io';

GlobalKey globalKey = GlobalKey();

Future<String?> captureWidgetToPdf() async {
  // Add your function code here!
  try {
    // Capture the widget as an image
    RenderRepaintBoundary? boundary =
        globalKey.currentContext?.findRenderObject() as RenderRepaintBoundary?;
    if (boundary == null) {
      print("RenderRepaintBoundary is null");
      return null;
    }
    ui.Image image = await boundary.toImage(pixelRatio: 3.0);
    ByteData? byteData = await image.toByteData(format: ui.ImageByteFormat.png);
    if (byteData == null) {
      print("ByteData is null");
      return null;
    }
    Uint8List pngBytes = byteData.buffer.asUint8List();

    // Convert the image to a PDF
    final pdf = pw.Document();
    final pdfImage = pw.MemoryImage(pngBytes);

    pdf.addPage(
      pw.Page(
        build: (context) => pw.Center(
          child: pw.Image(pdfImage),
        ),
      ),
    );

    Uint8List pdfBytes = await pdf.save();

    // Save the PDF to file
    final directory = await getApplicationDocumentsDirectory();
    String savePath = "${directory.path}/documents";
    Directory saveDir = Directory(savePath);

    if (!(await saveDir.exists())) {
      await saveDir.create(recursive: true);
    }

    final file = File('${saveDir.path}/widget_capture.pdf');
    await file.writeAsBytes(pdfBytes);

    print("PDF saved at: ${file.path}");

    return file.path; // Return the path of the saved PDF
  } catch (e) {
    print("Error: $e");
    return null;
  }
}
