
  import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobilysystem/Screens/Add_sales_Screen.dart';
import 'package:url_launcher/url_launcher.dart';

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
              child: SearchBar(
                hintText: 'بحث عن مورد',
              ),
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
                    child: ExpansionTile(
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                Text("${SallerData[index]['nameSaller']}"),
                                Text("${SallerData[index]['PhoneNumberSaller']}")
                              ],
                            ),
                            GestureDetector(
                              onTap: (){
                                CallPhoneNumber(index);
                              },
                                child: Icon(Icons.phone , color: Colors.green,)),
                          ],
                        ),
                      children: [
                        Column(
                          children: [
                              Text("دفعت كام :- ${SallerData[index]['Fezz']}"),
                            Text("هو ليه كام :- ${SallerData[index]['Feezbuy']}"),


                          ],
                        ),
                      ],
                    )
                  ),
                );
              }),
            )
          ],
        ),
        
      );
    }
  void CallPhoneNumber (index) async{
    String PhoneNumber = '+${SallerData[index]['PhoneNumberSaller']}';
    var phoneUrl = 'tel://$PhoneNumber';

    await  launch(phoneUrl);
  }
  }
