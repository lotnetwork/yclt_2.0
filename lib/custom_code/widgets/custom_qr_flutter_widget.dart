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

import 'package:qr_flutter/qr_flutter.dart';

class CustomQrFlutterWidget extends StatefulWidget {
  const CustomQrFlutterWidget({
    super.key,
    this.width,
    this.height,
    this.qrJson,
  });

  final double? width;
  final double? height;
  final dynamic qrJson;

  @override
  State<CustomQrFlutterWidget> createState() => _CustomQrFlutterWidgetState();
}

class _CustomQrFlutterWidgetState extends State<CustomQrFlutterWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width, // Use the provided width
      height: widget.height, // Use the provided height
      child: QrImageView(
        data: widget.qrJson.toString(), // Convert the dynamic JSON to string
        //     version: QrVersions.auto,
        size: 110, // Use the provided width or default to 100
      ),
    );
  }
}
