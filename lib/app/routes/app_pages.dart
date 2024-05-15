import 'package:get/get.dart';

import 'package:sertif2/app/modules/home/bindings/home_binding.dart';
import 'package:sertif2/app/modules/home/views/home_view.dart';
import 'package:sertif2/app/modules/login/bindings/login_binding.dart';
import 'package:sertif2/app/modules/login/views/login_view.dart';
import 'package:sertif2/app/modules/register/bindings/register_binding.dart';
import 'package:sertif2/app/modules/register/views/register_view.dart';
import 'package:sertif2/app/modules/splashscreen/bindings/splashscreen_binding.dart';
import 'package:sertif2/app/modules/splashscreen/views/splashscreen_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASHSCREEN;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.SPLASHSCREEN,
      page: () => SplashScreenView(),
      binding: SplashscreenBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.REGISTER,
      page: () => RegisterView(),
      binding: RegisterBinding(),
    ),
  ];
}
