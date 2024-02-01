import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ClientDetails extends StatelessWidget {
   ClientDetails({super.key ,  required this.Clientname , required this.Clientid});

  @override

  String Clientname;
  String Clientid;

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${Clientname}"),
      ),
    );
  }
}
