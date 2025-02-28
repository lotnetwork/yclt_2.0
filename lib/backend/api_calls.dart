// ignore_for_file: unused_element

import 'dart:convert';
import 'package:flutter/foundation.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

/// Start EventAPI Group Code

class EventAPIGroup {
  static String getBaseUrl({
    String? token = '',
  }) =>
      'https://event.templatevictory.com/api';
  static Map<String, String> headers = {
    'Authorization': 'Bearer [token]',
  };
  static CheckregisterUserApiCall checkregisterUserApiCall =
      CheckregisterUserApiCall();
  static SignUpApiCall signUpApiCall = SignUpApiCall();
  static VerifyOtpApiCall verifyOtpApiCall = VerifyOtpApiCall();
  static InterestedCategoryApiCall interestedCategoryApiCall =
      InterestedCategoryApiCall();
  static SignInApiCall signInApiCall = SignInApiCall();
  static ForgotPasswordApiCall forgotPasswordApiCall = ForgotPasswordApiCall();
  static ResetPasswordApiCall resetPasswordApiCall = ResetPasswordApiCall();
  static UserEditApiCall userEditApiCall = UserEditApiCall();
  static UploadimageApiCall uploadimageApiCall = UploadimageApiCall();
  static GetUserApiCall getUserApiCall = GetUserApiCall();
  static CurrencyApiCall currencyApiCall = CurrencyApiCall();
  static SearchEventApiCall searchEventApiCall = SearchEventApiCall();
  static OrganizerApiCall organizerApiCall = OrganizerApiCall();
  static SponserApiCall sponserApiCall = SponserApiCall();
  static AllCategoryApiCall allCategoryApiCall = AllCategoryApiCall();
  static UserDetailsApiCall userDetailsApiCall = UserDetailsApiCall();
  static EventDetailsApiCall eventDetailsApiCall = EventDetailsApiCall();
  static EventPhotoLinkApiCall eventPhotoLinkApiCall = EventPhotoLinkApiCall();
  static FavoriteEventApiCall favoriteEventApiCall = FavoriteEventApiCall();
  static GetFavoriteEventAllApiCall getFavoriteEventAllApiCall =
      GetFavoriteEventAllApiCall();
  static UnFavoriteEventApiCall unFavoriteEventApiCall =
      UnFavoriteEventApiCall();
  static BookTicketApiCall bookTicketApiCall = BookTicketApiCall();
  static ShowBookedTicketApiCall showBookedTicketApiCall =
      ShowBookedTicketApiCall();
  static PastBookedTicketApiCall pastBookedTicketApiCall =
      PastBookedTicketApiCall();
  static UpcomingTicketApiCall upcomingTicketApiCall = UpcomingTicketApiCall();
  static GetAllCouponApiCall getAllCouponApiCall = GetAllCouponApiCall();
  static GetPageApiCall getPageApiCall = GetPageApiCall();
  static PaymentGatewayApiCall paymentGatewayApiCall = PaymentGatewayApiCall();
  static SignoutApiCall signoutApiCall = SignoutApiCall();
  static GetAllTagApiCall getAllTagApiCall = GetAllTagApiCall();
  static GetEventsByTagIdCall getEventsByTagIdCall = GetEventsByTagIdCall();
  static GetAllNotificationApiCall getAllNotificationApiCall =
      GetAllNotificationApiCall();
  static ChangepasswordApiCall changepasswordApiCall = ChangepasswordApiCall();
  static DeleteaccountuserCall deleteaccountuserCall = DeleteaccountuserCall();
  static EditTnterestCategoryApiCall editTnterestCategoryApiCall =
      EditTnterestCategoryApiCall();
  static CancelTicketApiCall cancelTicketApiCall = CancelTicketApiCall();
  static CheckCouponApiCall checkCouponApiCall = CheckCouponApiCall();
  static ForgotPasswordotpVerificationApiCall
      forgotPasswordotpVerificationApiCall =
      ForgotPasswordotpVerificationApiCall();
  static IsVerifyAccountApiCall isVerifyAccountApiCall =
      IsVerifyAccountApiCall();
  static ResendOtpApiCall resendOtpApiCall = ResendOtpApiCall();
  static SplashApiCall splashApiCall = SplashApiCall();
}

