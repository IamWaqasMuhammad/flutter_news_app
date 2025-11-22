import 'package:flutter_news_app/app_barrels.dart';

class LoginBinding extends Bindings {
  void dependencies(){
    Get.lazyPut<LoginController>(()=>LoginController());
  }
}