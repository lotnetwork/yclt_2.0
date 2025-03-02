// ignore_for_file: use_build_context_synchronously

import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/componants/common_appbar/common_appbar_widget.dart';
import '/pages/componants/payment_dialog/payment_dialog_widget.dart';
import '/pages/shimmers/payment_shimmer/payment_shimmer_widget.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'payment_page_model.dart';
export 'payment_page_model.dart';

class PaymentPageWidget extends StatefulWidget {
  const PaymentPageWidget({
    super.key,
    required this.eventId,
    required this.subTotal,
    required this.coupon,
    required this.total,
    required this.totalTicket,
    required this.price,
    required this.couponCode,
    required this.taxAmount,
    required this.tax,
  });

  final String? eventId;
  final double? subTotal;
  final double? coupon;
  final double? total;
  final int? totalTicket;
  final double? price;
  final String? couponCode;
  final double? taxAmount;
  final double? tax;

  @override
  State<PaymentPageWidget> createState() => _PaymentPageWidgetState();
}

class _PaymentPageWidgetState extends State<PaymentPageWidget> {
  late PaymentPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PaymentPageModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              wrapWithModel(
                model: _model.commonAppbarModel,
                updateCallback: () => safeSetState(() {}),
                child: const CommonAppbarWidget(
                  title: 'Payment',
                ),
              ),
              Expanded(
                child: FutureBuilder<ApiCallResponse>(
                  future: (_model
                          .apiRequestCompleter ??= Completer<ApiCallResponse>()
                        ..complete(EventAPIGroup.paymentGatewayApiCall.call()))
                      .future,
                  builder: (context, snapshot) {
                    // Customize what your widget looks like when it's loading.
                    if (!snapshot.hasData) {
                      return const Center(
                        child: SizedBox(
                          width: double.infinity,
                          height: double.infinity,
                          child: PaymentShimmerWidget(),
                        ),
                      );
                    }
                    final containerPaymentGatewayApiResponse = snapshot.data!;

                    return Container(
                      width: double.infinity,
                      height: double.infinity,
                      decoration: const BoxDecoration(),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  20.0, 0.0, 20.0, 0.0),
                              child: RefreshIndicator(
                                color: FlutterFlowTheme.of(context).primary,
                                onRefresh: () async {
                                  safeSetState(
                                      () => _model.apiRequestCompleter = null);
                                  await _model.waitForApiRequestCompleted();
                                },
                                child: ListView(
                                  padding: const EdgeInsets.fromLTRB(
                                    0,
                                    20.0,
                                    0,
                                    20.0,
                                  ),
                                  scrollDirection: Axis.vertical,
                                  children: [
                                    Text(
                                      'Payment Method',
                                      textAlign: TextAlign.start,
                                      maxLines: 1,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'SF Pro Display',
                                            fontSize: 16.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.bold,
                                            useGoogleFonts: false,
                                            lineHeight: 1.5,
                                          ),
                                    ),
                                    if (EventAPIGroup.paymentGatewayApiCall
                                            .paypalEnable(
                                          containerPaymentGatewayApiResponse
                                              .jsonBody,
                                        ) ==
                                        1)
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            0.0, 10.0, 0.0, 0.0),
                                        child: InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            _model.radioBtn = 0;
                                            safeSetState(() {});
                                          },
                                          child: Container(
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              borderRadius:
                                                  BorderRadius.circular(22.0),
                                              border: Border.all(
                                                color: const Color(0xFFBBCCCD),
                                              ),
                                            ),
                                            child: Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      15.0, 10.0, 15.0, 10.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                10.0, 0.0),
                                                    child: ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              0.0),
                                                      child: Image.asset(
                                                        'assets/images/paypal.png',
                                                        width: 40.0,
                                                        height: 40.0,
                                                        fit: BoxFit.contain,
                                                      ),
                                                    ),
                                                  ),
                                                  Expanded(
                                                    child: Text(
                                                      'Paypal',
                                                      textAlign:
                                                          TextAlign.start,
                                                      maxLines: 1,
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'SF Pro Display',
                                                            fontSize: 16.0,
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FontWeight
                                                                    .normal,
                                                            useGoogleFonts:
                                                                false,
                                                            lineHeight: 1.5,
                                                          ),
                                                    ),
                                                  ),
                                                  Builder(
                                                    builder: (context) {
                                                      if (_model.radioBtn ==
                                                          0) {
                                                        return ClipRRect(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      0.0),
                                                          child: Image.asset(
                                                            'assets/images/Radio_button_(3).png',
                                                            width: 24.0,
                                                            height: 24.0,
                                                            fit: BoxFit.contain,
                                                          ),
                                                        );
                                                      } else {
                                                        return ClipRRect(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      0.0),
                                                          child: Image.asset(
                                                            'assets/images/Radio_button_(2).png',
                                                            width: 24.0,
                                                            height: 24.0,
                                                            fit: BoxFit.contain,
                                                          ),
                                                        );
                                                      }
                                                    },
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    if (EventAPIGroup.paymentGatewayApiCall
                                            .stripeEnable(
                                          containerPaymentGatewayApiResponse
                                              .jsonBody,
                                        ) ==
                                        1)
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            0.0, 20.0, 0.0, 0.0),
                                        child: InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            _model.radioBtn = 1;
                                            safeSetState(() {});
                                          },
                                          child: Container(
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              borderRadius:
                                                  BorderRadius.circular(22.0),
                                              border: Border.all(
                                                color: const Color(0xFFBBCCCD),
                                              ),
                                            ),
                                            child: Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      15.0, 10.0, 15.0, 10.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                10.0, 0.0),
                                                    child: ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              0.0),
                                                      child: Image.asset(
                                                        'assets/images/stripe_1.png',
                                                        width: 40.0,
                                                        height: 40.0,
                                                        fit: BoxFit.contain,
                                                      ),
                                                    ),
                                                  ),
                                                  Expanded(
                                                    child: Text(
                                                      'Stripe',
                                                      textAlign:
                                                          TextAlign.start,
                                                      maxLines: 1,
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'SF Pro Display',
                                                            fontSize: 16.0,
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FontWeight
                                                                    .normal,
                                                            useGoogleFonts:
                                                                false,
                                                            lineHeight: 1.5,
                                                          ),
                                                    ),
                                                  ),
                                                  Builder(
                                                    builder: (context) {
                                                      if (_model.radioBtn ==
                                                          1) {
                                                        return ClipRRect(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      0.0),
                                                          child: Image.asset(
                                                            'assets/images/Radio_button_(3).png',
                                                            width: 24.0,
                                                            height: 24.0,
                                                            fit: BoxFit.contain,
                                                          ),
                                                        );
                                                      } else {
                                                        return Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            ClipRRect(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          0.0),
                                                              child:
                                                                  Image.asset(
                                                                'assets/images/Radio_button_(2).png',
                                                                width: 24.0,
                                                                height: 24.0,
                                                                fit: BoxFit
                                                                    .contain,
                                                              ),
                                                            ),
                                                          ],
                                                        );
                                                      }
                                                    },
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    if (EventAPIGroup.paymentGatewayApiCall
                                            .razorpayEnable(
                                          containerPaymentGatewayApiResponse
                                              .jsonBody,
                                        ) ==
                                        1)
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            0.0, 20.0, 0.0, 0.0),
                                        child: InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            _model.radioBtn = 2;
                                            safeSetState(() {});
                                          },
                                          child: Container(
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              borderRadius:
                                                  BorderRadius.circular(22.0),
                                              border: Border.all(
                                                color: const Color(0xFFBBCCCD),
                                              ),
                                            ),
                                            child: Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      15.0, 10.0, 15.0, 10.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                10.0, 0.0),
                                                    child: ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              0.0),
                                                      child: SvgPicture.asset(
                                                        'assets/images/razorpay_logo_(1).svg',
                                                        width: 40.0,
                                                        height: 40.0,
                                                        fit: BoxFit.contain,
                                                      ),
                                                    ),
                                                  ),
                                                  Expanded(
                                                    child: Text(
                                                      'Razorpay',
                                                      textAlign:
                                                          TextAlign.start,
                                                      maxLines: 1,
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'SF Pro Display',
                                                            fontSize: 16.0,
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FontWeight
                                                                    .normal,
                                                            useGoogleFonts:
                                                                false,
                                                            lineHeight: 1.5,
                                                          ),
                                                    ),
                                                  ),
                                                  Builder(
                                                    builder: (context) {
                                                      if (_model.radioBtn ==
                                                          2) {
                                                        return ClipRRect(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      0.0),
                                                          child: Image.asset(
                                                            'assets/images/Radio_button_(3).png',
                                                            width: 24.0,
                                                            height: 24.0,
                                                            fit: BoxFit.contain,
                                                          ),
                                                        );
                                                      } else {
                                                        return Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            ClipRRect(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          0.0),
                                                              child:
                                                                  Image.asset(
                                                                'assets/images/Radio_button_(2).png',
                                                                width: 24.0,
                                                                height: 24.0,
                                                                fit: BoxFit
                                                                    .contain,
                                                              ),
                                                            ),
                                                          ],
                                                        );
                                                      }
                                                    },
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Builder(
                            builder: (context) => Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  20.0, 10.0, 20.0, 30.0),
                              child: FFButtonWidget(
                                onPressed: () async {
                                  if (_model.radioBtn == 0) {
                                    await actions.convertToUSD(
                                      widget.total!,
                                      FFAppState().currencyName,
                                    );
                                    await actions.paypalCustom(
                                      context,
                                      EventAPIGroup.paymentGatewayApiCall
                                          .paypalpublickey(
                                        containerPaymentGatewayApiResponse
                                            .jsonBody,
                                      )!,
                                      EventAPIGroup.paymentGatewayApiCall
                                          .paypalprivatekey(
                                        containerPaymentGatewayApiResponse
                                            .jsonBody,
                                      )!,
                                      functions
                                          .roundToTwoDecimalPlaces(
                                              FFAppState().usdLivePrice)
                                          .toString(),
                                      'USD',
                                      () async {
                                        context.goNamed(
                                          'PaymentSuccessPage',
                                          queryParameters: {
                                            'eventId': serializeParam(
                                              widget.eventId,
                                              ParamType.String,
                                            ),
                                            'price': serializeParam(
                                              widget.price,
                                              ParamType.double,
                                            ),
                                            'totalTicket': serializeParam(
                                              widget.totalTicket,
                                              ParamType.int,
                                            ),
                                            'subtotal': serializeParam(
                                              widget.subTotal,
                                              ParamType.double,
                                            ),
                                            'couponCode': serializeParam(
                                              widget.couponCode,
                                              ParamType.String,
                                            ),
                                            'couponAmount': serializeParam(
                                              widget.coupon,
                                              ParamType.double,
                                            ),
                                            'totalAmount': serializeParam(
                                              widget.total,
                                              ParamType.double,
                                            ),
                                            'paymentMethod': serializeParam(
                                              'Paypal',
                                              ParamType.String,
                                            ),
                                            'tax': serializeParam(
                                              widget.tax,
                                              ParamType.double,
                                            ),
                                            'taxAmount': serializeParam(
                                              widget.taxAmount,
                                              ParamType.double,
                                            ),
                                          }.withoutNulls,
                                        );
                                      },
                                      () async {
                                        context.goNamed('PaymentFailedPage');
                                      },
                                      () async {
                                        context.goNamed('PaymentFailedPage');
                                      },
                                    );
                                  } else {
                                    if (_model.radioBtn == 1) {
                                      await actions.initStripe(
                                        EventAPIGroup.paymentGatewayApiCall
                                            .stripepublishablekey(
                                          containerPaymentGatewayApiResponse
                                              .jsonBody,
                                        )!,
                                      );
                                      await actions.stripeCustom(
                                        context,
                                        widget.total!.toString(),
                                        FFAppState().currencyName,
                                        () async {
                                          _model.bookTicketApi =
                                              await EventAPIGroup
                                                  .bookTicketApiCall
                                                  .call(
                                            eventId: widget.eventId,
                                            price: widget.price,
                                            totalTicket: widget.totalTicket,
                                            subtotal: widget.subTotal,
                                            tax: widget.tax,
                                            taxAmount: widget.taxAmount,
                                            totalAmount: widget.total,
                                            couponCode: widget.couponCode,
                                            couponAmount: widget.coupon,
                                            paymentMethod: 'Stripe',
                                            paymentStatus: 'Successful',
                                            transactionId:
                                                FFAppState().paypalTransationId,
                                            token: FFAppState().token,
                                          );

                                          if (EventAPIGroup.bookTicketApiCall
                                                  .success(
                                                (_model.bookTicketApi
                                                        ?.jsonBody ??
                                                    ''),
                                              ) ==
                                              1) {
                                            await actions.showCustomToastBottom(
                                              EventAPIGroup.bookTicketApiCall
                                                  .message(
                                                (_model.bookTicketApi
                                                        ?.jsonBody ??
                                                    ''),
                                              )!,
                                            );
                                            FFAppState()
                                                .clearUpComingCacheCache();
                                            await showDialog(
                                              barrierDismissible: false,
                                              context: context,
                                              builder: (dialogContext) {
                                                return Dialog(
                                                  elevation: 0,
                                                  insetPadding: EdgeInsets.zero,
                                                  backgroundColor:
                                                      Colors.transparent,
                                                  alignment:
                                                      const AlignmentDirectional(
                                                              0.0, 0.0)
                                                          .resolve(
                                                              Directionality.of(
                                                                  context)),
                                                  child: GestureDetector(
                                                    onTap: () => FocusScope.of(
                                                            dialogContext)
                                                        .unfocus(),
                                                    child:
                                                        const PaymentDialogWidget(),
                                                  ),
                                                );
                                              },
                                            );
                                          } else {
                                            await actions.showCustomToastBottom(
                                              EventAPIGroup.bookTicketApiCall
                                                  .message(
                                                (_model.bookTicketApi
                                                        ?.jsonBody ??
                                                    ''),
                                              )!,
                                            );

                                            context.goNamed('HomeMainPage');
                                          }
                                        },
                                        () async {
                                          context.goNamed('PaymentFailedPage');
                                        },
                                        EventAPIGroup.paymentGatewayApiCall
                                            .stripesecretkey(
                                          containerPaymentGatewayApiResponse
                                              .jsonBody,
                                        )!,
                                      );
                                    } else {
                                      await actions.razorpayCustom(
                                        context,
                                        EventAPIGroup.paymentGatewayApiCall
                                            .razorpaykeysecret(
                                          containerPaymentGatewayApiResponse
                                              .jsonBody,
                                        )!,
                                        widget.total!.toString(),
                                        getJsonField(
                                          FFAppState().userdetails,
                                          r'''$.name''',
                                        ).toString(),
                                        'for by a service',
                                        '+${getJsonField(
                                          FFAppState().userdetails,
                                          r'''$.country_code''',
                                        ).toString()} ${getJsonField(
                                          FFAppState().userdetails,
                                          r'''$.phone''',
                                        ).toString()}',
                                        getJsonField(
                                          FFAppState().userdetails,
                                          r'''$.email''',
                                        ).toString(),
                                        () async {
                                          context.goNamed(
                                            'PaymentSuccessPage',
                                            queryParameters: {
                                              'eventId': serializeParam(
                                                widget.eventId,
                                                ParamType.String,
                                              ),
                                              'price': serializeParam(
                                                widget.price,
                                                ParamType.double,
                                              ),
                                              'totalTicket': serializeParam(
                                                widget.totalTicket,
                                                ParamType.int,
                                              ),
                                              'subtotal': serializeParam(
                                                widget.subTotal,
                                                ParamType.double,
                                              ),
                                              'couponCode': serializeParam(
                                                widget.couponCode,
                                                ParamType.String,
                                              ),
                                              'couponAmount': serializeParam(
                                                widget.coupon,
                                                ParamType.double,
                                              ),
                                              'totalAmount': serializeParam(
                                                widget.total,
                                                ParamType.double,
                                              ),
                                              'paymentMethod': serializeParam(
                                                'Razorpay',
                                                ParamType.String,
                                              ),
                                              'tax': serializeParam(
                                                widget.tax,
                                                ParamType.double,
                                              ),
                                              'taxAmount': serializeParam(
                                                widget.taxAmount,
                                                ParamType.double,
                                              ),
                                            }.withoutNulls,
                                          );
                                        },
                                        () async {
                                          context.goNamed('PaymentFailedPage');
                                        },
                                        FFAppState().currencyName,
                                      );
                                    }
                                  }

                                  safeSetState(() {});
                                },
                                text: 'Continue',
                                options: FFButtonOptions(
                                  width: double.infinity,
                                  height: 60.0,
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      30.0, 0.0, 30.0, 0.0),
                                  iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  color: FlutterFlowTheme.of(context).primary,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .override(
                                        fontFamily: 'SF Pro Display',
                                        color: FlutterFlowTheme.of(context)
                                            .primaryBackground,
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
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
