
  import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobilysystem/Screens/Add_sales_Screen.dart';

class Sales extends StatefulWidget {
    const Sales({super.key});

    @override
    State<Sales> createState() => _SalesState();
  }

  class _SalesState extends State<Sales> {

  List SallerData = [];
  
    @override

    String nameSaler = "";
  String PhonenumberSeller = "";
  String Feez = "";
  String SellerFeez = "";
  String minus = "";
  
  
    getSallerData () async {

    QuerySnapshot querySnapshot = await FirebaseFirestore.instance.collection("Seller").get();

      SallerData.addAll(querySnapshot.docs);

      setState(() {

      });

    }

  void initState() {
    // TODO: implement initState
    getSallerData();
    super.initState();
  }

    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue.shade900,
          title: Text('الموردين'),
        ),
        floatingActionButton: FloatingActionButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context){
                return AddSales();
              }));
        } , child: Icon(Icons.add),),
        body: Column(
          children: [
            SizedBox(height: 15,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SearchBar(),
            ),
            SizedBox(
              height: 600,
              child: ListView.builder(
                  itemCount: SallerData.length,
                  itemBuilder: (context , index) {

                return Padding(
                  padding: const EdgeInsets.all(15),
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(18),
                    ),
                    child: ListTile(
                      title: Text('${SallerData[index]['nameSaller']}' , style: TextStyle(color: Colors.black , fontSize: 20),),

                      subtitle: Text('${SallerData[index]['PhoneNumberSaller']}' , style: TextStyle(color: Colors.black),),

                    ),
                  ),
                );
              }),
            )
          ],
        ),
        
      );
    }
  }
