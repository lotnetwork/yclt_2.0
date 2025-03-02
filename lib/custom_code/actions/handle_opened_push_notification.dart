// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import '../../custom_code/actions/notification_init.dart';

bool loading = false;
final handledMessageIds = <String?>{};

Future handleOpenedPushNotification(
  BuildContext context,
  Future Function() navigate,
) async {
  // Add your function code here!
// Add your function code here!
  // if (isWeb) {
  //   return;
  // }

  final notification = await FirebaseMessaging.instance.getInitialMessage();

  await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
    alert: true,
    badge: true,
    sound: true,
  );

  if (notification != null) {
    await handlePushNotification(notification, context);
    FirebaseMessaging.onMessageOpenedApp.listen(
      (event) => handlePushNotification(event, context),
    );
    configureDidReceiveLocalNotificationSubject(context);
    configureSelectNotificationSubject(context);
  }
}

Future handlePushNotification(
    RemoteMessage message, BuildContext context) async {
  if (handledMessageIds.contains(message.messageId)) {
    return;
  }
  handledMessageIds.add(message.messageId);

  // if (mounted) {
  // setState(() =>
  loading = true;
  //  );
  // }
  try {
    context.goNamed(
      'NotificationScreen',
      extra: <String, dynamic>{
        kTransitionInfoKey: const TransitionInfo(
          hasTransition: true,
          transitionType: PageTransitionType.rightToLeft,
          duration: Duration(milliseconds: 300),
        ),
      },
    );
  } catch (e) {
    print('Error: $e');
  } finally {
    // if (mounted) {
    //   setState(() =>
    loading = false;
    // );
    // }
  }
}

void configureDidReceiveLocalNotificationSubject(BuildContext context) {
  didReceiveLocalNotificationStream.stream
      .listen((ReceivedNotification receivedNotification) async {
    context.goNamed(
      'NotificationScreen',
      extra: <String, dynamic>{
        kTransitionInfoKey: const TransitionInfo(
          hasTransition: true,
          transitionType: PageTransitionType.rightToLeft,
          duration: Duration(milliseconds: 300),
        ),
      },
    );
  });
}

void configureSelectNotificationSubject(BuildContext context) {
  selectNotificationStream.stream.listen((String? payload) async {
    context.goNamed(
      'NotificationScreen',
      extra: <String, dynamic>{
        kTransitionInfoKey: const TransitionInfo(
          hasTransition: true,
          transitionType: PageTransitionType.rightToLeft,
          duration: Duration(milliseconds: 300),
        ),
      },
    );
  });
}
