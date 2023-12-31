  import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InventoryItem extends StatelessWidget {
    const InventoryItem({super.key});
  
    @override
    Widget build(BuildContext context) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          color: Colors.grey.shade300,
          child: ExpansionTile(

            title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Item Name" , style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17),) ,
              Icon(Icons.delete , color: Colors.red,)
            ],
          ),
            children: [
              Column(
                children: [
                  Text("سعر البيع: 10,000"),
                  Text("نوع البيع : كاش ")
                ],
              )
            ],
          ),
        )
      );
    }
  }
  