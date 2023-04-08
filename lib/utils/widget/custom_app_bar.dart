import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../constant.dart';

class CustomAppBar extends StatelessWidget {
  final TextStyle? titleStyle;
  final bool? centerTitle;
  final String? title;
  final List<Widget>? action;

  const CustomAppBar({Key? key, this.titleStyle, this.centerTitle, this.title, this.action}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      actions: action,
      automaticallyImplyLeading: true,
      iconTheme: const IconThemeData(
        color: Colors.black, //change your color here
      ),
      backgroundColor: transparent,
      systemOverlayStyle: const SystemUiOverlayStyle(
        // Status bar brightness (optional)
        statusBarIconBrightness: Brightness.dark, // For Android (dark icons)
        statusBarBrightness: Brightness.light, // For iOS (dark icons)
        statusBarColor: transparent,
      ),
      elevation: 0,
      centerTitle: centerTitle,
      title: centerTitle == false
          ? Align(
              alignment: Localizations.localeOf(context) == const Locale('ar') ? const Alignment(1.2, 0) : const Alignment(-1.2, 0),
              child: Text(
                title.toString(),
                style: titleStyle ?? blackBold18,
                maxLines: 1,
              ),
            )
          : Text(
              title.toString(),
              style: titleStyle ?? blackBold18,
              maxLines: 1,
            ),
    );
  }
}
