
  import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';
import 'package:mobilysystem/Screens/Inventory_table.dart';

class InventoryDetail extends StatefulWidget {



    const InventoryDetail({super.key});

    @override

    State<InventoryDetail> createState() => _InventoryDetailState();
  }

  class _InventoryDetailState extends State<InventoryDetail> {

  FirebaseFirestore firestore = FirebaseFirestore.instance;
  
  List InventoryData = [];


  List ClientsName = [];
  List<String>ClientsNameTest = [];
  List<String>ClientsNumberTest = [];

      getInventorydetail () async {
        
        QuerySnapshot querySnapshot = await FirebaseFirestore.instance.collection('Clients').get();
        
        ClientsName.addAll(querySnapshot.docs);
        setState(() {
          
        });

      }
  getInventorydetailTest() async {

  FirebaseFirestore.instance.collection('Clients').get().then((value) 
  {
    value.docs.forEach((element) 
    {
      ClientsNameTest.add(element.data()['Clientname']);
      ClientsNumberTest.add(element.data()['numberClient']);
    });
    setState(() {

    });
  });

  }

      NavigateToInventoryDetail(index){
        Navigator.push(context, MaterialPageRoute(builder: (context){
          return InventoryTable(client: ClientsNameTest[index], clientNumber: ClientsNumberTest[index], );
        }));
      }

      @override
  void initState() {
    // TODO: implement initState
    //    getInventorydetail();
        getInventorydetailTest();
    super.initState();
  }
    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: Text('فواتير العملاء'),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: SearchBar(
                  hintText: "بحث عن عميل",
                ),
              ),
              SizedBox(height: 15,),

              SizedBox(
                height: 650,
                child: ListView.builder(
                  itemCount: ClientsNameTest.length,
                    itemBuilder: (context , index)
                    {
                      return ExpansionTile(
                          title: Row(
                            children: [
                              Text(ClientsNameTest[index]),
                              TextButton(onPressed: (){
                                NavigateToInventoryDetail(index);
                              }, child: Text("عرض الفاتوره"))
                            ],
                          ),

                      );
                    }
                ) ,
              )


            ],
          ),
        )
      );
    }
  }
