
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Widgets/Custom_App_bar.dart';

class InventorySale extends StatefulWidget {
  const InventorySale({super.key});

  @override
  State<InventorySale> createState() => _InventorySaleState();
}

class _InventorySaleState extends State<InventorySale> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('فاتوره بيع'),
        ),
        body: const  Padding(
          padding:  EdgeInsets.only(left: 20 , right: 20 , top: 30),
          child: Column(
            children: [
                SearchBar(
                  hintText: 'بيع منتح',

                )
            ],
          ),
        ),

      ),
    );
  }
}



