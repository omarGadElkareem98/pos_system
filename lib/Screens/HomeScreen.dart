

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mobilysystem/Screens/BankScreen.dart';
import 'package:mobilysystem/Screens/Inventory_buy.dart';
import 'package:mobilysystem/Screens/Parts.dart';

import 'package:mobilysystem/Screens/Sales.dart';
import 'package:mobilysystem/Screens/StockScreen.dart';
import 'package:mobilysystem/Widgets/Custom_App_bar.dart';

import 'ClientScreen.dart';
import 'Inventory_detail.dart';



class HomeScreen extends StatefulWidget {
  static const  idScreen = "HomeScreen";
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {




  @override

  String Url = "https://scontent.fcai21-4.fna.fbcdn.net/v/t39.30808-6/399722209_1500757750465144_4706788816244789326_n.jpg?_nc_cat=111&ccb=1-7&_nc_sid=efb6e6&_nc_eui2=AeHMiYiG3YoSzpPCddBTzBGTPl7FPid3btI-XsU-J3du0u_wkY4N5H1u35A8s-8ic5DOVXFxOsk41mxvmzkGkfsV&_nc_ohc=f74nNoeno_kAX9RSkdZ&_nc_ht=scontent.fcai21-4.fna&oh=00_AfAfoxoRNBpQCEtIAOWgzHntDg6aIC6xgE0T_iHL8cZz2Q&oe=6583A307";

  final    List<Map<String , dynamic>>  DataStore = [
    { "name" : 'العملاء ',
      "ImageUrl" : 'https://icons.veryicon.com/png/o/miscellaneous/cloud-keeper/client-7.png'},

    { "name" :  'فاتوره بيع',
      "ImageUrl" : 'https://www.shutterstock.com/image-vector/check-mark-icon-260nw-1015124191.jpg'},
    { "name" : 'فاتوره شراء',
      "ImageUrl" : 'https://www.insightrobotics.com/wp-content/uploads/2018/10/inventory-icon-1.png'},
    { "name" :  'الموردون',
      "ImageUrl": 'https://static.thenounproject.com/png/2620662-200.png'},
    { "name" :  ' المخزون',
      "ImageUrl" :  'https://i.pinimg.com/564x/dd/31/84/dd3184f55d2908ef8c35b85d00553bcb.jpg'},
    { "name" :  ' تقسيط',
      "ImageUrl" :  'https://e7.pngegg.com/pngimages/214/501/png-clipart-computer-icons-price-installment-text-sign.png'},

  ];



  Widget build(BuildContext context) {
    return Scaffold(
    
      appBar: AppBar(
        title: Text('Mobily' , style: TextStyle(color: Colors.white),),
        actions: [
          Icon(Icons.search),
        ],
        elevation: 10,
      ),
    
      drawer:  SafeArea(
        child: Drawer(

          width: 250,
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
              
                  // Container(
                  //   width: double.infinity,
                  //   height: 200,
                  //   decoration: BoxDecoration(
                  //     image: DecorationImage(image: AssetImage("assets/images/omar.jpg"))
                  //   ),
                  // ),
                  CircleAvatar(
                    radius: 100,
                    backgroundImage: AssetImage('assets/images/omar.jpg',),
                  ),
                  SizedBox(height: 10,),
                  Align(
                    alignment: Alignment.topRight,
                      child: Text("مطور التطبيق:- " , style: TextStyle(fontWeight: FontWeight.bold , fontSize: 18),)),
                  Text("Omar Sabry" , style: TextStyle(fontStyle: FontStyle.italic , fontWeight: FontWeight.bold , fontSize: 19), ) ,
                  SizedBox(height: 10,),
                  Text(" junior Software developer") ,
                  SizedBox(height: 10,),
                  Text("Call Me :- 01156467293") ,
                  SizedBox(height: 10,),
                  Text("omarsabry8989@gmail.com") ,
                  Divider(
                    thickness: 3,
                  ) ,
                  SizedBox(height: 15,),
              

                  SizedBox(height: 15,),
                  GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) {
                        return InventoryBuy();
                      }) );
                    },
                    child: Row(
                      children: [
                        Icon(Icons.point_of_sale),
                        SizedBox(width: 10,),
                        Text("فاتوره شراء" , style: TextStyle(fontStyle: FontStyle.italic ,fontWeight: FontWeight.bold , fontSize: 18),)
                      ],
                    ),
                  ),
                  SizedBox(height: 15,),
                  GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) {
                        return ClientScreen();
                      }) );
                    },
                    child: Row(
                      children: [
                        Icon(Icons.person),
                        SizedBox(width: 10,),
                        Text(" العملاء" , style: TextStyle(fontStyle: FontStyle.italic ,fontWeight: FontWeight.bold , fontSize: 18),)
                      ],
                    ),
                  ),
                  SizedBox(height: 15,),
                  GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) {
                        return StockScreen();
                      }) );
                    },
                    child: Row(
                      children: [
                        Icon(Icons.store_mall_directory),
                        SizedBox(width: 10,),
                        Text(" المخزن" , style: TextStyle(fontStyle: FontStyle.italic ,fontWeight: FontWeight.bold , fontSize: 18),)
                      ],
                    ),
                  ),
                  SizedBox(height: 15,),
              
              
                  Container(
                    width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(17),
                      ),
                      child: MaterialButton(onPressed: (){} , color: Colors.blue.shade900, child: Text('تسجيل خروج' , style: TextStyle(color: Colors.white , fontWeight: FontWeight.bold , fontSize: 18),),))
                  
                ],
              ),
            ),
          ),
        ),
      ),
    
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(image: NetworkImage('https://images.unsplash.com/photo-1509017174183-0b7e0278f1ec?q=80&w=2071&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'),fit: BoxFit.cover)
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 15,),

              const    Text("Mobily For Electronic",style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20
              ),),

              const   SizedBox(height: 15,),

              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Container(

                  child: Column(
                    children: [



                      const     SizedBox(height: 18,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          GestureDetector(

                              onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context){
                                  return ClientScreen();
                                }) );
                              },

                              child: CategoryItem(ImageUrl: 'https://icons.veryicon.com/png/o/miscellaneous/cloud-keeper/client-7.png', text: 'العملاء')),

                          GestureDetector(
                              onTap: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context) {
                                  return Sales();
                                }));
                              },
                              child: CategoryItem(ImageUrl: 'https://static.thenounproject.com/png/2620662-200.png', text: 'الموردون')),
                        ],
                      ),
                      const  SizedBox(height: 18,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          InkWell(
                              onTap : (){
                                Navigator.push(context, MaterialPageRoute(builder: (context){
                                  return StockScreen();
                                }));
                              } ,
                              child:
                              CategoryItem(ImageUrl: 'https://i.pinimg.com/564x/dd/31/84/dd3184f55d2908ef8c35b85d00553bcb.jpg', text: 'المخزن')),
                          InkWell(
                              onTap : (){
                                Navigator.push(context, MaterialPageRoute(builder: (context){
                                  return InventoryDetail();
                                }));
                              } ,
                              child:
                              CategoryItem(ImageUrl: 'https://cdn-icons-png.flaticon.com/512/6798/6798995.png', text: 'فواتير')),



                        ],
                      ),
                      SizedBox(height: 15,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          InkWell(
                              onTap : (){
                                Navigator.push(context, MaterialPageRoute(builder: (context){
                                  return BankScreen();
                                }));
                              } ,
                              child:
                              CategoryItem(ImageUrl: 'https://cdn-icons-png.flaticon.com/512/4770/4770298.png', text: 'الخزنه')),



                        ],
                      ),

                    ],
                  ),
                ),
              )

            ],
          )
        ),
      ),


    );
  }
}

class CategoryItem extends StatelessWidget {

  final String ImageUrl;
  final String text;
  const CategoryItem({Key? key, required this.ImageUrl, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(

      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: 100,

          child: Column(
            children: [
              Image.network(ImageUrl, width: 60, fit: BoxFit.cover,),
              SizedBox(height: 15,),

              Text(text , style: TextStyle(fontSize: 20 , fontWeight: FontWeight.bold),)
            ],
          ),
        ),
      ),
    );
  }
}

