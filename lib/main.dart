import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobilysystem/Screens/ClientScreen.dart';
import 'package:mobilysystem/Screens/Inventory_table.dart';
import 'package:mobilysystem/Screens/LoginScreen.dart';
import 'package:mobilysystem/Screens/StockScreen.dart';

import 'Screens/HomeScreen.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'Screens/Inventory_detail.dart';
import 'Screens/RegisterScreen.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

DatabaseReference userRef = FirebaseDatabase.instance.ref("user");

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,

      child: MaterialApp(

          localizationsDelegates: const  [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: const [
             Locale('ar' , "AE"), // English
           // Spanish
          ],
        title: 'Mobily',

        debugShowCheckedModeBanner: false,
        theme: ThemeData(

          colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue.shade900),
          useMaterial3: true,

          appBarTheme:  AppBarTheme(
            color: Colors.blue.shade900,
            iconTheme: IconThemeData(color: Colors.white),
            titleTextStyle: TextStyle(color: Colors.white , fontWeight: FontWeight.bold,fontSize: 20)
          ),


        ),
     home:  HomeScreen()

      ),
    );
  }
}

