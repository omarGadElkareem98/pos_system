
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobilysystem/Screens/ClientDetails.dart';
import 'package:mobilysystem/Screens/Client_detail.dart';
import 'package:mobilysystem/Screens/Parts_Client.dart';

class PartsScreen extends StatefulWidget {
  const PartsScreen({super.key});

  @override
  State<PartsScreen> createState() => _PartsScreenState();
}

class _PartsScreenState extends State<PartsScreen> {
  
  List ClientData = [];
  @override
  
  getClientData()async{
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance.collection("ClientDataParts").get();
    ClientData.addAll(querySnapshot.docs);
    
    setState(() {
      
    });
  }
  DeleteItem (index){
    FirebaseFirestore.instance.collection("ClientDataParts").doc('${ClientData[index].id}').delete();
  }
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getClientData();
  }
  
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("اقساط متاخره "),
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){
        Navigator.push(context, MaterialPageRoute(builder: (context){
          return PartsClient();
        }));
      } ,
        child: Icon(Icons.add) ,
      ),
      body: Column(
        children: [
          SizedBox(
            height: 600,
            child: ListView.builder(
              itemCount: ClientData.length,
                itemBuilder: (context , index){
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  color: Colors.grey.shade300,
                  child: ExpansionTile(
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("${ClientData[index]['nameClient']}"),
                          InkWell(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (contex){
                                return ClientDetails( Clientname: '', Clientid: '',);
                              }));
                            },
                              child: Icon(Icons.edit , color: Colors.blue.shade900,)),
                          InkWell(
                            onTap: (){
                            AwesomeDialog(
                                context: context,
                                dialogType: DialogType.warning,
                                animType: AnimType.rightSlide,


                                title: "تأكيد الحذف",
                                desc: "يعني خلاص هتحذف",
                              btnOkOnPress: (){
                                  DeleteItem(index);
                              },
                              btnCancelOnPress: (){

                              }
                            );
                            },
                              child: Icon(Icons.delete , color: Colors.red,))
                        ],
                      ),
                      children: [
                        Column(
                          children: [
                            Text(" قيمه القسط  ${ClientData[index]['MoneyValue']}"),
                            SizedBox(height: 12,),
                            Text(" تاريخ القسط  ${ClientData[index]['dateTime']}"),
                          ],
                        ),
                      ],
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
