import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:ui_demo/page/snack_bar/global_snack_bar.dart';

class SnackBarCus extends StatefulWidget {

  const SnackBarCus({Key? key}) : super(key: key);

  @override
  State<SnackBarCus> createState() => _SnackBarCusState();
}

class _SnackBarCusState extends State<SnackBarCus> {
  
  String title = 'SnackBar';
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        centerTitle: true,
      ),
      body: Builder(
        builder: (context) {
          return Center(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                side: const BorderSide(
                  width: 1.0, 
                  color: Colors.red,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30)
                )
              ),
              onPressed: () {
                GlobalSnackBar.show(context, 'Hello my friend');
              }, 
              child: Text(title),
            ),
          );
        }
      ),
    );
  }
}