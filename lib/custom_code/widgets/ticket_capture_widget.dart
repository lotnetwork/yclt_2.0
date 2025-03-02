// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:flutter/rendering.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'package:event_management_app/flutter_flow/flutter_flow_widgets.dart';
import 'package:share_plus/share_plus.dart';
import 'package:open_file/open_file.dart';
import '/pages/componants/cancel_booking_componant/cancel_booking_componant_widget.dart';

class TicketCaptureWidget extends StatefulWidget {
  const TicketCaptureWidget({
    super.key,
    this.width,
    this.height,
    required this.capture,
    required this.bottomSheetComponant,
    required this.status,
  });

  final double? width;
  final double? height;
  final Widget Function() capture;
  final Widget Function() bottomSheetComponant;
  final String status;

  @override
  State<TicketCaptureWidget> createState() => _TicketCaptureWidgetState();
}

class _TicketCaptureWidgetState extends State<TicketCaptureWidget> {
  GlobalKey globalKey = GlobalKey();

  Future<Uint8List?> captureWidgetToImage() async {
    try {
      // RenderRepaintBoundary? boundary =
      // globalKey.currentContext!.findRenderObject() as RenderRepaintBoundary;
      // var image = await boundary.toImage(pixelRatio: 2);
      // var byteData = await image.toByteData(format: ImageByteFormat.png);
      // var pngBytes = byteData!.buffer.asUint8List();
      //
      // return pngBytes;

      RenderRepaintBoundary? boundary = globalKey.currentContext
          ?.findRenderObject() as RenderRepaintBoundary?;
      if (boundary != null) {
        ui.Image image = await boundary.toImage(pixelRatio: 3.0);
        ByteData? byteData =
            await image.toByteData(format: ui.ImageByteFormat.png);

        return byteData?.buffer.asUint8List();
      } else {
        print(
            "Error capturing widget as an image: RenderRepaintBoundary is null");
        return null;
      }
    } catch (e) {
      print("Error capturing widget as an image: $e");
      return null;
    }
  }

  Future<Uint8List?> convertImageToPdf(Uint8List imageBytes) async {
    try {
      final pdf = pw.Document();
      final pdfImage = pw.MemoryImage(imageBytes);

      pdf.addPage(
        pw.Page(
          build: (context) {
            return pw.Center(
              child: pw.Image(pdfImage),
            );
          },
        ),
      );

      return pdf.save();
    } catch (e) {
      print("Error converting image to PDF: $e");
      return null;
    }
  }

  Future<String> get _localPath async {
    final directory = await getTemporaryDirectory();
    return directory.path;
  }

  List<FileSystemEntity> files = [];

  // Future<String> saveImageToFile(Uint8List imageBytes) async {
  // final directory = await getTemporaryDirectory();

  // final directory = await getApplicationDocumentsDirectory();

  //  String savePath = "${directory.path}/images";
  //   Directory saveDir = Directory(savePath);

  //  if (await saveDir.exists()) {
  //   final file = File('${saveDir.path}/ticket_image.png');
  //  await file.writeAsBytes(imageBytes);
  //  } else {
  //   saveDir.create();
  //   final file = File('${saveDir.path}/ticket_image.png');
  //   await file.writeAsBytes(imageBytes);
  //   }

  //   List<FileSystemEntity> list = saveDir.listSync();
  // print("xcvbnhxjcvbhxcv-----${list[0].path} ");

  //  return list[0].path;
  //}

  Future<String> saveImageToFile(Uint8List imageBytes) async {
    final directory = await getApplicationDocumentsDirectory();
    String savePath = "${directory.path}/images";
    Directory saveDir = Directory(savePath);

    // Check if the directory exists and create it if it doesn't
    if (!(await saveDir.exists())) {
      await saveDir.create(recursive: true);
    }

    // Generate a unique filename based on timestamp
    String fileName =
        "ticket_image_${DateTime.now().millisecondsSinceEpoch}.png";
    final file = File('${saveDir.path}/$fileName');

    // Write the image bytes to the file
    await file.writeAsBytes(imageBytes);

    print("Image saved to: ${file.path}");
    return file.path; // Return the path of the saved image
  }

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ListView(
              physics: AlwaysScrollableScrollPhysics(),
              shrinkWrap: true,
              children: [
                RepaintBoundary(
                  key: globalKey,
                  child: widget.capture(),
                ),
              ],
            ),
          ),
          if (widget.status == 'Upcoming')
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(20.0, 12.0, 20.0, 30.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: Builder(
                      builder: (context) => FFButtonWidget(
                        onPressed: () async {
                          await showModalBottomSheet(
                            isScrollControlled: true,
                            backgroundColor: Colors.transparent,
                            enableDrag: false,
                            context: context,
                            builder: (context) {
                              return widget.bottomSheetComponant();
                            },
                          ).then((value) => safeSetState(() {}));
                        },
                        text: 'Cancel booking',
                        options: FFButtonOptions(
                          width: double.infinity,
                          height: 60.0,
                          padding: EdgeInsetsDirectional.fromSTEB(
                              30.0, 0.0, 30.0, 0.0),
                          iconPadding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: FlutterFlowTheme.of(context).tertiary,
                          textStyle:
                              FlutterFlowTheme.of(context).titleSmall.override(
                                    fontFamily: 'SF Pro Display',
                                    color: FlutterFlowTheme.of(context).primary,
                                    fontSize: 18.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w600,
                                    useGoogleFonts: false,
                                    lineHeight: 1.0,
                                  ),
                          elevation: 0.0,
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context).primary,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(22.0),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: FFButtonWidget(
                      onPressed: () async {
                        final imageBytes = await captureWidgetToImage();

                        if (imageBytes != null) {
                          final pdfBytes = await convertImageToPdf(imageBytes);

                          if (pdfBytes != null) {
                            // Save the PDF to a file in the temporary directory

                            final filePath = await _localPath;
                            final file =
                                await File('$filePath/Event_ticket.pdf')
                                    .writeAsBytes(pdfBytes);

                            print("PDF saved to: ${file.path}");

                            // Open the PDF file using the open_file package

                            OpenFile.open(file.path);
                          } else {
                            print("Failed to convert image to PDF.");
                          }
                        } else {
                          print("Failed to capture widget as an image.");
                        }
                      },
                      text: 'Download',
                      options: FFButtonOptions(
                        width: double.infinity,
                        height: 60.0,
                        padding: EdgeInsetsDirectional.fromSTEB(
                            30.0, 0.0, 30.0, 0.0),
                        iconPadding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: FlutterFlowTheme.of(context).primary,
                        textStyle:
                            FlutterFlowTheme.of(context).titleSmall.override(
                                  fontFamily: 'SF Pro Display',
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  fontSize: 18.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w600,
                                  useGoogleFonts: false,
                                  lineHeight: 1.0,
                                ),
                        elevation: 0.0,
                        borderSide: BorderSide(
                          color: Colors.transparent,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(22.0),
                      ),
                    ),
                  ),
                ].divide(SizedBox(width: 20.0)),
              ),
            ),
        ]);
  }
}