class CheckregisterUserApiCall {
  Future<ApiCallResponse> call({
    String? email = '',
    String? token = '',
  }) async {
    final baseUrl = EventAPIGroup.getBaseUrl(
      token: token,
    );

    final ffApiRequestBody = '''
{
  "email": "$email"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'CheckregisterUserApi',
      apiUrl: '$baseUrl/checkregisteruser',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer $token',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  int? success(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.data.success''',
      ));
  String? message(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.message''',
      ));
}

class SignUpApiCall {
  Future<ApiCallResponse> call({
    String? name = '',
    String? email = '',
    String? password = '',
    String? countryCode = '',
    String? phone = '',
    String? country = '',
    String? token = '',
  }) async {
    final baseUrl = EventAPIGroup.getBaseUrl(
      token: token,
    );

    final ffApiRequestBody = '''
{
  "name": "$name",
  "email": "$email",
  "password": "$password",
  "country_code": "$countryCode",
  "phone": "$phone",
  "country": "$country"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'SignUpApi',
      apiUrl: '$baseUrl/signup',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer $token',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  int? success(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.data.success''',
      ));
  String? message(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.message''',
      ));
}

class VerifyOtpApiCall {
  Future<ApiCallResponse> call({
    String? email = '',
    int? otp,
    String? registrationToken = '',
    String? deviceId = '',
    String? token = '',
  }) async {
    final baseUrl = EventAPIGroup.getBaseUrl(
      token: token,
    );

    final ffApiRequestBody = '''
{
  "email": "$email",
  "otp": $otp,
  "registrationToken": "$registrationToken",
  "deviceId": "$deviceId"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'VerifyOtpApi',
      apiUrl: '$baseUrl/verifyotp',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer $token',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  int? success(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.data.success''',
      ));
  String? message(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.message''',
      ));
  String? token(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.token''',
      ));
  dynamic userDetail(dynamic response) => getJsonField(
        response,
        r'''$.data.user''',
      );
  String? userId(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.user._id''',
      ));
}

class InterestedCategoryApiCall {
  Future<ApiCallResponse> call({
    String? email = '',
    List<String>? interestCategoryList,
    String? token = '',
  }) async {
    final baseUrl = EventAPIGroup.getBaseUrl(
      token: token,
    );
    final interestCategory = _serializeList(interestCategoryList);

    final ffApiRequestBody = '''
{
  "email": "$email",
  "interestCategory": $interestCategory
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'InterestedCategoryApi',
      apiUrl: '$baseUrl/interestedcategory',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer $token',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  int? success(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.data.success''',
      ));
  String? message(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.message''',
      ));
}

class SignInApiCall {
  Future<ApiCallResponse> call({
    String? email = '',
    String? password = '',
    String? registrationToken = '',
    String? deviceId = '',
    String? token = '',
  }) async {
    final baseUrl = EventAPIGroup.getBaseUrl(
      token: token,
    );

    final ffApiRequestBody = '''
{
  "email": "$email",
  "password": "$password",
  "registrationToken": "$registrationToken",
  "deviceId": "$deviceId"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'SignInApi',
      apiUrl: '$baseUrl/signin',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer $token',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  int? success(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.data.success''',
      ));
  String? token(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.token''',
      ));
  dynamic userDetail(dynamic response) => getJsonField(
        response,
        r'''$.data.user''',
      );
  String? userId(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.user._id''',
      ));
  String? message(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.message''',
      ));
}

class ForgotPasswordApiCall {
  Future<ApiCallResponse> call({
    String? email = '',
    String? token = '',
  }) async {
    final baseUrl = EventAPIGroup.getBaseUrl(
      token: token,
    );

    final ffApiRequestBody = '''
{
  "email": "$email"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'ForgotPasswordApi',
      apiUrl: '$baseUrl/forgotpassword',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer $token',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  int? success(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.data.success''',
      ));
  String? message(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.message''',
      ));
}

class ResetPasswordApiCall {
  Future<ApiCallResponse> call({
    String? email = '',
    String? newPassword = '',
    String? token = '',
  }) async {
    final baseUrl = EventAPIGroup.getBaseUrl(
      token: token,
    );

    final ffApiRequestBody = '''
{
  "email": "$email",
  "new_password": "$newPassword"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'ResetPasswordApi',
      apiUrl: '$baseUrl/resetpassword',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer $token',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  int? success(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.data.success''',
      ));
  String? message(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.message''',
      ));
}

class UserEditApiCall {
  Future<ApiCallResponse> call({
    String? name = '',
    String? phone = '',
    String? countryCode = '',
    String? gender = '',
    String? birthdate = '',
    String? avatar = '',
    String? about = '',
    String? country = '',
    String? token = '',
  }) async {
    final baseUrl = EventAPIGroup.getBaseUrl(
      token: token,
    );

    final ffApiRequestBody = '''
{
  "name": "$name",
  "country_code": "$countryCode",
  "phone": "$phone",
  "country": "$country",
  "gender": "$gender",
  "birthdate": "$birthdate",
  "avatar": "$avatar",
  "about": "$about"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'UserEditApi',
      apiUrl: '$baseUrl/useredit',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer $token',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class UploadimageApiCall {
  Future<ApiCallResponse> call({
    FFUploadedFile? avatar,
    String? token = '',
  }) async {
    final baseUrl = EventAPIGroup.getBaseUrl(
      token: token,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'UploadimageApi',
      apiUrl: '$baseUrl/uploadimage',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer $token',
      },
      params: {
        'avatar': avatar,
      },
      bodyType: BodyType.MULTIPART,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GetUserApiCall {
  Future<ApiCallResponse> call({
    String? token = '',
  }) async {
    final baseUrl = EventAPIGroup.getBaseUrl(
      token: token,
    );

    const ffApiRequestBody = '''
{
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'GetUserApi',
      apiUrl: '$baseUrl/getuser',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer $token',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  int? success(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.data.success''',
      ));
  dynamic userDetail(dynamic response) => getJsonField(
        response,
        r'''$.data.user''',
      );
  String? userId(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.user._id''',
      ));
  String? countryCode(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.user.country_code''',
      ));
  String? phone(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.user.phone''',
      ));
  String? country(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.user.country''',
      ));
  List? interestCategoryIdList(dynamic response) => getJsonField(
        response,
        r'''$.data.user.interestCategoryId''',
        true,
      ) as List?;
}

