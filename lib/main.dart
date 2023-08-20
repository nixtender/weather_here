import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:weather_here/ui/navigations/app_navigator.dart';
import 'package:weather_here/ui/pages/auth.dart';
import 'package:weather_here/ui/pages/weather.dart';
import 'package:weather_here/const/app_routes.dart' as routes;

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  //await FirebaseAuth.instance.signOut();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: routes.splash,
      navigatorKey: AppNavigator.key,
      onGenerateRoute: (routeSettings) =>
          AppNavigator.onGeneratedRoutes(routeSettings, context),
    );
  }
}
