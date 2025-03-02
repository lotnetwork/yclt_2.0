import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'payment_dialog_model.dart';
export 'payment_dialog_model.dart';

class PaymentDialogWidget extends StatefulWidget {
  const PaymentDialogWidget({super.key});

  @override
  State<PaymentDialogWidget> createState() => _PaymentDialogWidgetState();
}

class _PaymentDialogWidgetState extends State<PaymentDialogWidget> {
  late PaymentDialogModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PaymentDialogModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: const AlignmentDirectional(0.0, 0.0),
      child: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
        child: Container(
          width: () {
            if (MediaQuery.sizeOf(context).width < kBreakpointSmall) {
              return (MediaQuery.sizeOf(context).width - 40);
            } else if (MediaQuery.sizeOf(context).width < kBreakpointMedium) {
              return 395.0;
            } else if (MediaQuery.sizeOf(context).width < kBreakpointLarge) {
              return 395.0;
            } else {
              return 395.0;
            }
          }(),
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).primaryBackground,
            borderRadius: BorderRadius.circular(22.0),
          ),
          child: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(16.0, 30.0, 16.0, 30.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 114.0,
                  height: 114.0,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondary,
                    shape: BoxShape.circle,
                  ),
                  alignment: const AlignmentDirectional(0.0, 0.0),
                  child: Container(
                    width: 64.0,
                    height: 64.0,
                    clipBehavior: Clip.antiAlias,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                    ),
                    child: Image.asset(
                      'assets/images/Your_seats_cancelled.png',
                      fit: BoxFit.cover,
                      alignment: const Alignment(0.0, 0.0),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 12.0),
                  child: Text(
                    'Payment successfull',
                    textAlign: TextAlign.center,
                    maxLines: 1,
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'SF Pro Display',
                          fontSize: 24.0,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.bold,
                          useGoogleFonts: false,
                          lineHeight: 1.5,
                        ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 24.0),
                  child: Text(
                    'Thank you! Your payment has been successfully processed',
                    textAlign: TextAlign.center,
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'SF Pro Display',
                          fontSize: 18.0,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.normal,
                          useGoogleFonts: false,
                          lineHeight: 1.5,
                        ),
                  ),
                ),
                FFButtonWidget(
                  onPressed: () async {
                    FFAppState().clearUpComingCacheCache();
                    Navigator.pop(context);

                    context.goNamed('MyTicketPaymentPage');
                  },
                  text: 'Back To Events',
                  options: FFButtonOptions(
                    width: double.infinity,
                    height: 60.0,
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(30.0, 0.0, 30.0, 0.0),
                    iconPadding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    color: FlutterFlowTheme.of(context).primary,
                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                          fontFamily: 'SF Pro Display',
                          color: FlutterFlowTheme.of(context).primaryBackground,
                          fontSize: 18.0,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.w600,
                          useGoogleFonts: false,
                        ),
                    elevation: 0.0,
                    borderSide: const BorderSide(
                      color: Colors.transparent,
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(22.0),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
