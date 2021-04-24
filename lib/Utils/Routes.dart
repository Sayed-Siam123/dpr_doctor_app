import 'package:dpr_doctor_app/UI/LoginPage/login_page.dart';
import 'package:get/get.dart';

class Routes{

  static final route = [

    GetPage(
      name: '/',
      page: () => LoginPage(),
    ),
  ];

}
