import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:ui_demo/util/app_color.dart';

class TextWidget extends StatefulWidget {
  const TextWidget({Key? key}) : super(key: key);

  @override
  State<TextWidget> createState() => _TextWidgetState();
}

class _TextWidgetState extends State<TextWidget> {
  String title = 'Text Widget';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: Text(title),
        centerTitle: false,
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(16.0),
            /// DefaultTextStyle được sử dụng khi ta có nhiều đoạn hội thoại có cũng một kiểu Style,
            child: DefaultTextStyle(
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black,
                inherit: true,
                // Thêm gạch chân phía dưới Text
                decoration: TextDecoration.underline,
                // Setting màu cho dấu gạch chân
                decorationColor: AppColor.mainColor,
                // Tạo hiệu ứng 'wavy' cho gạch chân phía dưới Text
                decorationStyle: TextDecorationStyle.wavy,
              ),
              child: Text("DefaultTextStyle"),
            ),
          ),
          /// RichText được sử dụng khi trong một đoạn hội thoại có các phần tử có kiểu style khác biệt
          /// Ta sử dụng các thẻ TextSpan để bọc riêng các phần tử này sau đó custome style riêng cho từng Span
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: RichText( 
              text: TextSpan(
                text: 'RichText',
                style: DefaultTextStyle.of(context).style,
                children: [
                  TextSpan(
                    text: 'Bold',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  TextSpan(
                    text: 'Flutter',
                  )
                ]
              )
            ),
          ),
          ///Text
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Hello Worlds, I coming', 
              textAlign: TextAlign.center,
              // style: DefaultTextStyle.of(context).style,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          ///  Text với Overflow
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Hello Worlds, I coming Hello Worlds, I coming Hello Worlds, I coming Hello Worlds, I coming',
              // Khi độ dài của chuối vượt quá kích thước khung chứa thì sẽ hiển thị dấu '...' 
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          /// Text.rich có chức năng tương tự như RichText.
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text.rich(
              TextSpan(
                text: 'Hello',
                children: [
                  TextSpan(text: 'How', style: TextStyle(fontStyle: FontStyle.italic)),
                  TextSpan(text: 'are you?,', style: TextStyle(fontWeight: FontWeight.bold))
                ]
              )
            ),
          )

        ],
      ),
    );
  }
}