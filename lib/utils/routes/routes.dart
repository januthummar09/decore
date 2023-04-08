import 'package:decore/Bindings/Home_binding.dart';
import 'package:decore/Bindings/login_binding.dart';
import 'package:decore/Bindings/order/choose_category_binding.dart';
import 'package:decore/Bindings/order/choose_product_binding.dart';
import 'package:decore/Bindings/order/order_binding.dart';
import 'package:decore/Bindings/order/order_detail_binding.dart';
import 'package:decore/Bindings/order/order_meter_binding.dart';
import 'package:decore/Bindings/otp_binding.dart';
import 'package:decore/Bindings/splash_binding.dart';
import 'package:decore/utils/routes/routes_name.dart';
import 'package:decore/view/home_screen.dart';
import 'package:decore/view/login_screen.dart';
import 'package:decore/view/page_view/order_view/order/choose_category_page.dart';
import 'package:decore/view/page_view/order_view/order/choose_product_page.dart';
import 'package:decore/view/page_view/order_view/order/order_detail_page.dart';
import 'package:decore/view/page_view/order_view/order/order_meter_page.dart';
import 'package:decore/view/page_view/order_view/order/order_page.dart';
import 'package:get/get.dart';

import '../../view/otp_screen.dart';
import '../../view/splash_screen.dart';

List<GetPage<dynamic>> routesList = [
  GetPage(name: RoutesName.splashScreen, page: () => const SplashScreen(), binding: SplashBinding()),
  GetPage(name: RoutesName.loginScreen, page: () => const LoginScreen(), binding: LoginBinding()),
  GetPage(name: RoutesName.otpScreen, page: () => const OptScreen(), binding: OtpBindings()),
  GetPage(name: RoutesName.homeScreen, page: () => const HomeScreen(), binding: HomeBinding()),
  GetPage(name: RoutesName.orderScreen, page: () => const OrderPage(), binding: OrderBinding()),
  GetPage(name: RoutesName.chooseCategoryScreen, page: () => const ChooseCategoryPage(), binding: ChooseCategoryBinding()),
  GetPage(name: RoutesName.chooseProductScreen, page: () => const ChooseProductPage(), binding: ChooseProductBinding()),
  GetPage(name: RoutesName.orderMeterScreen, page: () => const OrderMeterPage(), binding: OrderMeterBinding()),
  GetPage(name: RoutesName.orderDetailScreen, page: () => const OrderDetailPage(), binding: OrderDetailBinding()),
];
