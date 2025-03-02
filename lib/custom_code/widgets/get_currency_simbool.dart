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

import 'package:currency_symbols/currency_symbols.dart';

class GetCurrencySimbool extends StatefulWidget {
  const GetCurrencySimbool({
    super.key,
    this.width,
    this.height,
    this.isSimbool,
    this.color,
    this.fontSize,
  });

  final double? width;
  final double? height;
  final String? isSimbool;
  final Color? color;
  final double? fontSize;

  @override
  State<GetCurrencySimbool> createState() => _GetCurrencySimboolState();
}

class _GetCurrencySimboolState extends State<GetCurrencySimbool> {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: widget.height,
        width: widget.width,
        child: Center(
          child: Text("${cSymbol(widget.isSimbool ?? "USD")}",
              style: TextStyle(
                fontSize: widget.fontSize ?? 17,
                fontWeight: FontWeight.w500,
                color: widget.color,
              )),
        ));
  }
}
