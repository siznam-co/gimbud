import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gymbud/helper/Utilities.dart';
import 'package:gymbud/helper/application.dart';
import 'package:gymbud/helper/localizations_delegate.dart';
import 'package:gymbud/helper/theme_changer.dart';
import 'package:gymbud/helper/theme_changer.dart';
import 'package:gymbud/pages/auth/OnBoarding.dart';
import 'package:gymbud/pages/auth/Splash.dart';
import 'package:gymbud/pages/trainee/UserTab.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter\_localizations/flutter\_localizations.dart';
late SharedPreferences preferences;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) async {
    try {
      preferences = await SharedPreferences.getInstance();
      runApp(
          MultiProvider(
        providers: [
            ChangeNotifierProvider(create:(_)=>ThemeChanger()),
        ],
        child: App(),
      ));
    } catch (err) {
      SharedPreferences.setMockInitialValues({});
      preferences = await SharedPreferences.getInstance();
      runApp(
          MultiProvider(
        providers: [
            ChangeNotifierProvider(create:(_)=>ThemeChanger()),
        ],
        child: App(),
      ));
    }
  });
}

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  late AppLocalizationsDelegate? _appLocalizationsDelegate;
  late Locale? appLocale;
  FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Utilities.isDarkTheme = preferences.getBool("darkTheme") ?? false;
    Utilities.language = preferences.getString('language') ?? 'en';
    appLocale = Locale(Utilities.language);
    _appLocalizationsDelegate = AppLocalizationsDelegate(newLocale: Locale('en'));
    application.onLocaleChanged = onLocaleChange;
    setLanguage();
    if (Platform.isIOS) iOS_Permission();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: Provider.of<ThemeChanger>(context).getTheme(),
      supportedLocales: application.supportedLocales(),
      locale: appLocale,
      localizationsDelegates: [
        _appLocalizationsDelegate!,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      home: Splash(),
      // home: OnBoarding(),
    );
  }

  Future setLanguage() async {
    preferences = await SharedPreferences.getInstance();
    Utilities.currency = preferences.getString('currency') ?? 'sar';
    Utilities.language = preferences.getString('language') ?? 'en';
    appLocale = Locale(Utilities.language);
    onLocaleChange(appLocale!);
  }

  Future onLocaleChange(Locale locale) async {
    setState(() {
      Utilities.language = locale.languageCode;
      appLocale = locale;
      _appLocalizationsDelegate = AppLocalizationsDelegate(newLocale: locale);
    });

    await preferences.setString('language', locale.languageCode);
  }

  Future<void> iOS_Permission() async {
    _firebaseMessaging.requestPermission(alert: true,sound: true,badge: true);
    _firebaseMessaging.getNotificationSettings();
    NotificationSettings settings = await _firebaseMessaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print('Got a message whilst in the foreground!');
      print('Message data: ${message.data}');

      if (message.notification != null) {
        print('Message also contained a notification: ${message.notification}');
      }
    });
  }

  void firebaseCloudMessaging_Listeners() {
    _firebaseMessaging.getToken().then((token){
    });

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print('Got a message whilst in the foreground!');
      print('Message data: ${message.data}');
      if (message.notification != null) {
        print('Message also contained a notification: ${message.notification}');
      }
    });
  }

  Future<void> myBackgroundMessageHandler(message) async {
    print("Handling a background message: ${message}");
  }

}

class Test extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeChanger>(
      builder: (context, val, _) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              'App',
              style: TextStyle(color: Colors.white),
            ),
          ),
          body: Container(
            // width: size.width,
            // height: size.height,
            child: Column(
              children: [
                Text("Center", style: TextStyle(color: Colors.white)),
                Switch(
                  value: Utilities.isDarkTheme,
                  onChanged: (value) {
                    val.swapTheme();
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }

}
