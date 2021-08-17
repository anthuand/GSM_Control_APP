import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class PushNotification {
  static FirebaseMessaging messaging = FirebaseMessaging.instance;
  static String? token;

  static Future _backgroundHandler(RemoteMessage message) async{
    print('Background Handler  ${message.messageId}');

  }

   static Future _onMessageHandler(RemoteMessage message) async{
    print('On Message Handler  ${message.messageId}');

  }

   static Future _onMessageOpenAPP(RemoteMessage message) async{
    print('On Message Open App  ${message.messageId}');

  }

  static Future initializeApp() async{
    // push notifications
    await Firebase.initializeApp();
    token = await messaging.getToken();
    print(token);

    // Handlers
    FirebaseMessaging.onBackgroundMessage(_backgroundHandler);
    FirebaseMessaging.onMessage.listen(_onMessageHandler);
    FirebaseMessaging.onMessageOpenedApp.listen(_onMessageOpenAPP);
  }
  
  

  
  
}



