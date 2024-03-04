import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'app/routes/app_pages.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'app/modules/LoginPage/controllers/login_page_controller.dart';
import 'app/modules/register/controllers/register_controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  Get.lazyPut<RegisterController>(() => RegisterController());
  Get.lazyPut<LoginPageController>(() => LoginPageController());

  RegisterController registerController = Get.find<RegisterController>();

  // Check if the user is already authenticated
  if (await registerController.isUserLoggedIn()) {
    // If the user is logged in, navigate to the home page
    runApp(GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Application",
      initialRoute: Routes.HOME,
      getPages: AppPages.routes,
    ));
  } else {
    // If the user is not logged in, show the login page
    runApp(GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    ));
  }
}