  import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InventoryTable extends StatefulWidget {

     InventoryTable({super.key , required this.Clientname});

     String Clientname;

  @override
  State<InventoryTable> createState() => _InventoryTableState();
}

class _InventoryTableState extends State<InventoryTable> {
    List  InventoryData =[];



    getInventoryData () async {
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance.collection('inventroyData').get();

      InventoryData.addAll(querySnapshot.docs);
      setState(() {

      });
    }
    @override
  void initState() {
    // TODO: implement initState
      getInventoryData();
    super.initState();
  }

    @override

    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: Text(widget.Clientname),
        ),
        body: ListView.builder(
          itemCount: InventoryData.length,
            itemBuilder: (context , index){
          return Padding(
              padding: const EdgeInsets.only(right: 30 , top: 30 , left: 30),
              child: Column(
                children: [
                  Row(children: [
                    Text("اسم الغميل") ,
                    SizedBox(width: 10,),
                    Text("اسم الصنف") ,
                    SizedBox(width: 10,),
                    Text("سعر لبيع")
                  ],) ,
                  Row(
                    children: [
                      Text(widget.Clientname) ,
                      Text("${InventoryData[index]['InvoicenameProduct']}")
                    ],
                  )
                ],
              )
          );
        })
      );
    }

    TableRow BuildRow (List <String> cells  ) => TableRow(
      children: cells.map((cell) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(child: Text(cell)),
      )).toList()
    );
}
