import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/componants/center_appbar/center_appbar_widget.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'profile_componant_model.dart';
export 'profile_componant_model.dart';

class ProfileComponantWidget extends StatefulWidget {
  const ProfileComponantWidget({super.key});

  @override
  State<ProfileComponantWidget> createState() => _ProfileComponantWidgetState();
}

class _ProfileComponantWidgetState extends State<ProfileComponantWidget> {
  late ProfileComponantModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ProfileComponantModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        wrapWithModel(
          model: _model.centerAppbarModel,
          updateCallback: () => safeSetState(() {}),
          child: const CenterAppbarWidget(
            title: 'Profile',
          ),
        ),
        Builder(
          builder: (context) {
            if (FFAppState().isLogin == true) {
              return Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  if (FFAppState().isLogin == true)
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(20.0, 20.0, 20.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Container(
                            width: 88.0,
                            height: 88.0,
                            clipBehavior: Clip.antiAlias,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                            ),
                            child: CachedNetworkImage(
                              fadeInDuration: const Duration(milliseconds: 200),
                              fadeOutDuration: const Duration(milliseconds: 200),
                              imageUrl:
                                  '${FFAppConstants.imageUrl}${getJsonField(
                                FFAppState().userdetails,
                                r'''$.avatar''',
                              ).toString()}',
                              fit: BoxFit.cover,
                              errorWidget: (context, error, stackTrace) =>
                                  Image.asset(
                                'assets/images/error_image.png',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  getJsonField(
                                    FFAppState().userdetails,
                                    r'''$.name''',
                                  ).toString(),
                                  textAlign: TextAlign.start,
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
                                Text(
                                  getJsonField(
                                    FFAppState().userdetails,
                                    r'''$.email''',
                                  ).toString(),
                                  textAlign: TextAlign.start,
                                  maxLines: 1,
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'SF Pro Display',
                                        fontSize: 16.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.normal,
                                        useGoogleFonts: false,
                                        lineHeight: 1.5,
                                      ),
                                ),
                              ].divide(const SizedBox(height: 4.0)),
                            ),
                          ),
                        ].divide(const SizedBox(width: 16.0)),
                      ),
                    ),
                  if ((FFAppState().isLogin == true) &&
                      (getJsonField(
                            FFAppState().userdetails,
                            r'''$.interestCategoryId''',
                          ) !=
                          null))
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(20.0, 16.0, 20.0, 8.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          boxShadow: const [
                            BoxShadow(
                              blurRadius: 27.0,
                              color: Color(0x2690B6B8),
                              offset: Offset(
                                0.0,
                                8.0,
                              ),
                            )
                          ],
                          borderRadius: BorderRadius.circular(22.0),
                        ),
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 16.0, 0.0, 16.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    16.0, 0.0, 16.0, 0.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: Text(
                                        'Interests',
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
                                    ),
                                    InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        context.pushNamed(
                                          'InterestsPage',
                                          queryParameters: {
                                            'name': serializeParam(
                                              'Edit Interests',
                                              ParamType.String,
                                            ),
                                          }.withoutNulls,
                                        );
                                      },
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(0.0),
                                        child: SvgPicture.asset(
                                          'assets/images/edit.svg',
                                          width: 24.0,
                                          height: 24.0,
                                          fit: BoxFit.contain,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Builder(
                                builder: (context) {
                                  final interestCategoryIdList = getJsonField(
                                    FFAppState().userdetails,
                                    r'''$.interestCategoryId''',
                                  ).toList().take(4).toList();

                                  return SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: List.generate(
                                              interestCategoryIdList.length,
                                              (interestCategoryIdListIndex) {
                                        final interestCategoryIdListItem =
                                            interestCategoryIdList[
                                                interestCategoryIdListIndex];
                                        return Container(
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                            borderRadius:
                                                BorderRadius.circular(27.0),
                                            border: Border.all(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                            ),
                                          ),
                                          child: Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    18.0, 8.0, 18.0, 8.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          0.0),
                                                  child: CachedNetworkImage(
                                                    fadeInDuration: const Duration(
                                                        milliseconds: 200),
                                                    fadeOutDuration: const Duration(
                                                        milliseconds: 200),
                                                    imageUrl:
                                                        '${FFAppConstants.imageUrl}${getJsonField(
                                                      interestCategoryIdListItem,
                                                      r'''$.avatar''',
                                                    ).toString()}',
                                                    width: 24.0,
                                                    height: 24.0,
                                                    fit: BoxFit.contain,
                                                    errorWidget: (context,
                                                            error,
                                                            stackTrace) =>
                                                        Image.asset(
                                                      'assets/images/error_image.png',
                                                      width: 24.0,
                                                      height: 24.0,
                                                      fit: BoxFit.contain,
                                                    ),
                                                  ),
                                                ),
                                                Text(
                                                  getJsonField(
                                                    interestCategoryIdListItem,
                                                    r'''$.category''',
                                                  ).toString(),
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
                                                            FontWeight.w600,
                                                        useGoogleFonts: false,
                                                        lineHeight: 1.5,
                                                      ),
                                                ),
                                              ].divide(const SizedBox(width: 10.0)),
                                            ),
                                          ),
                                        );
                                      })
                                          .divide(const SizedBox(width: 11.0))
                                          .addToStart(const SizedBox(width: 16.0))
                                          .addToEnd(const SizedBox(width: 16.0)),
                                    ),
                                  );
                                },
                              ),
                            ].divide(const SizedBox(height: 16.0)),
                          ),
                        ),
                      ),
                    ),
                ],
              );
            } else {
              return Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(20.0, 20.0, 20.0, 8.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(0.0),
                      child: Image.asset(
                        'assets/images/dummy_profile.png',
                        width: 88.0,
                        height: 88.0,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Guest profile',
                            textAlign: TextAlign.start,
                            maxLines: 1,
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'SF Pro Display',
                                  color: FlutterFlowTheme.of(context)
                                      .battleshipGrey,
                                  fontSize: 16.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.normal,
                                  useGoogleFonts: false,
                                  lineHeight: 1.5,
                                ),
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  context.pushNamed('SignInPage');
                                },
                                child: Text(
                                  'Sign up   |   Log in',
                                  textAlign: TextAlign.start,
                                  maxLines: 1,
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'SF Pro Display',
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        fontSize: 15.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w600,
                                        useGoogleFonts: false,
                                        lineHeight: 1.5,
                                      ),
                                ),
                              ),
                            ].divide(const SizedBox(width: 10.0)),
                          ),
                        ].divide(const SizedBox(height: 4.0)),
                      ),
                    ),
                  ].divide(const SizedBox(width: 24.0)),
                ),
              );
            }
          },
        ),
        Expanded(
          child: ListView(
            padding: const EdgeInsets.fromLTRB(
              0,
              12.0,
              0,
              20.0,
            ),
            scrollDirection: Axis.vertical,
            children: [
              if (FFAppState().isLogin == true)
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
                  child: InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      context.pushNamed('EditProfilePage');
                      FFAppState().countryCodeEdit = (String var1) {
                        return var1.replaceAll('+', '');
                      }(getJsonField(
                        FFAppState().userdetails,
                        r'''$.country_code''',
                      ).toString());
                      FFAppState().phone = getJsonField(
                        FFAppState().userdetails,
                        r'''$.phone''',
                      ).toString();
                      FFAppState().update(() {});
                    },
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        boxShadow: const [
                          BoxShadow(
                            blurRadius: 27.0,
                            color: Color(0x2690B6B8),
                            offset: Offset(
                              0.0,
                              8.0,
                            ),
                          )
                        ],
                        borderRadius: BorderRadius.circular(22.0),
                      ),
                      child: Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(3.0, 3.0, 18.0, 3.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: 54.0,
                              height: 54.0,
                              decoration: BoxDecoration(
                                color: const Color(0xFFF1F5F5),
                                borderRadius: BorderRadius.circular(22.0),
                                shape: BoxShape.rectangle,
                              ),
                              alignment: const AlignmentDirectional(0.0, 0.0),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(0.0),
                                child: SvgPicture.asset(
                                  'assets/images/edit_profile.svg',
                                  width: 24.0,
                                  height: 24.0,
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                            Expanded(
                              child: Text(
                                'Edit Profile',
                                maxLines: 1,
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'SF Pro Display',
                                      fontSize: 16.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.normal,
                                      useGoogleFonts: false,
                                      lineHeight: 1.5,
                                    ),
                              ),
                            ),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(0.0),
                              child: SvgPicture.asset(
                                'assets/images/arrow_right.svg',
                                width: 24.0,
                                height: 24.0,
                                fit: BoxFit.contain,
                              ),
                            ),
                          ].divide(const SizedBox(width: 16.0)),
                        ),
                      ),
                    ),
                  ),
                ),
              if (FFAppState().isLogin == true)
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
                  child: InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      context.pushNamed('ChangePasswordPage');
                    },
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        boxShadow: const [
                          BoxShadow(
                            blurRadius: 27.0,
                            color: Color(0x2690B6B8),
                            offset: Offset(
                              0.0,
                              8.0,
                            ),
                          )
                        ],
                        borderRadius: BorderRadius.circular(22.0),
                      ),
                      child: Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(3.0, 3.0, 18.0, 3.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: 54.0,
                              height: 54.0,
                              decoration: BoxDecoration(
                                color: const Color(0xFFF1F5F5),
                                borderRadius: BorderRadius.circular(22.0),
                                shape: BoxShape.rectangle,
                              ),
                              alignment: const AlignmentDirectional(0.0, 0.0),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(0.0),
                                child: SvgPicture.asset(
                                  'assets/images/change_password.svg',
                                  width: 24.0,
                                  height: 24.0,
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                            Expanded(
                              child: Text(
                                'Change Password',
                                maxLines: 1,
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'SF Pro Display',
                                      fontSize: 16.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.normal,
                                      useGoogleFonts: false,
                                      lineHeight: 1.5,
                                    ),
                              ),
                            ),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(0.0),
                              child: SvgPicture.asset(
                                'assets/images/arrow_right.svg',
                                width: 24.0,
                                height: 24.0,
                                fit: BoxFit.contain,
                              ),
                            ),
                          ].divide(const SizedBox(width: 16.0)),
                        ),
                      ),
                    ),
                  ),
                ),
              if (FFAppState().isLogin == true)
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
                  child: InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      context.pushNamed('ProfilePaymentPage');
                    },
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        boxShadow: const [
                          BoxShadow(
                            blurRadius: 27.0,
                            color: Color(0x2690B6B8),
                            offset: Offset(
                              0.0,
                              8.0,
                            ),
                          )
                        ],
                        borderRadius: BorderRadius.circular(22.0),
                      ),
                      child: Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(3.0, 3.0, 18.0, 3.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: 54.0,
                              height: 54.0,
                              decoration: BoxDecoration(
                                color: const Color(0xFFF1F5F5),
                                borderRadius: BorderRadius.circular(22.0),
                                shape: BoxShape.rectangle,
                              ),
                              alignment: const AlignmentDirectional(0.0, 0.0),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(0.0),
                                child: SvgPicture.asset(
                                  'assets/images/card.svg',
                                  width: 24.0,
                                  height: 24.0,
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                            Expanded(
                              child: Text(
                                'Payment Method',
                                maxLines: 1,
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'SF Pro Display',
                                      fontSize: 16.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.normal,
                                      useGoogleFonts: false,
                                      lineHeight: 1.5,
                                    ),
                              ),
                            ),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(0.0),
                              child: SvgPicture.asset(
                                'assets/images/arrow_right.svg',
                                width: 24.0,
                                height: 24.0,
                                fit: BoxFit.contain,
                              ),
                            ),
                          ].divide(const SizedBox(width: 16.0)),
                        ),
                      ),
                    ),
                  ),
                ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
                child: InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    context.pushNamed('SettingsPage');
                  },
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                      boxShadow: const [
                        BoxShadow(
                          blurRadius: 27.0,
                          color: Color(0x2690B6B8),
                          offset: Offset(
                            0.0,
                            8.0,
                          ),
                        )
                      ],
                      borderRadius: BorderRadius.circular(22.0),
                    ),
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(3.0, 3.0, 18.0, 3.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: 54.0,
                            height: 54.0,
                            decoration: BoxDecoration(
                              color: const Color(0xFFF1F5F5),
                              borderRadius: BorderRadius.circular(22.0),
                              shape: BoxShape.rectangle,
                            ),
                            alignment: const AlignmentDirectional(0.0, 0.0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(0.0),
                              child: SvgPicture.asset(
                                'assets/images/setting.svg',
                                width: 24.0,
                                height: 24.0,
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Text(
                              'Settings',
                              maxLines: 1,
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'SF Pro Display',
                                    fontSize: 16.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.normal,
                                    useGoogleFonts: false,
                                    lineHeight: 1.5,
                                  ),
                            ),
                          ),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(0.0),
                            child: SvgPicture.asset(
                              'assets/images/arrow_right.svg',
                              width: 24.0,
                              height: 24.0,
                              fit: BoxFit.contain,
                            ),
                          ),
                        ].divide(const SizedBox(width: 16.0)),
                      ),
                    ),
                  ),
                ),
              ),
            ].divide(const SizedBox(height: 12.0)),
          ),
        ),
      ],
    );
  }
}
