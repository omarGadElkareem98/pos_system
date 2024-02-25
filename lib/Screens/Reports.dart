  import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Reports extends StatefulWidget {
    const Reports({super.key , this.userPayment, this.userData});

    final userPayment;
    final userData;

    @override
    State<Reports> createState() => _ReportsState();
  }

  class _ReportsState extends State<Reports> {

  List userPayment = [];




    getuserPayments () async {

      QuerySnapshot querySnapshot = await FirebaseFirestore.instance.collection("userPayments").get();

      userPayment.addAll(querySnapshot.docs);

      setState(() {

      });

    }

    @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getuserPayments();
  }

    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(),
        body:  SizedBox(
          height: 600,
          child: ListView.builder(
            itemCount: userPayment.length,
              itemBuilder: (context , index){
                return Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Table(

                      children: [
                        TableRow(
                            children: [
                              TableCell(child: Center(child: Text("تاريخ الدفع "))),
                              TableCell(child: Center(child: Text(" قيمه القسط"))),
                              TableCell(child: Center(child: Text("السعر"))),
                              TableCell(child: Center(child: Text("  رقم الايصال"))),
                            ]
                        ),

                        TableRow(
                            children: [
                              TableCell(child: Center(child: Text("${userPayment.elementAt(index)['Date']}"))),
                              TableCell(child: Center(child: Text("${userPayment.elementAt(index)['FaiseMoney']}"))),
                              TableCell(child: Center(child: Text("${userPayment.elementAt(index)['Date']}"))),
                              TableCell(child: Center(child: Text("${userPayment.elementAt(index)['IdNumber']}"))),
                            ]
                        ),
                      ],
                    ),
                  ),
                );
              }
          ),
        )
      );
    }
  }
