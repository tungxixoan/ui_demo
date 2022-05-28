import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class InputWidget extends StatefulWidget {
  const InputWidget({Key? key}) : super(key: key);

  @override
  State<InputWidget> createState() => _InputWidgetState();
}

class _InputWidgetState extends State<InputWidget> {
  String title = 'Input Widget';
  //Tạo một khóa chung nhận dạng duy nhất Form widget và cho phép xác thực biểu mất
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),

        /// Form hoạt động như là một container chứa các nhóm và xác thức nhiều biểu mẫu
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                cursorColor: Colors.purple,
                decoration: InputDecoration(
                  hintText: 'Enter your first name',
                ),
                // Validator nhận được giá trị text mà người dùng đã nhập
                validator: (value) {
                  //Nếu giá trị nhập vào null hoặc trống thì xuát ra màn hình 1 thông báo ngay phía TextFormField
                  if (value!.isEmpty) {
                    return 'Please enter first name';
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                cursorColor: Colors.purple,
                decoration: InputDecoration(
                  hintText: 'Enter your last',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter last name';
                  }
                  return null;
                },
              ),
              ElevatedButton(
                onPressed: () {
                  // Validate trả về true nếu biểu mẫu hợp lệ hoặc false nếu không.
                  if (formKey.currentState!.validate()) {
                    // Nếu biểu mẫu hợp lệ, hãy hiển thị một thanh SnackBar.
                    // Trong thực tế, bạn thường gọi một máy chủ hoặc lưu thông tin trong cơ sở dữ liệu.
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Processing Data')),
                    );
                  }else{
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('No data being enter')),
                    );
                  }
                },
                child: Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
