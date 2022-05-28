import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GlobalSnackBar{
  final String msg;

  GlobalSnackBar({required this.msg});

  static show(
    BuildContext context,
    String msg,
  ){
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        elevation: 0.0,
        content: Text(msg),
        duration: Duration(seconds: 5),
        
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(topLeft: Radius.circular(12), topRight:  Radius.circular(12))),
        action: SnackBarAction(
          textColor: Colors.white,
          label: 'Oke',
          onPressed: (){},
        ),
      )
    );
  }
    
}