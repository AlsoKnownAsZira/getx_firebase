
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:getxflutter/app/routes/app_pages.dart';

class HomeController extends GetxController {
  FirebaseAuth auth = FirebaseAuth.instance;

  void logout() async {
    await auth.signOut();
    try {
      await auth.signOut();
      Get.offAllNamed(Routes.LOGIN_PAGE);
    } catch (e) {
      print(e);
    }
  }
}
