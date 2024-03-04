import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:getxflutter/app/routes/app_pages.dart';

class RegisterController extends GetxController {
  //TODO: Implement RegisterController
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  RxBool isLoading = false.obs;

  FirebaseAuth auth = FirebaseAuth.instance;

  void register() async {
    if (emailController.text.isNotEmpty && passwordController.text.isNotEmpty) {
      isLoading.value = true;
      try {
        isLoading.value = false;
        UserCredential userCredential =
            await auth.createUserWithEmailAndPassword(
                email: emailController.text, password: passwordController.text);
        print(userCredential);
        isLoading.value = false;
        Get.offAllNamed(Routes.LOGIN_PAGE);
      } on FirebaseAuthException catch (e) {
        isLoading.value = false;
        print(e.code);
      }catch(e){
        isLoading.value = false;
        print(e);
      }
    }
  }
}
