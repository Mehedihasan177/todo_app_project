import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:todo_app_project/services/theme_services.dart';
import 'package:todo_app_project/ui/screens/home_screen.dart';
import 'package:get/get.dart';
import 'package:todo_app_project/ui/screens/splash_screen.dart';
import 'package:todo_app_project/ui/theme.dart';

import 'core/app_component/app_component.dart';
final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  await init();
  await Firebase.initializeApp();
  runApp(MyApp());

}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ThemeServices _ts = ThemeServices();


  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Todo',
      theme: Themes.light,
      darkTheme: Themes.dark,
      themeMode: _ts.theme,
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}

