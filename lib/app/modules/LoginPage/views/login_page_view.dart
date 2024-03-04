import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:getxflutter/app/routes/app_pages.dart';
import '../controllers/login_page_controller.dart';

class LoginPageView extends GetView<LoginPageController> {
  const LoginPageView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('LoginPageView'),
          centerTitle: true,
        ),
        body: ListView(
          children: [
            TextField(
              controller: controller.emailController,
              decoration: const InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              controller: controller.passwordController,
              decoration: const InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Obx(() => ElevatedButton(
                onPressed: () {
                  controller.login();
                },
                child: Text(controller.isLoading.isFalse
                    ? 'Login'
                    : 'Loading... Please Wait'))),
            ElevatedButton(
                onPressed: () => Get.toNamed(Routes.REGISTER),
                child: Text("Register"))
          ],
        ));
  }
}
