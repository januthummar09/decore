import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

///colors
const Color primaryColor = Color(0xff4e6e69);
const Color color4D = Color(0xff4D646F);
const Color colorBD = Color(0xffBDBDBD);
const Color color94 = Color(0xff949494);
const Color colorB4 = Color(0xffB4B4B4);
const Color color17 = Color(0xff171717);
const Color colorF0 = Color(0xffF0EFF5);
Color colorForShadow = const Color(0xff000000).withOpacity(.25);
const Color white = Colors.white;
const Color transparent = Colors.transparent;
const Color black = Colors.black;
const Color amber = Colors.amber;
const Color green = Colors.green;
BoxShadow myBoxShadow = BoxShadow(blurRadius: 6, color: colorForShadow);
BorderRadius myBorderRadius = BorderRadius.circular(10);

//Images
String loginMain = 'assets/images/decor-removebg.png';
//catalogue
String catalogue1 = 'assets/images/catalogue/catalogue1.png';
String catalogue2 = 'assets/images/catalogue/catalogue2.png';
String catalogue3 = 'assets/images/catalogue/catalogue3.png';
String catalogue4 = 'assets/images/catalogue/catalogue4.png';
//home_images
String allOrders = 'assets/icons/all_order.png';
String pending = 'assets/icons/pendings.png';
String dispatch = 'assets/icons/dispatch.png';
String partDispatch1 = 'assets/icons/part_dispatch1.png';
String partDispatch2 = 'assets/icons/part_dispatch2.png';
String reports = 'assets/icons/reports.png';
String rates = 'assets/icons/rates.png';
String roll = 'assets/icons/roll.png';
String meter = 'assets/icons/meter.png';
String orderSucess = 'assets/icons/orderSucess.png';

//SizedBox
const SizedBox heightSpace2 = SizedBox(height: 2);
const SizedBox heightSpace3 = SizedBox(height: 3);
const SizedBox heightSpace5 = SizedBox(height: 5);
const SizedBox heightSpace7 = SizedBox(height: 7);
const SizedBox heightSpace8 = SizedBox(height: 8);
const SizedBox heightSpace10 = SizedBox(height: 10);
const SizedBox heightSpace15 = SizedBox(height: 15);
const SizedBox heightSpace20 = SizedBox(height: 20);
const SizedBox heightSpace25 = SizedBox(height: 25);
const SizedBox heightSpace30 = SizedBox(height: 30);
const SizedBox heightSpace35 = SizedBox(height: 35);
const SizedBox heightSpace40 = SizedBox(height: 40);
const SizedBox heightSpace45 = SizedBox(height: 45);
const SizedBox heightSpace50 = SizedBox(height: 50);
const SizedBox heightSpace60 = SizedBox(height: 60);
const SizedBox heightSpace70 = SizedBox(height: 70);
const SizedBox heightSpace80 = SizedBox(height: 80);

const SizedBox widthSpace5 = SizedBox(width: 5);
const SizedBox widthSpace8 = SizedBox(width: 8);
const SizedBox widthSpace10 = SizedBox(width: 10);
const SizedBox widthSpace15 = SizedBox(width: 15);
const SizedBox widthSpace20 = SizedBox(width: 20);
const SizedBox widthSpace25 = SizedBox(width: 25);
const SizedBox widthSpace30 = SizedBox(width: 30);
const SizedBox widthSpace35 = SizedBox(width: 35);
const SizedBox widthSpace40 = SizedBox(width: 40);
const SizedBox widthSpace45 = SizedBox(width: 45);
const SizedBox widthSpace50 = SizedBox(width: 50);

///Style

