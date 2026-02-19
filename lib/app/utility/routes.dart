import 'package:e_gram_panchayat/app/Splash/Splash_Screen.dart';
import 'package:e_gram_panchayat/app/history/history_screen.dart';
import 'package:e_gram_panchayat/app/home/home_screen.dart';
import 'package:get/get.dart';

class AppRouter {
  static const String splash = '/splash';
  static const String home = '/home';
  static const String history = '/history';

  static List<GetPage> routes = [
    GetPage(name: splash, page: () => SplashScreen()),
    GetPage(name: home, page: () => HomeScreen()),
    GetPage(name: history, page: () => HistoryScreen()),
  ];
}