class CurrencyApiCall {
  Future<ApiCallResponse> call({
    String? token = '',
  }) async {
    final baseUrl = EventAPIGroup.getBaseUrl(
      token: token,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'CurrencyApi',
      apiUrl: '$baseUrl/getcurrencytimezone',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer $token',
      },
      params: {},
      bodyType: BodyType.NONE,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  int? success(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.data.success''',
      ));
  String? currencyName(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.currency.currency''',
      ));
}

class SearchEventApiCall {
  Future<ApiCallResponse> call({
    String? searchKeyword = '',
    String? token = '',
  }) async {
    final baseUrl = EventAPIGroup.getBaseUrl(
      token: token,
    );

    final ffApiRequestBody = '''
{
  "searchKeyword": "$searchKeyword"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'SearchEventApi',
      apiUrl: '$baseUrl/search',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer $token',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  int? success(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.data.success''',
      ));
  List? eventList(dynamic response) => getJsonField(
        response,
        r'''$.data.event''',
        true,
      ) as List?;
}

class OrganizerApiCall {
  Future<ApiCallResponse> call({
    String? token = '',
  }) async {
    final baseUrl = EventAPIGroup.getBaseUrl(
      token: token,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'OrganizerApi',
      apiUrl: '$baseUrl/organizer',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer $token',
      },
      params: {},
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  int? success(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.data.success''',
      ));
  List? organizerList(dynamic response) => getJsonField(
        response,
        r'''$.data.organizer''',
        true,
      ) as List?;
}

class SponserApiCall {
  Future<ApiCallResponse> call({
    String? token = '',
  }) async {
    final baseUrl = EventAPIGroup.getBaseUrl(
      token: token,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'SponserApi',
      apiUrl: '$baseUrl/sponsor',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer $token',
      },
      params: {},
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  int? success(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.data.success''',
      ));
  List? sponsor(dynamic response) => getJsonField(
        response,
        r'''$.data.sponsor''',
        true,
      ) as List?;
}

