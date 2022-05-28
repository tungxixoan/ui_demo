import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ui_demo/page/app_bar/app_bar_page.dart';
import 'package:ui_demo/page/backdrop_image_filter_widget.dart';
import 'package:ui_demo/page/input_widget.dart';
import 'package:ui_demo/page/snack_bar/snack_bar.dart';
import 'package:ui_demo/page/styling_widget.dart';
import 'package:ui_demo/page/text_widget/text_widget.dart';
import 'package:ui_demo/util/app_color.dart';

void main() {

  // Đổi màu thanh thông báo hệ thống// khu vực xung quanh tai thỏ
  // SystemChrome.setSystemUIOverlayStyle(
  //   SystemUiOverlayStyle(
  //     statusBarColor: AppColor.transParent 
  //   )
  // );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: AppColor.mainColor,
        primaryColorLight: AppColor.lightColor,
        colorScheme:
            ColorScheme.fromSwatch().copyWith(secondary: AppColor.accentColor),
      ),
      home: BackdropImageFilterWidget(),
    );
  }
}