TextStyle primaryMedium22 = TextStyle(
  fontFamily: 'M',
  fontSize: 15.5.sp,
  color: primaryColor,
);
TextStyle primaryMedium20 = TextStyle(
  fontFamily: 'M',
  fontSize: 14.sp,
  color: primaryColor,
);
TextStyle blackMedium22 = TextStyle(
  fontFamily: 'M',
  fontSize: 15.5.sp,
  color: black,
);
TextStyle blackMedium16 = TextStyle(
  fontFamily: 'M',
  fontSize: 11.2.sp,
  color: black,
);
TextStyle blackMedium18 = TextStyle(
  fontFamily: 'M',
  fontSize: 12.6.sp,
  color: black,
);
TextStyle color94Medium14 = TextStyle(
  fontFamily: 'M',
  fontSize: 10.sp,
  color: color94,
);
TextStyle color94Medium22 = TextStyle(
  fontFamily: 'M',
  fontSize: 10.sp,
  color: color94,
);
TextStyle blackRegular14 = TextStyle(
  fontFamily: 'R',
  fontSize: 10.sp,
  color: black,
);
TextStyle blackRegular16 = TextStyle(
  fontFamily: 'R',
  fontSize: 11.2.sp,
  color: black,
);
TextStyle whiteRegular18 = TextStyle(
  fontFamily: 'R',
  fontSize: 12.5.sp,
  color: white,
);
TextStyle whiteRegular14 = TextStyle(
  fontFamily: 'R',
  fontSize: 10.sp,
  color: white,
);
TextStyle color94Regular14 = TextStyle(
  fontFamily: 'R',
  fontSize: 10.sp,
  color: color94,
);
TextStyle primaryRegular14 = TextStyle(
  fontFamily: 'R',
  fontSize: 10.sp,
  color: primaryColor,
);
TextStyle whiteBold20 = TextStyle(
  fontFamily: 'B',
  fontSize: 14.sp,
  color: white,
);
TextStyle whiteBold22 = TextStyle(
  fontFamily: 'B',
  fontSize: 15.5.sp,
  color: white,
);
TextStyle whiteSemiBold20 = TextStyle(
  fontFamily: 'R',
  fontSize: 14.sp,
  fontWeight: FontWeight.w600,
  color: white,
);
TextStyle whiteSemiBold18 = TextStyle(
  fontFamily: 'R',
  fontSize: 12.6.sp,
  fontWeight: FontWeight.w600,
  color: white,
);
TextStyle whiteSemiBold16 = TextStyle(
  fontFamily: 'R',
  fontSize: 11.2.sp,
  fontWeight: FontWeight.w600,
  color: white,
);
TextStyle whiteSemiBold14 = TextStyle(
  fontFamily: 'R',
  fontSize: 10.sp,
  fontWeight: FontWeight.w600,
  color: white,
);
TextStyle whiteBold18 = TextStyle(
  fontFamily: 'B',
  fontSize: 12.5.sp,
  color: white,
);
TextStyle whiteBold16 = TextStyle(
  fontFamily: 'B',
  fontSize: 11.2.sp,
  color: white,
);
TextStyle primaryBold16 = TextStyle(
  fontFamily: 'B',
  fontSize: 11.2.sp,
  color: primaryColor,
);
TextStyle color94SemiBold14 = TextStyle(
  fontFamily: 'R',
  fontSize: 10.sp,
  fontWeight: FontWeight.w600,
  color: color94,
);
TextStyle colorB4Medium16 = TextStyle(
  fontFamily: 'M',
  fontSize: 11.2.sp,
  color: colorB4,
);
TextStyle primaryMedium16 = TextStyle(
  fontFamily: 'M',
  fontSize: 11.2.sp,
  color: primaryColor,
);
TextStyle primaryMedium12 = TextStyle(
  fontFamily: 'M',
  fontSize: 8.4.sp,
  color: primaryColor,
);
TextStyle primaryMedium14 = TextStyle(
  fontFamily: 'M',
  fontSize: 10.sp,
  color: primaryColor,
);
TextStyle blackMedium12 = TextStyle(
  fontFamily: 'M',
  fontSize: 8.4.sp,
  color: black,
);
TextStyle blackMedium14 = TextStyle(
  fontFamily: 'M',
  fontSize: 10.sp,
  color: black,
);
TextStyle blackBold18 = TextStyle(
  fontFamily: 'B',
  fontSize: 12.6.sp,
  color: black,
);
TextStyle blackBold16 = TextStyle(
  fontFamily: 'B',
  fontSize: 11.2.sp,
  color: black,
);
TextStyle color4dSemiBold16 = TextStyle(
  fontFamily: 'R',
  fontSize: 11.2.sp,
  fontWeight: FontWeight.w600,
  color: color4D,
);
TextStyle color94SemiBold16 = TextStyle(
  fontFamily: 'R',
  fontSize: 11.2.sp,
  fontWeight: FontWeight.w600,
  color: color94,
);
TextStyle color94SemiBold18 = TextStyle(
  fontFamily: 'R',
  fontSize: 12.5.sp,
  fontWeight: FontWeight.w600,
  color: color94,
);
TextStyle primarySemiBold14 = TextStyle(
  fontFamily: 'R',
  fontSize: 10.sp,
  fontWeight: FontWeight.w600,
  color: primaryColor,
);
TextStyle primarySemiBold16 = TextStyle(
  fontFamily: 'R',
  fontSize: 11.2.sp,
  fontWeight: FontWeight.w600,
  color: primaryColor,
);
TextStyle primarySemiBold18 = TextStyle(
  fontFamily: 'R',
  fontSize: 12.5.sp,
  fontWeight: FontWeight.w600,
  color: primaryColor,
);
TextStyle blackSemiBold16 = TextStyle(
  fontFamily: 'R',
  fontSize: 11.2.sp,
  fontWeight: FontWeight.w600,
  color: black,
);
TextStyle blackSemiBold20 = TextStyle(
  fontFamily: 'R',
  fontSize: 12.6.sp,
  fontWeight: FontWeight.w600,
  color: black,
);
TextStyle blackSemiBold18 = TextStyle(
  fontFamily: 'R',
  fontSize: 14.sp,
  fontWeight: FontWeight.w600,
  color: black,
);
TextStyle blackSemiBold14 = TextStyle(
  fontFamily: 'R',
  fontSize: 10.sp,
  fontWeight: FontWeight.w600,
  color: black,
);
TextStyle color17SemiBold16 = TextStyle(
  fontFamily: 'R',
  fontSize: 11.2.sp,
  fontWeight: FontWeight.w600,
  color: color17.withOpacity(.60),
);
TextStyle color94Medium16 = TextStyle(
  fontFamily: 'M',
  fontSize: 11.2.sp,
  color: color94,
);
