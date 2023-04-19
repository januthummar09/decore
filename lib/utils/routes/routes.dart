import 'package:decore/Bindings/Home_binding.dart';
import 'package:decore/Bindings/e_catalogue/e_catalogue_binding.dart';
import 'package:decore/Bindings/e_catalogue/pdf_binding.dart';
import 'package:decore/Bindings/login_binding.dart';
import 'package:decore/Bindings/order/dispatch/dispatch_binding.dart';
import 'package:decore/Bindings/order/orders/choose_category_binding.dart';
import 'package:decore/Bindings/order/orders/choose_product_binding.dart';
import 'package:decore/Bindings/order/orders/order_binding.dart';
import 'package:decore/Bindings/order/orders/order_meter_binding.dart';
import 'package:decore/Bindings/otp_binding.dart';
import 'package:decore/Bindings/price_list/price_binding.dart';
import 'package:decore/Bindings/splash_binding.dart';
import 'package:decore/utils/routes/routes_name.dart';
import 'package:decore/view/home_screen.dart';
import 'package:decore/view/login_screen.dart';
import 'package:decore/view/page_view/e_catalogue/e_catalogue.dart';
import 'package:decore/view/page_view/e_catalogue/pdf_viewer_screen.dart';
import 'package:decore/view/page_view/order_view/dispatch/dispatch_screen.dart';
import 'package:decore/view/page_view/order_view/order/choose_category_page.dart';
import 'package:decore/view/page_view/order_view/order/choose_product_page.dart';
import 'package:decore/view/page_view/order_view/order/meter_and_roll_page.dart';
import 'package:decore/view/page_view/order_view/order/order_meter_page.dart';
import 'package:decore/view/page_view/order_view/order/order_page.dart';
import 'package:decore/view/page_view/order_view/order/roll_page.dart';
import 'package:decore/view/page_view/order_view/part_dispatch/part_dispatch_screen.dart';
import 'package:decore/view/page_view/price_list/price_screen.dart';
import 'package:get/get.dart';

import '../../Bindings/order/orders/meter_and_roll_binding.dart';
import '../../Bindings/order/orders/roll_binding.dart';
import '../../Bindings/order/part_dispatch/part_dispatch_binding.dart';
import '../../Bindings/order/pending/all_order_binding.dart';
import '../../view/otp_screen.dart';
import '../../view/page_view/order_view/pending_view/all_orders_screen.dart';
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
  GetPage(name: RoutesName.allOrderPendingScreen, page: () => const AllOrderScreen(), binding: AllOrderBinding()),
  GetPage(name: RoutesName.meterAndRollScreen, page: () => const MeterAndRollPage(), binding: MeterAndRollBinding()),
  GetPage(name: RoutesName.rollScreen, page: () => const RollPage(), binding: RollBinding()),
  GetPage(name: RoutesName.eCatalogueScreen, page: () => ECatalogueScreen(), binding: ECatalogueBinding()),
  GetPage(name: RoutesName.pdfViewerScreen, page: () => const PdfViewerScreen(), binding: PdfViewerBinding()),
  GetPage(name: RoutesName.dispatchScreen, page: () => DispatchScreen(), binding: DispatchBinding()),
  GetPage(name: RoutesName.partDispatchScreen, page: () => PartDispatchScreen(), binding: PartDispatchBinding()),
  GetPage(name: RoutesName.priceScreen, page: () => PriceScreen(), binding: PriceBinding()),
];
