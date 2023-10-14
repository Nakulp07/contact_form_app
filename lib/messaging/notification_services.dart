import 'package:firebase_messaging/firebase_messaging.dart';

class NotificationServices {
  FirebaseMessaging messaging = FirebaseMessaging.instance;

  void requestNotificationPermissions() async {
    NotificationSettings settings = await messaging.requestPermission(
      alert: true, // this will display notifications on device
      announcement:
          false, //If enabled, Siri will read the notification content out when devices are connected to AirPods.
      badge:
          true, // Sets whether a notification dot will appear next to the app icon on the device when there are unread notifications.
      carPlay:
          false, // Sets whether notifications will appear when the device is connected to CarPlay.
      criticalAlert: false,
      provisional:
          false, // Sets whether provisional permissions are granted. See Provisional authorization for more information.
      sound:
          true, // Sets whether a sound will be played when a notification is displayed on the device.
    );
  }
}
