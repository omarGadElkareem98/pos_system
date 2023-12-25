import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobilysystem/Screens/ClientScreen.dart';

class AddClient extends StatefulWidget {
  const AddClient ({super.key});

  @override
  State<AddClient> createState() => _AddClientState();
}

class _AddClientState extends State<AddClient> {



  TextEditingController nameClientController = TextEditingController();
  TextEditingController NumberClient = TextEditingController();
  TextEditingController PhoneNumberController = TextEditingController();
  TextEditingController NationalIdController = TextEditingController();
  TextEditingController FriendClientController = TextEditingController();
  TextEditingController AdressController = TextEditingController();
  FirebaseFirestore Firestore = FirebaseFirestore.instance;
  var formKey = GlobalKey<FormState>();

  CollectionReference Clients = FirebaseFirestore.instance.collection("Clients");

  SaveClient () async {
   await  Clients.add({
      "Clientname" : nameClientController.text,
      "PhoneNumber" : PhoneNumberController.text,
      "Nationalid" : NationalIdController.text,
      "Friend" : FriendClientController.text,
      "Adress" : AdressController.text,
     "numberClient" : NumberClient.text

    }).then((value) => print('data added')).catchError((err) => print(err) );
  }
  



  @override







  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const  Text("اضافه عميل"),),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child:   SingleChildScrollView(
          child: Form(
            key: formKey ,
            child: Column(
              children: [
                TextFormField(
                  validator: (value){
                    if(value!.isEmpty){
                      return "البيانات مطلوبه ";
                    }
                  },

                  decoration: const InputDecoration(
                    label: Text('اسم العميل'),

                    hintText: 'اسم العميل',
                    border: OutlineInputBorder(

                    ),

                  ),

                  controller: nameClientController,

                ),
                const    SizedBox(height: 20,),
                TextFormField(
                  keyboardType: TextInputType.number,
                  validator: (value){
                    if(value!.isEmpty){
                      return "البيانات مطلوبه ";
                    }
                  },

                  controller: PhoneNumberController,
                  decoration: InputDecoration(
                      label: Text('  رقم موبايل'),
                      hintText: 'رقم  موبايل',
                      border: OutlineInputBorder()
                  ),
                ),
                const   SizedBox(height: 20,),
                TextFormField(
                  keyboardType: TextInputType.number,
                  validator: (value){
                    if(value!.isEmpty){
                      return "البيانات مطلوبه ";
                    }
                  },

                  controller: NumberClient,
                  decoration: InputDecoration(
                      label: Text('  رقم العميل في الدفتر'),
                      hintText: '  رقم العمبل في الدفتر ',
                      border: OutlineInputBorder()
                  ),
                ),
                const   SizedBox(height: 20,),
                TextFormField(
                  validator: (value){
                    if(value!.isEmpty){
                      return "البيانات مطلوبه ";
                    }
                  },
                  controller: NationalIdController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      label: Text('  رقم البطاقه'),
                      hintText: 'رقم  البطاقه',
                      border: OutlineInputBorder()
                  ),
                ),
                const    SizedBox(height: 20,),
                TextFormField(
                  validator: (value){
                    if(value!.isEmpty){
                      return "البيانات مطلوبه ";
                    }
                  },
                  controller: AdressController,
                  decoration: InputDecoration(
                      label: Text(' العنوان  '),
                      hintText: ' العنوان ',
                      border: OutlineInputBorder()
                  ),
                ),
                const   SizedBox(height: 20,),
                TextFormField(
                  validator: (value){
                    if(value!.isEmpty){
                      return "البيانات مطلوبه ";
                    }
                  },
                  controller: FriendClientController,
                  decoration: InputDecoration(
                      label: Text(' الضامن  '),
                      hintText: ' الضامن ',
                      border: OutlineInputBorder()
                  ),
                ),
                const   SizedBox(height: 20,),
                Container(
                    width: double.infinity,

                    child: ElevatedButton(
                        onPressed: (){

                          if(formKey.currentState!.validate()){
                            SaveClient();
                            showDialog(context: context, builder: (context){
                              return      Container(
                                child: Card(
                                  color: Colors.white,
                                    child: Center(child: Text("تمت الاضافه بنجاح" , style: TextStyle(color: Colors.green),))),
                              );
                            });
                            Navigator.push(context, MaterialPageRoute(builder: (context){
                              return   ClientScreen();
                            }));

                          }


                              nameClientController.text = "";
                              PhoneNumberController.text = "";
                              FriendClientController.text = "";
                              AdressController.text = "";
                              NationalIdController.text = "";
                              NumberClient.text = "";





                        },
                        style: const ButtonStyle(
                            backgroundColor: MaterialStatePropertyAll(
                               Colors.blue
                            )
                        ),
                        child: const  Text('اضافه عميل' ,style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold
                        ),)))


              ],
            ),
          ),
        ),
      ),
    );
  }
}
