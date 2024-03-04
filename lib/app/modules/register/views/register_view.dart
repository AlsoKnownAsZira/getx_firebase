import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/register_controller.dart';



class RegisterView extends GetView<RegisterController> {
  const RegisterView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('RegisterView'),
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
                  controller.register();
                },
                child: Text(controller.isLoading.isFalse
                    ? 'Register'
                    : 'Loading... Please Wait'))),
          ],
        ));
  }
}
