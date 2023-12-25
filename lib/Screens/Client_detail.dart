
  import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

  class ClientDetail extends StatefulWidget {
    const ClientDetail({super.key});

    @override
    State<ClientDetail> createState() => _ClientDetailState();
  }

  class _ClientDetailState extends State<ClientDetail> {
    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: Text('تفاصيل العميل '),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              SizedBox(height: 20,),
              TextFormField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16)
                    ),
                    hintText: "",
                    hintStyle: TextStyle(color: Colors.black)


                ),
                enabled: false,

              ),
              SizedBox(height: 20,),
              TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16)
                  ),

                ),
              ),
              SizedBox(height: 20,),
              TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16)
                  ),

                ),
              ),
              SizedBox(height: 20,),
              TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16)
                  ),

                ),
              ),
            ],
          ),
        ),
      );
    }
  }

