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

import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:flutter/services.dart';

class CustomLabelCountryCodeEditWidget extends StatefulWidget {
  const CustomLabelCountryCodeEditWidget({
    super.key,
    this.width,
    this.height,
    this.initialValue,
    this.code,
  });

  final double? width;
  final double? height;
  final String? initialValue;
  final String? code;

  @override
  State<CustomLabelCountryCodeEditWidget> createState() =>
      _CustomLabelCountryCodeEditWidgetState();
}

class _CustomLabelCountryCodeEditWidgetState
    extends State<CustomLabelCountryCodeEditWidget> {
  @override
  Widget build(BuildContext context) {
    return IntlPhoneField(
      showCountryFlag: false,
      autofocus: false,
      dropdownIcon: Icon(
        Icons.keyboard_arrow_down,
        size: 12,
        color: FlutterFlowTheme.of(context).primaryText,
      ),
      style: FlutterFlowTheme.of(context).bodyMedium.override(
            fontFamily: 'SF Pro Display',
            fontSize: 17.0,
            letterSpacing: 0.0,
            useGoogleFonts: false,
          ),
      dropdownIconPosition: IconPosition.trailing,
      dropdownTextStyle: FlutterFlowTheme.of(context).bodyMedium.override(
            fontFamily: 'SF Pro Display',
            color: FlutterFlowTheme.of(context).primaryText,
            fontSize: 16,
            letterSpacing: 0.0,
            useGoogleFonts: false,
            lineHeight: 1,
          ),
      dropdownDecoration:
          BoxDecoration(borderRadius: BorderRadius.circular(10)),
      initialValue: widget.initialValue,
      flagsButtonMargin: EdgeInsets.only(left: 16),
      keyboardType: TextInputType.phone,
      cursorColor: FlutterFlowTheme.of(context).primaryText,
      inputFormatters: [FilteringTextInputFormatter.allow(RegExp('[0-9]'))],
      decoration: InputDecoration(
        // labelText: "Phone number",
        // labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
        //       fontFamily: 'SF Pro Display',
        //       color: FlutterFlowTheme.of(context).ashGrayColor,
        //       fontSize: 13.0,
        //       letterSpacing: 0.0,
        //       useGoogleFonts: false,
        //       lineHeight: 1.0,
        //     ),
        alignLabelWithHint: false,
        // label: Text(
        //   "Phone number",
        //   style: FlutterFlowTheme.of(context).labelMedium.override(
        //         fontFamily: 'SF Pro Display',
        //         color: FlutterFlowTheme.of(context).primaryText,
        //         fontSize: 14,
        //         useGoogleFonts: false,
        //         lineHeight: 1.2,
        //       ),
        // ),
        hintText: 'Phone number',
        hintStyle: FlutterFlowTheme.of(context).labelMedium.override(
              fontFamily: 'SF Pro Display',
              color: FlutterFlowTheme.of(context).ashGrayColor,
              fontSize: 16.0,
              letterSpacing: 0.0,
              useGoogleFonts: false,
              lineHeight: 1.5,
            ),
        counterText: '',

        // errorText: 'Please enter valid number ',
        errorStyle: FlutterFlowTheme.of(context).bodyMedium.override(
              fontFamily: 'SF Pro Display',
              color: FlutterFlowTheme.of(context).error,
              fontSize: 15.0,
              letterSpacing: 0.0,
              useGoogleFonts: false,
              lineHeight: 1.2,
            ),
        // contentPadding: EdgeInsets.only(top: 16, bottom: 16, left: 16),
        contentPadding: EdgeInsets.all(18),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: FlutterFlowTheme.of(context).error,
            width: 1.0,
          ),
          borderRadius: BorderRadius.circular(22.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: FlutterFlowTheme.of(context).primaryText,
            width: 1.0,
          ),
          borderRadius: BorderRadius.circular(22.0),
        ),
        disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(22),
            borderSide: BorderSide(
                color: FlutterFlowTheme.of(context).primaryText, width: 1)),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: FlutterFlowTheme.of(context).error,
            width: 1.0,
          ),
          borderRadius: BorderRadius.circular(22),
        ),

        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: FlutterFlowTheme.of(context).ashGrayColor,
            width: 1.0,
          ),
          borderRadius: BorderRadius.circular(22),
        ),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(22),
            borderSide: BorderSide(
                color: FlutterFlowTheme.of(context).primaryText, width: 1)),
      ),
      initialCountryCode: widget.code!,
      validator: (num) {
        return "Please enter valid number.";
      },
      invalidNumberMessage: "Please enter valid phone number.",
      onChanged: (value) {
        FFAppState().countryCodeEdit = value.countryCode.replaceAll("+", '');

        FFAppState().update(() {
          FFAppState().phone = value.number;
        });
      },
      autovalidateMode: AutovalidateMode.onUserInteraction,
      onCountryChanged: (value) {
        FFAppState().update(() {
          FFAppState().countryCodeEdit = value.dialCode.toString();
          FFAppState().country = value.code.toString();
        });
      },
    );
  }
}
