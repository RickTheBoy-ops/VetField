import 'dart:async';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:permission_handler/permission_handler.dart';

class NotificationService {
  static final NotificationService _instance = NotificationService._internal();
  factory NotificationService() => _instance;
  NotificationService._internal();

  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
  final FlutterLocalNotificationsPlugin _localNotifications =
      FlutterLocalNotificationsPlugin();

  String? _fcmToken;
  String? get fcmToken => _fcmToken;

  Future<void> initialize() async {
    // Solicitar permissão
    final status = await Permission.notification.request();
    if (!status.isGranted) return;

    // Configurar notificações locais
    const androidSettings = AndroidInitializationSettings(
      '@mipmap/ic_launcher',
    );
    const iosSettings = DarwinInitializationSettings(
      requestAlertPermission: true,
      requestBadgePermission: true,
      requestSoundPermission: true,
    );

    await _localNotifications.initialize(
      const InitializationSettings(android: androidSettings, iOS: iosSettings),
      onDidReceiveNotificationResponse: _onNotificationTap,
    );

    // Obter token FCM
    _fcmToken = await _firebaseMessaging.getToken();

    // Configurar listeners
    FirebaseMessaging.onMessage.listen(_onForegroundMessage);
    FirebaseMessaging.onMessageOpenedApp.listen(_onNotificationOpenedApp);
  }

  void _onForegroundMessage(RemoteMessage message) {
    // Mostrar notificação local quando o app está aberto
    _showLocalNotification(
      title: message.notification?.title ?? 'Nova Notificação',
      body: message.notification?.body ?? '',
      payload: message.data.toString(),
    );
  }

  void _onNotificationOpenedApp(RemoteMessage message) {
    // Ação quando usuário clica na notificação
    // Você pode navegar para uma tela específica aqui
    debugPrint('Notification clicked: ${message.data}');
  }

  void _onNotificationTap(NotificationResponse response) {
    // Ação ao clicar em notificação local
    debugPrint('Local notification tapped: ${response.payload}');
  }

  Future<void> _showLocalNotification({
    required String title,
    required String body,
    String? payload,
  }) async {
    const androidDetails = AndroidNotificationDetails(
      'vetfield_channel',
      'VetField Notifications',
      channelDescription: 'Notificações do VetField',
      importance: Importance.high,
      priority: Priority.high,
    );

    const iosDetails = DarwinNotificationDetails();

    await _localNotifications.show(
      DateTime.now().millisecondsSinceEpoch ~/ 1000,
      title,
      body,
      const NotificationDetails(android: androidDetails, iOS: iosDetails),
      payload: payload,
    );
  }

  Future<void> refreshToken() async {
    _fcmToken = await _firebaseMessaging.getToken();
  }
}

// Handler para notificações em background
@pragma('vm:entry-point')
Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  debugPrint('Handling background message: ${message.messageId}');
}
