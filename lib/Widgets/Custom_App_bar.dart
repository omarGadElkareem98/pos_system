
  import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatefulWidget {




     CustomAppBar({super.key});

    @override
    State<CustomAppBar> createState() => _CustomAppBarState();
  }

  class _CustomAppBarState extends State<CustomAppBar> {
    String ?PageName;
    @override
    Widget build(BuildContext context) {
      return Container(
        width: double.infinity,

        decoration: BoxDecoration(
          color: Colors.blue
        ),
        child: Column(
          children: [
            Text('$PageName')
          ],
        ),
      );
    }
  }
