import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:getxflutter/app/routes/app_pages.dart';

class LoginPageController extends GetxController {
  RxBool isLoading = false.obs;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  FirebaseAuth auth = FirebaseAuth.instance;

  void login() async {
    if (emailController.text.isNotEmpty && passwordController.text.isNotEmpty) {
      isLoading.value = true;
      try {
        isLoading.value = false;
        UserCredential userCredential = await auth.signInWithEmailAndPassword(
            email: emailController.text, password: passwordController.text);

        if (userCredential.user!.emailVerified == true) {
          Get.offAllNamed(Routes.HOME);
        } else {
          Get.defaultDialog(
            title: "Account unverified",
            middleText: "Check your email or resend email verification",
            actions:[
              OutlinedButton(onPressed: ()=>Get.back(), child: Text("Cancel")),
             
              ElevatedButton(
              onPressed: () async {
                try {
                  await userCredential.user!.sendEmailVerification();
                  Get.back();
                  Get.snackbar("Success","Verification email sent");
                } catch (e) {
                  print(e);
                  Get.back();
                  Get.snackbar("ERROR", "Too Many Request!");
                }
              },
              child: Text("Resend"),
              )
            ]
          );
        }
      } on FirebaseAuthException catch (e) {
      Get.snackbar("Error", e.code);
      } catch (e) {
        Get.snackbar("Error", e.toString());
      }
    }else{
      Get.snackbar("Error", "Please fill in all fields");
    }
  }
}
