import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'app/routes/app_pages.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'app/modules/Splash.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FirebaseAuth auth = FirebaseAuth.instance;
  runApp(
    StreamBuilder<User?>(
        stream: auth.authStateChanges(),
        builder: (context, snapshot) {
      if(snapshot.connectionState == ConnectionState.waiting){
        return const SplashScreen();
      }    
          return GetMaterialApp(
            title: "Application",
            initialRoute: AppPages.INITIAL,
            getPages: AppPages.routes,
          );
        }),
  );
}
