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

import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';

class ReadMoreHtml extends StatefulWidget {
  const ReadMoreHtml({
    super.key,
    this.width,
    this.height,
    required this.htmlContent,
    required this.maxLength,
  });

  final double? width;
  final double? height;
  final String htmlContent;
  final int maxLength;

  @override
  State<ReadMoreHtml> createState() => _ReadMoreHtmlState();
}

class _ReadMoreHtmlState extends State<ReadMoreHtml> {
  bool _isExpanded = false;

  String _getTruncatedContent(String content, int maxLength) {
    if (content.length <= maxLength) {
      return content;
    } else {
      return '${content.substring(0, maxLength)}...';
    }
  }

  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        HtmlWidget(
          _isExpanded
              ? widget.htmlContent
              : _getTruncatedContent(widget.htmlContent, widget.maxLength),
        ),
        GestureDetector(
          onTap: () {
            setState(() {
              _isExpanded = !_isExpanded;
            });
          },
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
            child: Text(
              _isExpanded ? 'View less' : 'View more...',
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: 'SF Pro Display',
                    color: FlutterFlowTheme.of(context).primary,
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 0,
                    useGoogleFonts: false,
                    lineHeight: 1.5,
                  ),
            ),
          ),
        ),
      ],
    );
  }
}
