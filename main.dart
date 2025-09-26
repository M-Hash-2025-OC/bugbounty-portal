import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:squid_game/screens/home.dart';
import 'package:squid_game/screens/login/signin.dart';

Future main() async{
  WidgetsFlutterBinding.ensureInitialized();
  try{
    await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyBOdJYyiUVc8So-3o4JyHm1osuSEMJATfQ",
          appId: "1:1020013072652:android:d96a04c68989814546b929",
          messagingSenderId: "1020013072652",
          projectId: "squidgame-fe691"),
    );}
  catch (e) {
    print('Firebase initialization error: $e');
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: "images/signup_bg.png",
      splashIconSize: 0.3 * MediaQuery.of(context).size.height,
      backgroundColor: const Color.fromARGB(255, 3, 12, 34),
      duration: 2000,
      splashTransition: SplashTransition.fadeTransition,
      pageTransitionType: PageTransitionType.fade,
      nextScreen: FirebaseAuth.instance.currentUser != null ? Home() : const SignIn(),
    );
  }
}
