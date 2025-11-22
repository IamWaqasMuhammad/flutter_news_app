

import '../../app_barrels.dart';

class AppPages {
  static const initial = AppRoutes.onboard;

  static final routes = [
    GetPage(
      name: initial,
      page: () => OnboardingScreen(),
      binding: OnboardBinding(),
    ),

    GetPage(
      name: AppRoutes.login,
      page: () => LoginScreen(),
      binding: LoginBinding(),
    ),
  ];
}
