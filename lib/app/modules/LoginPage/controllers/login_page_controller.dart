import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:getxflutter/app/routes/app_pages.dart';

class LoginPageController extends GetxController {
  RxBool isLoading = false.obs;
  TextEditingController emailController =
      TextEditingController(text: "EMAIL@Mail.com");
  TextEditingController passwordController =
      TextEditingController(text: "MY SECRET PASSWORD");

  FirebaseAuth auth = FirebaseAuth.instance;

  void login() async {
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
