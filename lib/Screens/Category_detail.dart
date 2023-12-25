
  import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Categorydetail extends StatelessWidget {
  final String id;
  final String title;

    const Categorydetail( this.title , this.id );

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: Center(child: Text(title)),
      );
    }
  }
