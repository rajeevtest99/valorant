import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:valorant/utils/styling.dart';

List<NotificationChannel> notifchannels = [
  NotificationChannel(
      channelKey: 'on_starting_notif',
      channelName: 'On Start Notification',
      defaultColor: AppTheme.jasper,
      importance: NotificationImportance.Default,
      soundSource: "resource://raw/res_notif_sound")
];
