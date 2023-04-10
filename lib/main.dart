import 'package:decore/utils/api_handler.dart';
import 'package:decore/utils/routes/routes.dart';
import 'package:decore/utils/routes/routes_name.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  StoreData.shared.getInstance();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (BuildContext context, Orientation orientation, DeviceType deviceType) {
      return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        // home: const Demo(),

        initialRoute: RoutesName.splashScreen,
        getPages: routesList,
      );
    });
  }
}
// GetMaterialApp(
// debugShowCheckedModeBanner: false,
// title: 'Flutter Demo',
// theme: ThemeData(
// primarySwatch: Colors.blue,
// ),
// // home: const MyHomePage(title: 'Flutter Demo Home Page'),
// initialRoute: RoutesName.splashScreen,
// getPages: routesList,
// );
