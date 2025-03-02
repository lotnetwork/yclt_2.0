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

import 'package:readmore/readmore.dart';

class ReadmoreText extends StatefulWidget {
  const ReadmoreText({
    super.key,
    this.width,
    this.height,
    this.text,
  });

  final double? width;
  final double? height;
  final String? text;

  @override
  State<ReadmoreText> createState() => _ReadmoreTextState();
}

class _ReadmoreTextState extends State<ReadmoreText> {
  @override
  Widget build(BuildContext context) {
    return ReadMoreText(
      widget.text!,
      trimLines: 2,
      trimMode: TrimMode.Line,
      trimCollapsedText: 'Read more',
      trimExpandedText: ' Read less',
      style: FlutterFlowTheme.of(context).bodyMedium.override(
            fontFamily: 'SatoshiFont',
            color: FlutterFlowTheme.of(context).secondaryText,
            fontSize: 15,
            fontWeight: FontWeight.w400,
            useGoogleFonts: false,
            lineHeight: 1.5,
          ),
      lessStyle: FlutterFlowTheme.of(context).bodyMedium.override(
            fontFamily: 'SatoshiFont',
            color: FlutterFlowTheme.of(context).primary,
            fontSize: 15,
            fontWeight: FontWeight.w400,
            useGoogleFonts: false,
          ),
      moreStyle: FlutterFlowTheme.of(context).bodyMedium.override(
            fontFamily: 'SatoshiFont',
            color: FlutterFlowTheme.of(context).primary,
            fontSize: 17,
            fontWeight: FontWeight.w400,
            useGoogleFonts: false,
          ),
    );
  }
}
