
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mobilysystem/Screens/Client_Inventory.dart';
import 'package:mobilysystem/Screens/Client_detail.dart';
import 'package:url_launcher/url_launcher.dart';

import 'Add_Client_Screen.dart';

  class ClientScreen extends StatefulWidget {


    static const  idScreen = "clientScreen";

     ClientScreen({super.key , });

    @override
    State<ClientScreen> createState() => _ClientScreenState();
  }

  class _ClientScreenState extends State<ClientScreen> {



    List DataClient = [];

    FirebaseFirestore Firestore = FirebaseFirestore.instance;

     String ?nameClient ;
     String ?PhoneNumber;
     String ?NationalId ;
     String  ?Adress ;
     String ? Friend ;


     List Newusers = [];

     getClientData () async {

       QuerySnapshot querySnapshot = await FirebaseFirestore.instance.collection('Clients').orderBy("numberClient").get();

       DataClient.addAll(querySnapshot.docs);

       setState(() {

       });

     }

     void SrearchResults (String enteredKeyword){

       List reuslts = [];
       if(enteredKeyword.isEmpty){
         reuslts = DataClient;

       } else {
         reuslts = DataClient.where((client) => client['numberClient']).toList();
       }
       setState(() {
         Newusers = reuslts;
       });

     }

    @override
    void initState() {
      // TODO: implement initState
     getClientData();
     Newusers = DataClient;

      super.initState();
    }
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: Text('العملاء'),
        ),
       floatingActionButton: FloatingActionButton(
         onPressed: (){
           Navigator.push(context, MaterialPageRoute(builder: (context){
             return const AddClient();
           }));
         } ,
         child: Icon(Icons.add),

         ),

        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 12,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SearchBar(
                  hintText: "ابحث",

                  leading: Icon(Icons.search),
                ),
              ) ,


              DataClient.isEmpty ? Center(child: Text("لا يوجد عملاء" , style: TextStyle(
                color: Colors.black,
                fontSize: 22
              ),),) : SizedBox(
                height: 700,
                child: ListView.builder(

                    itemCount: DataClient.length,
                    itemBuilder: (context , index){

                      return  Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Card(
                          color: Colors.grey.shade300,
                          child: ExpansionTile( title: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [


                              Text("${DataClient[index]['Clientname']}"),

                              GestureDetector(
                                  onTap: (){
                                    AwesomeDialog(
                                        context: context,
                                        dialogType: DialogType.warning,
                                        title: "حذف",
                                        desc: "متاكد من الحذف",
                                        btnOkOnPress: () async{
                                          print("deleted");
                                          await FirebaseFirestore.instance.collection("Clients").doc(DataClient[index].id).delete();






                                        },
                                        btnCancelOnPress: (){
                                          print("cancel delete");


                                        }

                                    ).show();
                                  },
                                  child: Icon(Icons.delete,color: Colors.redAccent, size: 25,)),

                              GestureDetector(
                                  onTap: (){
                                    Navigate(index);
                                  },
                                  child: Icon(Icons.inventory , color: Colors.blue,)),
                              GestureDetector(
                                  onTap: (){
                                    CallPhoneNumber(index);
                                  },
                                  child: Icon(Icons.phone , color: Colors.blue,)),
                              GestureDetector(
                                  onTap: (){
                                    SendMessageByWatsapp(index);
                                  },
                                  child: Icon(Icons.messenger , color: Colors.green,))
                            ],
                          ) , children: [
                            Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(  "  رقم التليفون:- ${DataClient[index]['PhoneNumber']}"),
                                    SizedBox(height: 20,),
                                    Text(  "    العنوان:- ${DataClient[index]['Adress']}"),
                                    SizedBox(height: 20,),
                                    Text("   اسم الضامن:-  ${DataClient[index]['Friend']}"),
                                    SizedBox(height: 20,),
                                    Text("    رقم البطاقه:-  ${DataClient[index]['Nationalid']}"),
                                    SizedBox(height: 15,),
                                    Text("    رقم العميل ف الدفتر:-  ${DataClient[index]['numberClient']}" , style: TextStyle(fontWeight: FontWeight.bold),),

                                  ],
                                )
                            )
                          ],  ),
                        ),
                      );
                    }
                ),
              )


            ],
          )
        ),
      );
    }
    void CallPhoneNumber (index) async{
      String PhoneNumber = '+${DataClient[index]['PhoneNumber']}';
      var phoneUrl = 'tel://$PhoneNumber';

      await  launch(phoneUrl);
    }
    void SendMessageByWatsapp(index)async{

      String PhoneNumber = '${DataClient[index]['PhoneNumber']}';

      await  launch('https://wa.me/$PhoneNumber?text=hello');

    }
    void Navigate (index){
       Navigator.push(context, MaterialPageRoute(builder: (context){
         return ClientInventroy(name: '${DataClient.elementAt(index)['Clientname']}', ClientNumber: '${DataClient.elementAt(index)['numberClient']}',);
       }));
    }
  }