class AllCategoryApiCall {
  Future<ApiCallResponse> call({
    String? token = '',
  }) async {
    final baseUrl = EventAPIGroup.getBaseUrl(
      token: token,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'AllCategoryApi',
      apiUrl: '$baseUrl/allcategory',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer $token',
      },
      params: {},
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  int? success(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.data.success''',
      ));
  List? categoryList(dynamic response) => getJsonField(
        response,
        r'''$.data.category''',
        true,
      ) as List?;
}

class UserDetailsApiCall {
  Future<ApiCallResponse> call({
    String? token = '',
  }) async {
    final baseUrl = EventAPIGroup.getBaseUrl(
      token: token,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'UserDetailsApi',
      apiUrl: '$baseUrl/showuser',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer $token',
      },
      params: {},
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class EventDetailsApiCall {
  Future<ApiCallResponse> call({
    String? eventId = '',
    String? token = '',
  }) async {
    final baseUrl = EventAPIGroup.getBaseUrl(
      token: token,
    );

    final ffApiRequestBody = '''
{
  "eventId": "$eventId"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'EventDetailsApi',
      apiUrl: '$baseUrl/eventdetails',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer $token',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  int? success(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.data.success''',
      ));
  String? event(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.event[:].event''',
      ));
  String? categoryName(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.event[:].categoryId.category''',
      ));
  List? organizerIdList(dynamic response) => getJsonField(
        response,
        r'''$.data.event[:].organizerId''',
        true,
      ) as List?;
  int? price(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.data.event[:].price''',
      ));
  String? time(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.event[:].time''',
      ));
  int? tax(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.data.event[:].tax''',
      ));
  List? sponsorIdList(dynamic response) => getJsonField(
        response,
        r'''$.data.event[:].sponsorId''',
        true,
      ) as List?;
  String? address(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.event[:].address''',
      ));
  String? lastdate(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.event[:].lastdate''',
      ));
  int? totalSeat(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.data.event[:].totalSeat''',
      ));
  int? availableticket(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.data.event[:].availableticket''',
      ));
  int? totalBookedTicket(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.data.event[:].totalBookedTicket''',
      ));
  String? disclaimer(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.event[:].disclaimer''',
      ));
  String? description(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.event[:].description''',
      ));
  String? date(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.event[:].date''',
      ));
  String? avatar(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.event[:].avatar''',
      ));
  double? latitude(dynamic response) => castToType<double>(getJsonField(
        response,
        r'''$.data.event[:].location.latitude''',
      ));
  double? longitude(dynamic response) => castToType<double>(getJsonField(
        response,
        r'''$.data.event[:].location.longitude''',
      ));
  List<String>? galleryImgList(dynamic response) => (getJsonField(
        response,
        r'''$.data.event[:].galleryImg''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class EventPhotoLinkApiCall {
  Future<ApiCallResponse> call({
    String? eventId = '',
    String? token = '',
  }) async {
    final baseUrl = EventAPIGroup.getBaseUrl(
      token: token,
    );

    final ffApiRequestBody = '''
{
  "eventId": "$eventId"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'EventPhotoLinkApi',
      apiUrl: '$baseUrl/eventphotolink',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer $token',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? status(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.status''',
      ));
  int? code(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.code''',
      ));
}

class FavoriteEventApiCall {
  Future<ApiCallResponse> call({
    String? eventId = '',
    String? token = '',
  }) async {
    final baseUrl = EventAPIGroup.getBaseUrl(
      token: token,
    );

    final ffApiRequestBody = '''
{
  "eventId": "$eventId"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'FavoriteEventApi',
      apiUrl: '$baseUrl/addFavouriteEvent',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer $token',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GetFavoriteEventAllApiCall {
  Future<ApiCallResponse> call({
    String? token = '',
  }) async {
    final baseUrl = EventAPIGroup.getBaseUrl(
      token: token,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'GetFavoriteEventAllApi',
      apiUrl: '$baseUrl/getAllFavouriteEvent',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer $token',
      },
      params: {},
      bodyType: BodyType.NONE,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  int? success(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.data.success''',
      ));
  List? eventList(dynamic response) => getJsonField(
        response,
        r'''$.data.event''',
        true,
      ) as List?;
}

class UnFavoriteEventApiCall {
  Future<ApiCallResponse> call({
    String? eventId = '',
    String? token = '',
  }) async {
    final baseUrl = EventAPIGroup.getBaseUrl(
      token: token,
    );

    final ffApiRequestBody = '''
{
  "eventId": "$eventId"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'UnFavoriteEventApi',
      apiUrl: '$baseUrl/deleteFavouriteEvent',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer $token',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? status(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.status''',
      ));
  int? code(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.code''',
      ));
  String? message(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
}

class BookTicketApiCall {
  Future<ApiCallResponse> call({
    String? eventId = '',
    double? price,
    int? totalTicket,
    double? subtotal,
    String? couponCode = '',
    double? couponAmount,
    double? tax,
    double? taxAmount,
    double? totalAmount,
    String? paymentMethod = '',
    String? paymentStatus = '',
    String? transactionId = '',
    String? token = '',
  }) async {
    final baseUrl = EventAPIGroup.getBaseUrl(
      token: token,
    );

    final ffApiRequestBody = '''
{
  "eventId": "$eventId",
  "price": $price,
  "total_ticket": $totalTicket,
  "subtotal": $subtotal,
  "coupon_code": "$couponCode",
  "coupon_amount": $couponAmount,
  "tax": $tax,
  "tax_amount": $taxAmount,
  "total_amount": $totalAmount,
  "payment_method": "$paymentMethod",
  "payment_status": "$paymentStatus",
  "transaction_id": "$transactionId"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'BookTicketApi',
      apiUrl: '$baseUrl/bookticket',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer $token',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  int? success(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.data.success''',
      ));
  String? message(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.message''',
      ));
}

class ShowBookedTicketApiCall {
  Future<ApiCallResponse> call({
    String? token = '',
  }) async {
    final baseUrl = EventAPIGroup.getBaseUrl(
      token: token,
    );

    const ffApiRequestBody = '''
{}''';
    return ApiManager.instance.makeApiCall(
      callName: 'ShowBookedTicketApi',
      apiUrl: '$baseUrl/allbookedticket',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer $token',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class PastBookedTicketApiCall {
  Future<ApiCallResponse> call({
    String? token = '',
  }) async {
    final baseUrl = EventAPIGroup.getBaseUrl(
      token: token,
    );

    const ffApiRequestBody = '''
{}''';
    return ApiManager.instance.makeApiCall(
      callName: 'PastBookedTicketApi',
      apiUrl: '$baseUrl/pastbookedticket',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer $token',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  int? success(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.data.success''',
      ));
  List? ticketList(dynamic response) => getJsonField(
        response,
        r'''$.data.ticket''',
        true,
      ) as List?;
}

class UpcomingTicketApiCall {
  Future<ApiCallResponse> call({
    String? token = '',
  }) async {
    final baseUrl = EventAPIGroup.getBaseUrl(
      token: token,
    );

    const ffApiRequestBody = '''
{}''';
    return ApiManager.instance.makeApiCall(
      callName: 'UpcomingTicketApi',
      apiUrl: '$baseUrl/upcomingticket',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer $token',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  int? success(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.data.success''',
      ));
  List? ticketList(dynamic response) => getJsonField(
        response,
        r'''$.data.ticket''',
        true,
      ) as List?;
}

class GetAllCouponApiCall {
  Future<ApiCallResponse> call({
    String? token = '',
  }) async {
    final baseUrl = EventAPIGroup.getBaseUrl(
      token: token,
    );

    const ffApiRequestBody = '''
{}''';
    return ApiManager.instance.makeApiCall(
      callName: 'GetAllCouponApi',
      apiUrl: '$baseUrl/getAllCoupon',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer $token',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  int? success(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.data.success''',
      ));
  List? couponList(dynamic response) => getJsonField(
        response,
        r'''$.data.coupon''',
        true,
      ) as List?;
}

class GetPageApiCall {
  Future<ApiCallResponse> call({
    String? token = '',
  }) async {
    final baseUrl = EventAPIGroup.getBaseUrl(
      token: token,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'GetPageApi',
      apiUrl: '$baseUrl/getpage',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer $token',
      },
      params: {},
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  int? success(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.data.success''',
      ));
  String? privatePolicy(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.page.private_policy''',
      ));
  String? termsAndCondition(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.data.page.terms_and_condition''',
      ));
}

class PaymentGatewayApiCall {
  Future<ApiCallResponse> call({
    String? token = '',
  }) async {
    final baseUrl = EventAPIGroup.getBaseUrl(
      token: token,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'PaymentGatewayApi',
      apiUrl: '$baseUrl/paymentgateway',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer $token',
      },
      params: {},
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  int? success(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.data.success''',
      ));
  dynamic paymentGateway(dynamic response) => getJsonField(
        response,
        r'''$.data.paymentGateway''',
      );
  int? stripeEnable(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.data.paymentGateway.stripe.stripe_is_enable''',
      ));
  int? razorpayEnable(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.data.paymentGateway.razorpay.razorpay_is_enable''',
      ));
  int? paypalEnable(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.data.paymentGateway.paypal.paypal_is_enable''',
      ));
  String? stripepublishablekey(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.data.paymentGateway.stripe.stripe_publishable_key''',
      ));
  String? stripesecretkey(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.paymentGateway.stripe.stripe_secret_key''',
      ));
  String? razorpaykeyid(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.paymentGateway.razorpay.razorpay_key_id''',
      ));
  String? razorpaykeysecret(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.data.paymentGateway.razorpay.razorpay_key_secret''',
      ));
  String? paypalprivatekey(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.paymentGateway.paypal.paypal_private_key''',
      ));
  String? paypalpublickey(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.paymentGateway.paypal.paypal_public_key''',
      ));
}

class SignoutApiCall {
  Future<ApiCallResponse> call({
    String? userId = '',
    String? deviceId = '',
    String? token = '',
  }) async {
    final baseUrl = EventAPIGroup.getBaseUrl(
      token: token,
    );

    final ffApiRequestBody = '''
{
  "userId": "$userId",
  "deviceId": "$deviceId"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'SignoutApi',
      apiUrl: '$baseUrl/signout',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer $token',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GetAllTagApiCall {
  Future<ApiCallResponse> call({
    String? token = '',
  }) async {
    final baseUrl = EventAPIGroup.getBaseUrl(
      token: token,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'GetAllTagApi',
      apiUrl: '$baseUrl/getAllTag',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer $token',
      },
      params: {},
      bodyType: BodyType.NONE,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  int? success(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.data.success''',
      ));
  List<String>? name(dynamic response) => (getJsonField(
        response,
        r'''$.data.tag[:].name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List? tagList(dynamic response) => getJsonField(
        response,
        r'''$.data.tag''',
        true,
      ) as List?;
}

class GetEventsByTagIdCall {
  Future<ApiCallResponse> call({
    String? tagId = '',
    String? token = '',
  }) async {
    final baseUrl = EventAPIGroup.getBaseUrl(
      token: token,
    );

    final ffApiRequestBody = '''
{
  "tagId": "$tagId"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'GetEventsByTagId',
      apiUrl: '$baseUrl/getEventsByTagId',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer $token',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  int? success(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.data.success''',
      ));
  List? eventList(dynamic response) => getJsonField(
        response,
        r'''$.data.event''',
        true,
      ) as List?;
}

class GetAllNotificationApiCall {
  Future<ApiCallResponse> call({
    String? token = '',
  }) async {
    final baseUrl = EventAPIGroup.getBaseUrl(
      token: token,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'GetAllNotificationApi',
      apiUrl: '$baseUrl/getAllNotification',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer $token',
      },
      params: {},
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  int? success(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.data.success''',
      ));
  List? notificationList(dynamic response) => getJsonField(
        response,
        r'''$.data.notification''',
        true,
      ) as List?;
}

class ChangepasswordApiCall {
  Future<ApiCallResponse> call({
    String? currentPassword = '',
    String? newPassword = '',
    String? confirmPassword = '',
    String? token = '',
  }) async {
    final baseUrl = EventAPIGroup.getBaseUrl(
      token: token,
    );

    final ffApiRequestBody = '''
{
  "currentPassword": "$currentPassword",
  "newPassword": "$newPassword",
  "confirmPassword": "$confirmPassword"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'ChangepasswordApi',
      apiUrl: '$baseUrl/changepassword',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer $token',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  int? success(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.data.success''',
      ));
  String? message(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.message''',
      ));
}

class DeleteaccountuserCall {
  Future<ApiCallResponse> call({
    String? token = '',
  }) async {
    final baseUrl = EventAPIGroup.getBaseUrl(
      token: token,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'deleteaccountuser',
      apiUrl: '$baseUrl/deleteaccountuser',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer $token',
      },
      params: {},
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  int? success(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.data.success''',
      ));
  String? message(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.message''',
      ));
}

class EditTnterestCategoryApiCall {
  Future<ApiCallResponse> call({
    List<String>? interestCategoryList,
    String? token = '',
  }) async {
    final baseUrl = EventAPIGroup.getBaseUrl(
      token: token,
    );
    final interestCategory = _serializeList(interestCategoryList);

    final ffApiRequestBody = '''
{
  "interestCategory": $interestCategory
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'EditTnterestCategoryApi',
      apiUrl: '$baseUrl/useredit',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer $token',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  int? success(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.data.success''',
      ));
  String? message(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.message''',
      ));
}

class CancelTicketApiCall {
  Future<ApiCallResponse> call({
    String? ticketId = '',
    int? totalCancelTicket,
    String? cancelReason = '',
    String? token = '',
  }) async {
    final baseUrl = EventAPIGroup.getBaseUrl(
      token: token,
    );

    final ffApiRequestBody = '''
{
  "ticketId": "$ticketId",
  "total_cancel_ticket": $totalCancelTicket,
  "cancel_reason": "$cancelReason"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'CancelTicketApi',
      apiUrl: '$baseUrl/cancelTicket',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer $token',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  int? success(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.data.success''',
      ));
  String? message(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.message''',
      ));
}

class CheckCouponApiCall {
  Future<ApiCallResponse> call({
    String? couponId = '',
    String? token = '',
  }) async {
    final baseUrl = EventAPIGroup.getBaseUrl(
      token: token,
    );

    final ffApiRequestBody = '''
{
  "couponId": "$couponId"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'CheckCouponApi',
      apiUrl: '$baseUrl/checkCoupon',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer $token',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  int? success(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.data.success''',
      ));
  String? message(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.message''',
      ));
}

class ForgotPasswordotpVerificationApiCall {
  Future<ApiCallResponse> call({
    String? email = '',
    int? otp,
    String? token = '',
  }) async {
    final baseUrl = EventAPIGroup.getBaseUrl(
      token: token,
    );

    final ffApiRequestBody = '''
{
  "email": "$email",
  "otp": $otp
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'ForgotPasswordotpVerificationApi',
      apiUrl: '$baseUrl/forgotpasswordotpverification',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer $token',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  int? success(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.data.success''',
      ));
  String? message(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.message''',
      ));
}

class IsVerifyAccountApiCall {
  Future<ApiCallResponse> call({
    String? email = '',
    String? token = '',
  }) async {
    final baseUrl = EventAPIGroup.getBaseUrl(
      token: token,
    );

    final ffApiRequestBody = '''
{
  "email": "$email"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'IsVerifyAccountApi',
      apiUrl: '$baseUrl/isverifyaccount',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer $token',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  int? success(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.data.success''',
      ));
  String? message(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.message''',
      ));
}

class ResendOtpApiCall {
  Future<ApiCallResponse> call({
    String? email = '',
    String? token = '',
  }) async {
    final baseUrl = EventAPIGroup.getBaseUrl(
      token: token,
    );

    final ffApiRequestBody = '''
{
  "email": "$email"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'ResendOtpApi',
      apiUrl: '$baseUrl/resendotp',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer $token',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  int? success(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.data.success''',
      ));
  String? message(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.message''',
      ));
}

class SplashApiCall {
  Future<ApiCallResponse> call({
    String? token = '',
  }) async {
    final baseUrl = EventAPIGroup.getBaseUrl(
      token: token,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'SplashApi',
      apiUrl: '$baseUrl/splash',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer $token',
      },
      params: {},
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  int? success(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.data.success''',
      ));
  List? splashList(dynamic response) => getJsonField(
        response,
        r'''$.data.splash''',
        true,
      ) as List?;
}

/// End EventAPI Group Code

/// Start Event Admin App Group Code

class EventAdminAppGroup {
  static String getBaseUrl({
    String? token = '',
  }) =>
      'https://event.templatevictory.com/admin/api';
  static Map<String, String> headers = {
    'Authorization': 'Bearer [token]',
  };
  static AdminLoginCall adminLoginCall = AdminLoginCall();
  static MyTicketCall myTicketCall = MyTicketCall();
}

class AdminLoginCall {
  Future<ApiCallResponse> call({
    String? email = '',
    String? password = '',
    String? token = '',
  }) async {
    final baseUrl = EventAdminAppGroup.getBaseUrl(
      token: token,
    );

    final ffApiRequestBody = '''
{
  "email": "${escapeStringForJson(email)}",
  "password": "${escapeStringForJson(password)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'AdminLogin',
      apiUrl: '$baseUrl/login',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer $token',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  int? success(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.data.success''',
      ));
  String? message(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.message''',
      ));
  String? token(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.token''',
      ));
  dynamic organizer(dynamic response) => getJsonField(
        response,
        r'''$.data.organizer''',
      );
  String? organizerId(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.organizer._id''',
      ));
  String? organizerName(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.organizer.organizer''',
      ));
  String? organizerAvatar(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.organizer.avatar''',
      ));
  String? organizerEmail(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.organizer.email''',
      ));
}

class MyTicketCall {
  Future<ApiCallResponse> call({
    String? ticketId = '',
    int? totalScanTicket,
    String? token = '',
  }) async {
    final baseUrl = EventAdminAppGroup.getBaseUrl(
      token: token,
    );

    final ffApiRequestBody = '''
{
  "ticketId": "${escapeStringForJson(ticketId)}",
  "total_scan_ticket": $totalScanTicket
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'MyTicket',
      apiUrl: '$baseUrl/myticket',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer $token',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  int? success(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.data.success''',
      ));
  String? message(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.message''',
      ));
}

/// End Event Admin App Group Code

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _toEncodable(dynamic item) {
  if (item is DocumentReference) {
    return item.path;
  }
  return item;
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("List serialization failed. Returning empty list.");
    }
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("Json serialization failed. Returning empty json.");
    }
    return isList ? '[]' : '{}';
  }
}

String? escapeStringForJson(String? input) {
  if (input == null) {
    return null;
  }
  return input
      .replaceAll('\\', '\\\\')
      .replaceAll('"', '\\"')
      .replaceAll('\n', '\\n')
      .replaceAll('\t', '\\t');
}
