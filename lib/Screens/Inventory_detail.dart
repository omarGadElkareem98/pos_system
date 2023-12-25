
  import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class InventoryDetail extends StatefulWidget {
    const InventoryDetail({super.key});

    @override

    State<InventoryDetail> createState() => _InventoryDetailState();
  }

  class _InventoryDetailState extends State<InventoryDetail> {

  FirebaseFirestore firestore = FirebaseFirestore.instance;
  
  List InventoryData = [];

      getInventorydetail () async {
        
        QuerySnapshot querySnapshot = await FirebaseFirestore.instance.collection('inventroyData').get();
        
        InventoryData.addAll(querySnapshot.docs);
        setState(() {
          
        });

      }
    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(),
        body: Column(
          children: [
            SizedBox(
              height: 600,
              child: ListView.builder(itemBuilder: (context , index){
                return;
              }),
            )
          ],
        ),
      );
    }
  }
