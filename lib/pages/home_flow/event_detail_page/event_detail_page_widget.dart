// ignore_for_file: unused_local_variable

import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_google_map.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/all_empty_component/blank_componant/blank_componant_widget.dart';
import '/pages/shimmers/event_detail_shimmer/event_detail_shimmer_widget.dart';
import '/custom_code/actions/index.dart' as actions;
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'event_detail_page_model.dart';
export 'event_detail_page_model.dart';

class EventDetailPageWidget extends StatefulWidget {
  const EventDetailPageWidget({
    super.key,
    required this.eventId,
    required this.eventJson,
  });

  final String? eventId;
  final dynamic eventJson;

  @override
  State<EventDetailPageWidget> createState() => _EventDetailPageWidgetState();
}

class _EventDetailPageWidgetState extends State<EventDetailPageWidget> {
  late EventDetailPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EventDetailPageModel());
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
        resizeToAvoidBottomInset: false,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: Builder(
          builder: (context) {
            if (FFAppState().connected == true) {
              return FutureBuilder<ApiCallResponse>(
                future: (_model.apiRequestCompleter2 ??=
                        Completer<ApiCallResponse>()
                          ..complete(EventAPIGroup.eventDetailsApiCall.call(
                            eventId: widget.eventId,
                          )))
                    .future,
                builder: (context, snapshot) {
                  // Customize what your widget looks like when it's loading.
                  if (!snapshot.hasData) {
                    return const Center(
                      child: SizedBox(
                        width: double.infinity,
                        height: double.infinity,
                        child: EventDetailShimmerWidget(),
                      ),
                    );
                  }
                  final containerEventDetailsApiResponse = snapshot.data!;

                  return Container(
                    decoration: const BoxDecoration(),
                    child: FutureBuilder<ApiCallResponse>(
                      future: FFAppState()
                          .getfavAllCache(
                        requestFn: () =>
                            EventAPIGroup.getFavoriteEventAllApiCall.call(
                          token: FFAppState().token,
                        ),
                      )
                          .then((result) {
                        _model.apiRequestCompleted1 = true;
                        return result;
                      }),
                      builder: (context, snapshot) {
                        // Customize what your widget looks like when it's loading.
                        if (!snapshot.hasData) {
                          return const Center(
                            child: SizedBox(
                              width: 0.0,
                              height: 0.0,
                              child: BlankComponantWidget(),
                            ),
                          );
                        }
                        final columnGetFavoriteEventAllApiResponse =
                            snapshot.data!;

                        return Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Stack(
                              alignment: const AlignmentDirectional(0.0, -1.0),
                              children: [
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 16.0),
                                  child: Stack(
                                    alignment: const AlignmentDirectional(0.0, 1.0),
                                    children: [
                                      Container(
                                        height: 260.0,
                                        decoration: const BoxDecoration(),
                                        child: Builder(
                                          builder: (context) {
                                            final galleryImgList = EventAPIGroup
                                                    .eventDetailsApiCall
                                                    .galleryImgList(
                                                      containerEventDetailsApiResponse
                                                          .jsonBody,
                                                    )
                                                    ?.toList() ??
                                                [];

                                            return SizedBox(
                                              width: double.infinity,
                                              height: 260.0,
                                              child: PageView.builder(
                                                controller: _model
                                                        .pageViewController ??=
                                                    PageController(
                                                        initialPage: max(
                                                            0,
                                                            min(
                                                                0,
                                                                galleryImgList
                                                                        .length -
                                                                    1))),
                                                onPageChanged: (_) async {
                                                  _model.introIndex = _model
                                                      .pageViewCurrentIndex;
                                                  safeSetState(() {});
                                                },
                                                scrollDirection:
                                                    Axis.horizontal,
                                                itemCount:
                                                    galleryImgList.length,
                                                itemBuilder: (context,
                                                    galleryImgListIndex) {
                                                  final galleryImgListItem =
                                                      galleryImgList[
                                                          galleryImgListIndex];
                                                  return ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            0.0),
                                                    child: CachedNetworkImage(
                                                      fadeInDuration: const Duration(
                                                          milliseconds: 200),
                                                      fadeOutDuration: const Duration(
                                                          milliseconds: 200),
                                                      imageUrl:
                                                          '${FFAppConstants.imageUrl}$galleryImgListItem',
                                                      width: double.infinity,
                                                      height: 260.0,
                                                      fit: BoxFit.cover,
                                                      alignment:
                                                          const Alignment(0.0, -1.0),
                                                      errorWidget: (context,
                                                              error,
                                                              stackTrace) =>
                                                          Image.asset(
                                                        'assets/images/error_image.png',
                                                        width: double.infinity,
                                                        height: 260.0,
                                                        fit: BoxFit.cover,
                                                        alignment: const Alignment(
                                                            0.0, -1.0),
                                                      ),
                                                    ),
                                                  );
                                                },
                                              ),
                                            );
                                          },
                                        ),
                                      ),
                                      if (EventAPIGroup.eventDetailsApiCall
                                              .galleryImgList(
                                                containerEventDetailsApiResponse
                                                    .jsonBody,
                                              )
                                              ?.length !=
                                          1)
                                        Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 16.0),
                                          child: Container(
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              borderRadius:
                                                  BorderRadius.circular(16.0),
                                            ),
                                            child: Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(8.0, 4.0, 8.0, 4.0),
                                              child: Builder(
                                                builder: (context) {
                                                  final introList = EventAPIGroup
                                                          .eventDetailsApiCall
                                                          .galleryImgList(
                                                            containerEventDetailsApiResponse
                                                                .jsonBody,
                                                          )
                                                          ?.toList() ??
                                                      [];

                                                  return Row(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: List.generate(
                                                        introList.length,
                                                        (introListIndex) {
                                                      final introListItem =
                                                          introList[
                                                              introListIndex];
                                                      return Container(
                                                        width: 8.0,
                                                        height: 8.0,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: _model
                                                                      .introIndex ==
                                                                  introListIndex
                                                              ? FlutterFlowTheme
                                                                      .of(
                                                                          context)
                                                                  .primaryBackground
                                                              : const Color(
                                                                  0x4DFFFFFF),
                                                          shape:
                                                              BoxShape.circle,
                                                        ),
                                                      );
                                                    }).divide(
                                                        const SizedBox(width: 4.0)),
                                                  );
                                                },
                                              ),
                                            ),
                                          ),
                                        ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      20.0, 59.0, 20.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          context.safePop();
                                        },
                                        child: Container(
                                          width: 44.0,
                                          height: 44.0,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                            shape: BoxShape.circle,
                                          ),
                                          alignment:
                                              const AlignmentDirectional(0.0, 0.0),
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(0.0),
                                            child: SvgPicture.asset(
                                              'assets/images/arrow_left.svg',
                                              width: 24.0,
                                              height: 24.0,
                                              fit: BoxFit.contain,
                                            ),
                                          ),
                                        ),
                                      ),
                                      InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          if (FFAppState().isLogin == true) {
                                            _model.isProcess = true;
                                            safeSetState(() {});
                                            if (functions.checkFavOrNot(
                                                    EventAPIGroup
                                                        .getFavoriteEventAllApiCall
                                                        .eventList(
                                                          columnGetFavoriteEventAllApiResponse
                                                              .jsonBody,
                                                        )
                                                        ?.toList(),
                                                    widget.eventId) ==
                                                true) {
                                              _model.detailDeleteFav =
                                                  await EventAPIGroup
                                                      .unFavoriteEventApiCall
                                                      .call(
                                                eventId: widget.eventId,
                                                token: FFAppState().token,
                                              );

                                              safeSetState(() {
                                                FFAppState()
                                                    .clearGetfavAllCacheCache();
                                                _model.apiRequestCompleted1 =
                                                    false;
                                              });
                                              await _model
                                                  .waitForApiRequestCompleted1();
                                              await actions
                                                  .showCustomToastBottom(
                                                FFAppState().unfavText,
                                              );
                                            } else {
                                              _model.detailAddfav =
                                                  await EventAPIGroup
                                                      .favoriteEventApiCall
                                                      .call(
                                                eventId: widget.eventId,
                                                token: FFAppState().token,
                                              );

                                              safeSetState(() {
                                                FFAppState()
                                                    .clearGetfavAllCacheCache();
                                                _model.apiRequestCompleted1 =
                                                    false;
                                              });
                                              await _model
                                                  .waitForApiRequestCompleted1();
                                              await actions
                                                  .showCustomToastBottom(
                                                FFAppState().favText,
                                              );
                                            }

                                            FFAppState()
                                                .clearGetfavAllCacheCache();
                                            _model.isProcess = false;
                                            safeSetState(() {});
                                          } else {
                                            FFAppState().favChange = true;
                                            FFAppState().eventId =
                                                widget.eventId!;
                                            FFAppState().update(() {});

                                            context.pushNamed('SignInPage');
                                          }

                                          safeSetState(() {});
                                        },
                                        child: Container(
                                          width: 44.0,
                                          height: 44.0,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                            shape: BoxShape.circle,
                                          ),
                                          alignment:
                                              const AlignmentDirectional(0.0, 0.0),
                                          child: Builder(
                                            builder: (context) {
                                              if (!_model.isProcess) {
                                                return Builder(
                                                  builder: (context) {
                                                    if (functions.checkFavOrNot(
                                                            EventAPIGroup
                                                                .getFavoriteEventAllApiCall
                                                                .eventList(
                                                                  columnGetFavoriteEventAllApiResponse
                                                                      .jsonBody,
                                                                )
                                                                ?.toList(),
                                                            widget.eventId) ==
                                                        true) {
                                                      return ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(0.0),
                                                        child: SvgPicture.asset(
                                                          'assets/images/heart_fill.svg',
                                                          width: 24.0,
                                                          height: 24.0,
                                                          fit: BoxFit.cover,
                                                        ),
                                                      );
                                                    } else {
                                                      return ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(0.0),
                                                        child: SvgPicture.asset(
                                                          'assets/images/heart.svg',
                                                          width: 24.0,
                                                          height: 24.0,
                                                          fit: BoxFit.cover,
                                                        ),
                                                      );
                                                    }
                                                  },
                                                );
                                              } else {
                                                return const custom_widgets
                                                    .CirculatIndicator(
                                                  width: 24.0,
                                                  height: 24.0,
                                                );
                                              }
                                            },
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Expanded(
                              child: RefreshIndicator(
                                key: const Key('RefreshIndicator_6gd63nfo'),
                                color: FlutterFlowTheme.of(context).primary,
                                onRefresh: () async {
                                  safeSetState(
                                      () => _model.apiRequestCompleter2 = null);
                                  await _model.waitForApiRequestCompleted2();
                                },
                                child: ListView(
                                  padding: const EdgeInsets.fromLTRB(
                                    0,
                                    0,
                                    0,
                                    20.0,
                                  ),
                                  scrollDirection: Axis.vertical,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          20.0, 20.0, 20.0, 0.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          if (getJsonField(
                                                widget.eventJson,
                                                r'''$.event''',
                                              ) !=
                                              null)
                                            Expanded(
                                              child: Text(
                                                getJsonField(
                                                  widget.eventJson,
                                                  r'''$.event''',
                                                ).toString(),
                                                textAlign: TextAlign.start,
                                                maxLines: 2,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'SF Pro Display',
                                                          fontSize: 22.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          useGoogleFonts: false,
                                                          lineHeight: 1.5,
                                                        ),
                                              ),
                                            ),
                                          if (getJsonField(
                                                widget.eventJson,
                                                r'''$.categoryId.category''',
                                              ) !=
                                              null)
                                            Container(
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .cultured,
                                                borderRadius:
                                                    BorderRadius.circular(9.0),
                                              ),
                                              alignment: const AlignmentDirectional(
                                                  0.0, 0.0),
                                              child: Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        10.0, 4.0, 10.0, 4.0),
                                                child: Text(
                                                  getJsonField(
                                                    widget.eventJson,
                                                    r'''$.categoryId.category''',
                                                  ).toString(),
                                                  textAlign: TextAlign.center,
                                                  maxLines: 1,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'SF Pro Display',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                        fontSize: 16.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        useGoogleFonts: false,
                                                        lineHeight: 1.2,
                                                      ),
                                                ),
                                              ),
                                            ),
                                        ].divide(const SizedBox(width: 6.0)),
                                      ),
                                    ),
                                    if ('${getJsonField(
                                              widget.eventJson,
                                              r'''$.date''',
                                            ).toString()} , ${getJsonField(
                                              widget.eventJson,
                                              r'''$.time''',
                                            ).toString()}' !=
                                            '')
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            20.0, 10.0, 20.0, 0.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(0.0),
                                              child: SvgPicture.asset(
                                                'assets/images/calender.svg',
                                                width: 20.0,
                                                height: 20.0,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                            Expanded(
                                              child: Text(
                                                '${getJsonField(
                                                  widget.eventJson,
                                                  r'''$.date''',
                                                ).toString()} , ${getJsonField(
                                                  widget.eventJson,
                                                  r'''$.time''',
                                                ).toString()}',
                                                textAlign: TextAlign.start,
                                                maxLines: 1,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'SF Pro Display',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .battleshipGrey,
                                                          fontSize: 15.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                          useGoogleFonts: false,
                                                          lineHeight: 1.5,
                                                        ),
                                              ),
                                            ),
                                          ].divide(const SizedBox(width: 5.0)),
                                        ),
                                      ),
                                    if (getJsonField(
                                          widget.eventJson,
                                          r'''$.address''',
                                        ) !=
                                        null)
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            20.0, 6.0, 20.0, 0.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(0.0),
                                              child: SvgPicture.asset(
                                                'assets/images/location_grey.svg',
                                                width: 20.0,
                                                height: 20.0,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                            Expanded(
                                              child: Text(
                                                getJsonField(
                                                  widget.eventJson,
                                                  r'''$.address''',
                                                ).toString(),
                                                textAlign: TextAlign.start,
                                                maxLines: 1,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'SF Pro Display',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .battleshipGrey,
                                                          fontSize: 15.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                          useGoogleFonts: false,
                                                          lineHeight: 1.5,
                                                        ),
                                              ),
                                            ),
                                          ].divide(const SizedBox(width: 5.0)),
                                        ),
                                      ),
                                    SizedBox(
                                      height: 200.0,
                                      child: Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            20.0, 16.0, 20.0, 0.0),
                                        child: Builder(builder: (context) {
                                          final googleMapMarker =
                                              functions.convertLocationBoth(
                                                  getJsonField(
                                                    widget.eventJson,
                                                    r'''$.location.latitude''',
                                                  ),
                                                  getJsonField(
                                                    widget.eventJson,
                                                    r'''$.location.longitude''',
                                                  ));
                                          return FlutterFlowGoogleMap(
                                            controller:
                                                _model.googleMapsController,
                                            onCameraIdle: (latLng) => _model
                                                .googleMapsCenter = latLng,
                                            initialLocation: _model
                                                    .googleMapsCenter ??=
                                                functions.convertLocationBoth(
                                                    EventAPIGroup
                                                        .eventDetailsApiCall
                                                        .latitude(
                                                      containerEventDetailsApiResponse
                                                          .jsonBody,
                                                    ),
                                                    EventAPIGroup
                                                        .eventDetailsApiCall
                                                        .longitude(
                                                      containerEventDetailsApiResponse
                                                          .jsonBody,
                                                    ))!,
                                            markers: [
                                              if (googleMapMarker != null)
                                                FlutterFlowMarker(
                                                  googleMapMarker.serialize(),
                                                  googleMapMarker,
                                                ),
                                            ],
                                            markerColor: GoogleMarkerColor.red,
                                            mapType: MapType.normal,
                                            style: GoogleMapStyle.standard,
                                            initialZoom: 14.0,
                                            allowInteraction: true,
                                            allowZoom: true,
                                            showZoomControls: true,
                                            showLocation: true,
                                            showCompass: false,
                                            showMapToolbar: false,
                                            showTraffic: false,
                                            centerMapOnMarkerTap: true,
                                          );
                                        }),
                                      ),
                                    ),
                                    if (getJsonField(
                                          widget.eventJson,
                                          r'''$.description''',
                                        ) !=
                                        null)
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            20.0, 16.0, 0.0, 8.0),
                                        child: Text(
                                          'Description',
                                          textAlign: TextAlign.start,
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
                                      ),
                                    if (EventAPIGroup.eventDetailsApiCall
                                                .description(
                                              containerEventDetailsApiResponse
                                                  .jsonBody,
                                            ) !=
                                            null &&
                                        EventAPIGroup.eventDetailsApiCall
                                                .description(
                                              containerEventDetailsApiResponse
                                                  .jsonBody,
                                            ) !=
                                            '')
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            20.0, 0.0, 20.0, 0.0),
                                        child: custom_widgets.ReadMoreHtml(
                                          width: double.infinity,
                                          height: 70.0,
                                          htmlContent: getJsonField(
                                            widget.eventJson,
                                            r'''$.description''',
                                          ).toString(),
                                          maxLength: 110,
                                        ),
                                      ),
                                    if (valueOrDefault<String>(
                                              EventAPIGroup.eventDetailsApiCall
                                                  .lastdate(
                                                containerEventDetailsApiResponse
                                                    .jsonBody,
                                              ),
                                              'LastDate',
                                            ) !=
                                            '')
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            20.0, 16.0, 20.0, 16.0),
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondary,
                                            borderRadius:
                                                BorderRadius.circular(22.0),
                                          ),
                                          child: Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    16.0, 20.0, 16.0, 20.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  'Booking Last Date',
                                                  textAlign: TextAlign.start,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'SF Pro Display',
                                                        fontSize: 15.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                        useGoogleFonts: false,
                                                        lineHeight: 1.5,
                                                      ),
                                                ),
                                                Expanded(
                                                  child: Text(
                                                    valueOrDefault<String>(
                                                      EventAPIGroup
                                                          .eventDetailsApiCall
                                                          .lastdate(
                                                        containerEventDetailsApiResponse
                                                            .jsonBody,
                                                      ),
                                                      'LastDate',
                                                    ),
                                                    textAlign: TextAlign.end,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'SF Pro Display',
                                                          fontSize: 15.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          useGoogleFonts: false,
                                                          lineHeight: 1.5,
                                                        ),
                                                  ),
                                                ),
                                              ].divide(const SizedBox(width: 12.0)),
                                            ),
                                          ),
                                        ),
                                      ),
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          20.0, 0.0, 20.0, 0.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Expanded(
                                            child: Container(
                                              decoration: BoxDecoration(
                                                color: FlutterFlowTheme.of(
                                                        context)
                                                    .secondary,
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        22.0),
                                              ),
                                              child: Padding(
                                                padding: const EdgeInsets.all(20.0),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment
                                                          .start,
                                                  children: [
                                                    Text(
                                                      'Ticket Price',
                                                      textAlign:
                                                          TextAlign.start,
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'SF Pro Display',
                                                            fontSize: 15.0,
                                                            letterSpacing:
                                                                0.0,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w600,
                                                            useGoogleFonts:
                                                                false,
                                                            lineHeight: 1.5,
                                                          ),
                                                    ),
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      0.0,
                                                                      0.0,
                                                                      4.0),
                                                          child: custom_widgets
                                                              .GetCurrencySimbool(
                                                            width: 10.0,
                                                            height: 20.0,
                                                            isSimbool:
                                                                FFAppState()
                                                                    .currencyName,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryText,
                                                            fontSize: 18.0,
                                                          ),
                                                        ),
                                                        Text(
                                                          valueOrDefault<
                                                              String>(
                                                            EventAPIGroup
                                                                .eventDetailsApiCall
                                                                .price(
                                                                  containerEventDetailsApiResponse
                                                                      .jsonBody,
                                                                )
                                                                ?.toString(),
                                                            '1',
                                                          ),
                                                          textAlign:
                                                              TextAlign.start,
                                                          maxLines: 1,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'SF Pro Display',
                                                                fontSize:
                                                                    20.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                useGoogleFonts:
                                                                    false,
                                                                lineHeight:
                                                                    1.2,
                                                              ),
                                                        ),
                                                      ].divide(const SizedBox(
                                                          width: 1.0)),
                                                    ),
                                                  ].divide(
                                                      const SizedBox(height: 8.0)),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            child: Container(
                                              decoration: BoxDecoration(
                                                color: FlutterFlowTheme.of(
                                                        context)
                                                    .secondary,
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        22.0),
                                              ),
                                              child: Padding(
                                                padding: const EdgeInsets.all(20.0),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment
                                                          .start,
                                                  children: [
                                                    Text(
                                                      'Total Seat',
                                                      textAlign:
                                                          TextAlign.start,
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'SF Pro Display',
                                                            fontSize: 15.0,
                                                            letterSpacing:
                                                                0.0,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w600,
                                                            useGoogleFonts:
                                                                false,
                                                            lineHeight: 1.5,
                                                          ),
                                                    ),
                                                    Text(
                                                      valueOrDefault<String>(
                                                        EventAPIGroup
                                                            .eventDetailsApiCall
                                                            .totalSeat(
                                                              containerEventDetailsApiResponse
                                                                  .jsonBody,
                                                            )
                                                            ?.toString(),
                                                        '1',
                                                      ),
                                                      textAlign:
                                                          TextAlign.start,
                                                      maxLines: 1,
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'SF Pro Display',
                                                            fontSize: 20.0,
                                                            letterSpacing:
                                                                0.0,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold,
                                                            useGoogleFonts:
                                                                false,
                                                            lineHeight: 1.2,
                                                          ),
                                                    ),
                                                  ].divide(
                                                      const SizedBox(height: 8.0)),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ].divide(const SizedBox(width: 20.0)),
                                      ),
                                    ),
                                    Builder(
                                      builder: (context) {
                                        final organizerList =
                                            EventAPIGroup.eventDetailsApiCall
                                                    .organizerIdList(
                                                      containerEventDetailsApiResponse
                                                          .jsonBody,
                                                    )
                                                    ?.toList() ??
                                                [];

                                        return ListView.separated(
                                          padding: const EdgeInsets.fromLTRB(
                                            0,
                                            16.0,
                                            0,
                                            16.0,
                                          ),
                                          primary: false,
                                          shrinkWrap: true,
                                          scrollDirection: Axis.vertical,
                                          itemCount: organizerList.length,
                                          separatorBuilder: (_, __) =>
                                              const SizedBox(height: 16.0),
                                          itemBuilder:
                                              (context, organizerListIndex) {
                                            final organizerListItem =
                                                organizerList[
                                                    organizerListIndex];
                                            return Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      16.0, 0.0, 16.0, 0.0),
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondary,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          12.0),
                                                ),
                                                child: Padding(
                                                  padding: const EdgeInsets.all(12.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(12.0),
                                                        child:
                                                            CachedNetworkImage(
                                                          fadeInDuration:
                                                              const Duration(
                                                                  milliseconds:
                                                                      200),
                                                          fadeOutDuration:
                                                              const Duration(
                                                                  milliseconds:
                                                                      200),
                                                          imageUrl:
                                                              '${FFAppConstants.imageUrl}${getJsonField(
                                                            organizerListItem,
                                                            r'''$.avatar''',
                                                          ).toString()}',
                                                          width: 69.0,
                                                          height: 69.0,
                                                          fit: BoxFit.cover,
                                                          errorWidget: (context,
                                                                  error,
                                                                  stackTrace) =>
                                                              Image.asset(
                                                            'assets/images/error_image.png',
                                                            width: 69.0,
                                                            height: 69.0,
                                                            fit: BoxFit.cover,
                                                          ),
                                                        ),
                                                      ),
                                                      Expanded(
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      4.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              if (getJsonField(
                                                                    organizerListItem,
                                                                    r'''$.organizer''',
                                                                  ) !=
                                                                  null)
                                                                Text(
                                                                  getJsonField(
                                                                    organizerListItem,
                                                                    r'''$.organizer''',
                                                                  ).toString(),
                                                                  textAlign:
                                                                      TextAlign
                                                                          .start,
                                                                  maxLines: 1,
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'SF Pro Display',
                                                                        fontSize:
                                                                            18.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight:
                                                                            FontWeight.w600,
                                                                        useGoogleFonts:
                                                                            false,
                                                                        lineHeight:
                                                                            1.5,
                                                                      ),
                                                                ),
                                                              Text(
                                                                'Organizer',
                                                                textAlign:
                                                                    TextAlign
                                                                        .start,
                                                                maxLines: 1,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'SF Pro Display',
                                                                      fontSize:
                                                                          15.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .normal,
                                                                      useGoogleFonts:
                                                                          false,
                                                                      lineHeight:
                                                                          1.5,
                                                                    ),
                                                              ),
                                                            ].divide(const SizedBox(
                                                                height: 8.0)),
                                                          ),
                                                        ),
                                                      ),
                                                      ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(0.0),
                                                        child: SvgPicture.asset(
                                                          'assets/images/info.svg',
                                                          width: 24.0,
                                                          height: 24.0,
                                                          fit: BoxFit.contain,
                                                        ),
                                                      ),
                                                    ].divide(
                                                        const SizedBox(width: 8.0)),
                                                  ),
                                                ),
                                              ),
                                            );
                                          },
                                        );
                                      },
                                    ),
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          20.0, 0.0, 0.0, 0.0),
                                      child: Text(
                                        'Sponsors',
                                        maxLines: 1,
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'SF Pro Display',
                                              fontSize: 18.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w600,
                                              useGoogleFonts: false,
                                              lineHeight: 1.5,
                                            ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          0.0, 8.0, 0.0, 8.0),
                                      child: Builder(
                                        builder: (context) {
                                          final sponserList =
                                              EventAPIGroup.eventDetailsApiCall
                                                      .sponsorIdList(
                                                        containerEventDetailsApiResponse
                                                            .jsonBody,
                                                      )
                                                      ?.toList() ??
                                                  [];

                                          return SingleChildScrollView(
                                            scrollDirection: Axis.horizontal,
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: List.generate(
                                                      sponserList.length,
                                                      (sponserListIndex) {
                                                final sponserListItem =
                                                    sponserList[
                                                        sponserListIndex];
                                                return Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              12.0),
                                                      child: CachedNetworkImage(
                                                        fadeInDuration:
                                                            const Duration(
                                                                milliseconds:
                                                                    200),
                                                        fadeOutDuration:
                                                            const Duration(
                                                                milliseconds:
                                                                    200),
                                                        imageUrl:
                                                            '${FFAppConstants.imageUrl}${getJsonField(
                                                          sponserListItem,
                                                          r'''$.avatar''',
                                                        ).toString()}',
                                                        width: 90.0,
                                                        height: 84.0,
                                                        fit: BoxFit.cover,
                                                        errorWidget: (context,
                                                                error,
                                                                stackTrace) =>
                                                            Image.asset(
                                                          'assets/images/error_image.png',
                                                          width: 90.0,
                                                          height: 84.0,
                                                          fit: BoxFit.cover,
                                                        ),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  8.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: Text(
                                                        getJsonField(
                                                          sponserListItem,
                                                          r'''$.sponsor''',
                                                        ).toString(),
                                                        textAlign:
                                                            TextAlign.center,
                                                        maxLines: 1,
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .bodyMedium
                                                            .override(
                                                              fontFamily:
                                                                  'SF Pro Display',
                                                              fontSize: 16.0,
                                                              letterSpacing:
                                                                  0.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .normal,
                                                              useGoogleFonts:
                                                                  false,
                                                              lineHeight: 1.5,
                                                            ),
                                                      ),
                                                    ),
                                                  ],
                                                );
                                              })
                                                  .divide(const SizedBox(width: 16.0))
                                                  .addToStart(
                                                      const SizedBox(width: 20.0))
                                                  .addToEnd(
                                                      const SizedBox(width: 20.0)),
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  20.0, 12.0, 20.0, 58.0),
                              child: FFButtonWidget(
                                onPressed: () async {
                                  if (FFAppState().isLogin == true) {
                                    if (EventAPIGroup.eventDetailsApiCall
                                            .availableticket(
                                          containerEventDetailsApiResponse
                                              .jsonBody,
                                        )! >
                                        0) {
                                      if (functions.isDateValid(EventAPIGroup
                                          .eventDetailsApiCall
                                          .lastdate(
                                        containerEventDetailsApiResponse
                                            .jsonBody,
                                      )!)) {
                                        context.pushNamed(
                                          'BuyTicketPage',
                                          queryParameters: {
                                            'eventName': serializeParam(
                                              EventAPIGroup.eventDetailsApiCall
                                                  .event(
                                                containerEventDetailsApiResponse
                                                    .jsonBody,
                                              ),
                                              ParamType.String,
                                            ),
                                            'price': serializeParam(
                                              EventAPIGroup.eventDetailsApiCall
                                                  .price(
                                                    containerEventDetailsApiResponse
                                                        .jsonBody,
                                                  )
                                                  ?.toDouble(),
                                              ParamType.double,
                                            ),
                                            'availableticket': serializeParam(
                                              EventAPIGroup.eventDetailsApiCall
                                                  .availableticket(
                                                containerEventDetailsApiResponse
                                                    .jsonBody,
                                              ),
                                              ParamType.int,
                                            ),
                                            'totalBookedTickets':
                                                serializeParam(
                                              EventAPIGroup.eventDetailsApiCall
                                                  .totalBookedTicket(
                                                    containerEventDetailsApiResponse
                                                        .jsonBody,
                                                  )
                                                  ?.toDouble(),
                                              ParamType.double,
                                            ),
                                            'eventId': serializeParam(
                                              widget.eventId,
                                              ParamType.String,
                                            ),
                                            'tax': serializeParam(
                                              EventAPIGroup.eventDetailsApiCall
                                                  .tax(
                                                    containerEventDetailsApiResponse
                                                        .jsonBody,
                                                  )
                                                  ?.toDouble(),
                                              ParamType.double,
                                            ),
                                          }.withoutNulls,
                                        );

                                        FFAppState().couponJson = null;
                                        FFAppState().update(() {});
                                      } else {
                                        await actions.showCustomToastBottom(
                                          'Booking Date Expire',
                                        );
                                      }
                                    } else {
                                      await actions.showCustomToastBottom(
                                        'No Ticket Available',
                                      );
                                    }
                                  } else {
                                    context.pushNamed('SignInPage');
                                  }
                                },
                                text: 'Buy Ticket',
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
                          ],
                        );
                      },
                    ),
                  );
                },
              );
            } else {
              return Align(
                alignment: const AlignmentDirectional(0.0, 0.0),
                child: Lottie.asset(
                  'assets/jsons/No_Wifi.json',
                  width: 150.0,
                  height: 150.0,
                  fit: BoxFit.contain,
                  animate: true,
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
