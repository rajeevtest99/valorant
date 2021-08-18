import 'package:awesome_notifications/awesome_notifications.dart';

int createUniqueId() {
  return DateTime.now().millisecondsSinceEpoch.remainder(100000);
}

Future<void> createOnStartNotif() async {
  await AwesomeNotifications().createNotification(
      content: NotificationContent(
          id: createUniqueId(),
          channelKey: 'on_starting_notif',
          title: "Welcome to Valorant",
          summary: "add6443a-41bd-e414-f6ad-e58d267f4e95",
          body:
              "${Emojis.sky_tornado} do you know jett is the most picked agent?",
          bigPicture:
              "https://wallpaperaccess.com/download/valorant-jett-3910997",
          customSound: "resource://raw/res_notif_sound",
          notificationLayout: NotificationLayout.BigPicture));
}

Future<void> createOnStartNotifRaze() async {
  await AwesomeNotifications().createNotification(
      content: NotificationContent(
          id: createUniqueId(),
          channelKey: 'on_starting_notif',
          title: "Oooobliterated!",
          summary: "f94c3b30-42be-e959-889c-5aa313dba261",
          body: "${Emojis.animals_dog} Aww surrounded by mia familia",
          bigPicture:
              "https://wallpaperaccess.com/download/raze-valorant-3383769",
          customSound: "resource://raw/res_notif_sound",
          notificationLayout: NotificationLayout.BigPicture));
}

Future<void> createOnStartNotifSage() async {
  await AwesomeNotifications().createNotification(
      content: NotificationContent(
          id: createUniqueId(),
          channelKey: 'on_starting_notif',
          title: "Welcome to Valorant",
          summary: "569fdd95-4d10-43ab-ca70-79becc718b46",
          body: "Learn more about sage.",
          bigPicture:
              "https://wallpaperaccess.com/download/valorant-sage-3712601",
          customSound: "resource://raw/res_notif_sound",
          notificationLayout: NotificationLayout.BigPicture));
}
