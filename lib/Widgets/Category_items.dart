
  import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobilysystem/Screens/Category_detail.dart';

class CategoryItem extends StatelessWidget {
  final String title;
  final String ImageUrl;
  final String id;
    const CategoryItem({super.key, required this.title, required this.ImageUrl, required this.id});

    @override

    void SelectCategory (context){
      Navigator.of(context).push(MaterialPageRoute(builder: (context){
        return Categorydetail(title , id );
      }));
    }

    Widget build(BuildContext context) {
      return Padding(
        padding: const EdgeInsets.all(10),
        child: InkWell(
          onTap: () => SelectCategory(context),
          child: Stack(

            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.network(
                  ImageUrl ,
                  height: 250,



                ),
              ) ,
              Padding(
                padding: const EdgeInsets.all(10),
                child: Container(

                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: Colors.black.withOpacity(0.8),
                ),
                alignment: Alignment.center,
                  child: Text(title ,style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold
                  ), ),
                ),
              ),

            ],
          ),
        ),
      );
    }
  }
