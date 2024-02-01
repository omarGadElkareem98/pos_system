
  import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mobilysystem/Screens/Inventory_table.dart';

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

      NavigateToInventoryDetail(index){
        Navigator.push(context, MaterialPageRoute(builder: (context){
          return InventoryTable(Clientname: '${InventoryData[index]['nameClient']}',);
        }));
      }

      @override
  void initState() {
    // TODO: implement initState
        getInventorydetail();
    super.initState();
  }
    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: Text('فواتير العملاء'),
        ),
        body: SizedBox(
          height: 700,
          child: ListView.builder(
            itemCount: InventoryData.length,
              itemBuilder: (context ,  index){
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                color: Colors.grey.shade100,
                child: ExpansionTile(

                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("   ${InventoryData[index]['nameClient']}") ,

                        TextButton(onPressed: (){
                          NavigateToInventoryDetail(index);
                        }, child: Text('تفاصيل الفاتوره'))

                      ],
                    ),
                    children: [
                      Text(" اسم الصنف :- ${InventoryData[index]['InvoicenameProduct']}" , style: TextStyle(
                        fontWeight: FontWeight.bold
                      ),),
                      Text(" سعر الكاش  :- ${InventoryData[index]['DierctPrice']}" , style: TextStyle(
                          fontWeight: FontWeight.bold
                      ),),

                    ],
                ),
              ),
            );
          }),
        )
      );
    }
  }
