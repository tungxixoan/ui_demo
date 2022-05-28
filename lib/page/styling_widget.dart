import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class StylingWidget extends StatefulWidget {
  const StylingWidget({Key? key}) : super(key: key);

  @override
  State<StylingWidget> createState() => _StylingWidgetState();
}

class _StylingWidgetState extends State<StylingWidget> {

  String title = 'Styling Widget';
  double paddingValue = 20;
  bool isLightTheme = true;

  // khởi tạo setState cho animatedPadding
  animatedPadding(){
    setState(() {
      // Nếu giá trị của paddingValue  = 20 thì sẽ đổi giá trị của paddingValue = 100
      // Nếu giá trị không = 20 thì sẽ đổi trở về thành 20
      paddingValue == 20? paddingValue=100: paddingValue = 20;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// ConstrainedBox tạo một kích thước ràng buộc đối với các widget con bên trong nó.
            ConstrainedBox(
              constraints: BoxConstraints(
                maxHeight: MediaQuery.of(context).size.height/4,
                maxWidth: MediaQuery.of(context).size.width,
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Container(
                  color: Colors.red,
                ),
              ),
            ),
            /// AnimatedPadding là widget có hiêu ứng animation dùng để thay đổi vị trí vũng chứa theo padding
            AnimatedPadding(
              padding: EdgeInsets.all(paddingValue), 
              // Thời gian thực hiện hiệu ứng
              duration: Duration(milliseconds: 300),
              //Hiệu ứng của animation của animatedPadding
              curve: Curves.fastOutSlowIn,
              // InkWell widget cho phép onTap hoặc thay đổi trạng thái hoặc thực hiện một hoạt động nào đó
              child: InkWell(
                // Thưc hiện Hiệu ứng animation đã khỏi tạo phía trên
                onTap: () {
                  animatedPadding();
                },
                child: Container(
                  height: 124,
                  width: 124,
                  color: Colors.orangeAccent,
                ),
              ),
            ),
            // Sử dụng Theme để khởi tạo lại màu cho primaryColor
            Theme(
              data: ThemeData(
                primaryColor: Colors.purple,
              ), 
              child: Container(
                height: 150,
                width: 150,
                color: Theme.of(context).primaryColor,
              )
            ),
            Padding(
              padding: EdgeInsets.all(16.0),
              /// AnimatedTheme có hiệu ứng animation cho theme
              child: AnimatedTheme(
                duration: Duration(seconds: 5),
                // Nếu isLightTheme = giá trị ban đầu (ở đây là true) thì sẽ hiện ThemeData.light()
                // Nếu isLightTheme != giá trị ban đầu thì sẽ hiện ThemeData.dark()
                data: isLightTheme ? ThemeData.light(): ThemeData.dark(),
                curve: Curves.fastLinearToSlowEaseIn,
                child: Builder(
                  builder: (BuildContext context) {
                    return InkWell(
                      onTap: () {
                        setState(() {
                          // Sau khi thực hiện hành động, trạng thái của isLightTheme sẽ thay đổi
                          isLightTheme = !isLightTheme;
                        });
                      },
                      child: Container(
                        height: 200,
                        width: 200,
                        color: Theme.of(context).primaryColor,
                      ),
                    );
                  }
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}