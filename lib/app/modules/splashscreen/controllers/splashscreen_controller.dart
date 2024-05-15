import 'package:get/get.dart';
import 'package:sertif2/app/modules/login/views/login_view.dart';

class SplashscreenController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    Future.delayed(Duration(seconds: 3), () {
      Get.off(LoginView());
    });
  }
}