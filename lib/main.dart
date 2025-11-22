import 'package:flutter_news_app/utils/routes/app_pages.dart';

import 'app_barrels.dart';

void main() {

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Khabar App',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system,
      initialRoute: AppRoutes.onboard,
      initialBinding: OnboardBinding(),
      getPages: AppPages.routes,
    );
  }
}
