import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class BackdropImageFilterWidget extends StatefulWidget {
  const BackdropImageFilterWidget({Key? key}) : super(key: key);

  @override
  State<BackdropImageFilterWidget> createState() =>
      _BackdropImageFilterWidgetState();
}

class _BackdropImageFilterWidgetState extends State<BackdropImageFilterWidget> {
  String title = "Backdrop - Image Filter Widget";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        centerTitle: true,
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          ConstrainedBox(
            constraints: BoxConstraints.expand(),
            child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage("assets/images/venom.jpg")),
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                child: _infoCard(context, "Salis"),
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: _bottomIconButton(
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.navigate_next,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

Widget _bottomIconButton(Widget child) {
  return ClipRRect(
    borderRadius: BorderRadius.circular(50),
    child: BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
      child: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.3), shape: BoxShape.circle),
        child: child,
      ),
    ),
  );
}

Widget _cardEdge(Widget child) {
  return ClipRRect(
    borderRadius: BorderRadius.circular(15),
    child: BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
      child: child,
    ),
  );
}

Widget _infoCard(BuildContext context, String title) {
  return _cardEdge(
    Container(
      key: ValueKey<String>(title),
      height: MediaQuery.of(context).size.height / 4,
      width: MediaQuery.of(context).size.width / 1.2,
      color: Colors.white.withOpacity(0.3),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              title,
              style: TextStyle(
                fontSize: 18,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              textAlign: TextAlign.justify,
              'We take pride in our platform. Our free temporary phone numbers are updated every month so make sure to bookmark us and check back for the latest numbers. Our temporary phone numbers service is completely free and there is no sign-up needed.',
              style: TextStyle(
                  fontSize: 18, color: Colors.white, ),
            ),
          )
        ],
      ),
    ),
  );
}
