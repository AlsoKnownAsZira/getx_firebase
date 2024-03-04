import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:getxflutter/app/routes/app_pages.dart';

class LoginPageController extends GetxController {
  RxBool isLoading = false.obs;
  TextEditingController emailController =
      TextEditingController();
  TextEditingController passwordController =
      TextEditingController();

  FirebaseAuth auth = FirebaseAuth.instance;

  void login() async {
    if (emailController.text.isNotEmpty && passwordController.text.isNotEmpty) {
      isLoading.value = true;
      try {
        isLoading.value = false;
        UserCredential userCredential = await auth.signInWithEmailAndPassword(
            email: emailController.text, password: passwordController.text);
        print(userCredential);
        isLoading.value = false;
        Get.offAllNamed(Routes.HOME);
      } on FirebaseAuthException catch (e) {
        print(e.code);
      }
    }
  }
}
