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

import '/custom_code/actions/index.dart' as actions;
import 'package:flutter/gestures.dart';
import 'dart:async';
import 'package:event_management_app/backend/api_requests/api_calls.dart';

class TimerWidget extends StatefulWidget {
  const TimerWidget({
    super.key,
    this.width,
    this.height,
    this.fullName,
    this.email,
    this.password,
  });

  final double? width;
  final double? height;
  final String? fullName;
  final String? email;
  final String? password;

  @override
  State<TimerWidget> createState() => _TimerWidgetState();
}

class _TimerWidgetState extends State<TimerWidget> {
  Timer? timer;
  int secondsLeft = 60;

  void startTimer() {
    timer = new Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (secondsLeft > 0) {
          secondsLeft--;
        } else {
          timer.cancel(); // Stop the timer when it reaches 0
        }
      });
    });
  }

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  void dispose() {
    timer!.cancel();
    super.dispose();
  }

  String formatTime(int seconds) {
    int minutes = seconds ~/ 60;
    int remainingSeconds = seconds % 60;
    String second = remainingSeconds.toString().padLeft(2, '0');
    return '$minutes:$second';
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: AlignmentDirectional(0.0, 0.0),
          child: Text(
            formatTime(secondsLeft),
            style: FlutterFlowTheme.of(context).bodyMedium.override(
                  fontFamily: 'SF Pro Display',
                  color: FlutterFlowTheme.of(context).battleshipGrey,
                  fontSize: 16.0,
                  letterSpacing: 0.0,
                  useGoogleFonts: false,
                ),
          ),
        ),
        Align(
          alignment: AlignmentDirectional(0.0, 0.0),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 24, 0.0, 0.0),
            child: RichText(
              textScaler: MediaQuery.of(context).textScaler,
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'Didn’t get code? ',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'SF Pro Display',
                          color: FlutterFlowTheme.of(context).battleshipGrey,
                          fontSize: 16.0,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.normal,
                          useGoogleFonts: false,
                        ),
                  ),
                  TextSpan(
                    text: 'Resend code',
                    style: TextStyle(
                      fontFamily: 'SF Pro Display',
                      color: secondsLeft == 0
                          ? FlutterFlowTheme.of(context).primary
                          : FlutterFlowTheme.of(context).battleshipGrey,
                      fontWeight: FontWeight.bold,
                      fontSize: 16.0,
                    ),
                    mouseCursor: SystemMouseCursors.click,
                    recognizer: TapGestureRecognizer()
                      ..onTap = () async {
                        if (secondsLeft == 0) {
                          secondsLeft = 60;
                          startTimer();

                          await EventAPIGroup.signUpApiCall.call(
                            name: widget!.fullName,
                            email: widget!.email,
                            password: widget!.password,
                            countryCode: FFAppState().countryCode,
                            country: FFAppState().country,
                            phone: FFAppState().phone,
                          );

                          await actions.showCustomToastBottom(
                            'OTP Resend!',
                          );

                          setState(() {});
                        }
                      },
                  )
                ],
                style: FlutterFlowTheme.of(context).bodyMedium,
              ),
            ),
          ),
        )
      ],
    );
  }
}
