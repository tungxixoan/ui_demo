import 'package:flutter/material.dart';
import 'package:ui_demo/util/app_color.dart';

class AppBarPage extends StatefulWidget {
  const AppBarPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<AppBarPage> createState() => _AppBarPageState();
}

class _AppBarPageState extends State<AppBarPage> {
  Icon searchBtn = const Icon(Icons.search);
  Widget appBarTitle = const Text('HomePage');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        centerTitle: false,
        title: appBarTitle,
        // flexibleSpace  dùng để tạo một khu vực, mà khu vực đó có độ cao tùy biến với độ cao của AppBar
        flexibleSpace: Container(
          decoration: BoxDecoration(
              // gradient  dùng để tạo hiệu ứng chuyển màu cho màu nền
              gradient: LinearGradient(
                  // Chọn vị trí đổi màu 
                  begin: Alignment.topCenter,
                  // end: const Alignment(0, 1),
                  // Chọn màu để thực hiện hiệu ứng chuyển màu // Có thể chọm nhiều hơn 2 màu 
                  colors: [AppColor.mainColor, AppColor.lightColor,])),
        ),
        actions: <Widget>[
          IconButton(
              icon: searchBtn,
              onPressed: () {
                setState(() {
                  // Khi ta  nhấn vào Icon, nếu Icon đang có giá trị là Icons.search thì
                  if (searchBtn.icon == Icons.search) {
                    // Chuyển đổi searchBtn thành new Icon(Icons.close)
                    searchBtn = new Icon(Icons.close);
                    // Chuyển đổi appBarTitle thành Widget TextField()
                    appBarTitle = TextField(
                      // AutoFocus là thuộc tính bool, nó tạo hiệu ứng tiêu điểm,
                      // đơn giản là nó sẽ nháy nháy Con_trỏ(Cursor) ngay đoạn văn bản của TextFiled  ngay khi nó hiển thị
                      // mục đích đơn giản là gây hiệu ứng hấp dẫn người dùng và thông báo cho họ biết là "chỗ này đang cần nhập vào thông tin"
                      autofocus: true,
                      // Màu của Con_trỏ
                      cursorColor: AppColor.accentColor,
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                      decoration: const InputDecoration(
                          border: InputBorder.none,
                          // filled là thuộc tính bool, nếu True thì sẽ có một lớp màu nền của trong khu vực TextStyle
                          filled: true,
                          //Thêm một Icon trước phần Nhập thông tin vào
                          prefixIcon: Icon(
                            Icons.search,
                            color: Colors.white,
                          ),
                          // hintText sẽ hiển thị một String tronh InputDecoration, nó sẽ biến mất khi người dùng bắt đầu nhập thông tin
                          hintText: "Search ...",
                          hintStyle: TextStyle(color: Colors.white)),
                    );
                  } else {
                    searchBtn = const Icon(Icons.search);
                    appBarTitle = const Text('HomePage');
                  }
                });
              })
        ],
      ),
      body: const Center(child: Text('HomePage')),
    );
  }
}