import 'package:flutter/material.dart';

class AddClient extends StatelessWidget {
   AddClient({super.key});

  @override

  TextEditingController _nameClientController = TextEditingController();
   TextEditingController _DataCount = TextEditingController();
   TextEditingController _ValueParts = TextEditingController();


  var formKey = GlobalKey<FormState>();

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
                    label: Text('اسم المورد'),

                    hintText: 'اسم المورد',
                    border: OutlineInputBorder(

                    ),

                  ),

                  controller: _nameClientController,

                ),
                const    SizedBox(height: 20,),

                const   SizedBox(height: 20,),

                const    SizedBox(height: 20,),

                const   SizedBox(height: 20,),


                const   SizedBox(height: 20,),
                Container(
                    width: double.infinity,

                    child: ElevatedButton(
                        onPressed: (){

                          if(formKey.currentState!.validate()){

                          }





                        },
                        style: const ButtonStyle(
                            backgroundColor: MaterialStatePropertyAll(
                                Colors.teal
                            )
                        ),
                        child: const  Text('اضافه مورد' ,style: TextStyle(
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
