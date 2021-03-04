import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:plant_app/constants.dart';
import 'package:plant_app/pages/CartPage.dart';
import 'package:plant_app/pages/DetailsPage.dart';
import 'package:plant_app/pages/HomePage.dart';
import 'package:plant_app/pages/LoginPage.dart';

final cartListProvider = StateNotifierProvider<CartList>((ref) {
  return CartList();
});

final favListProvider = StateNotifierProvider<CartList>((ref) {
  return CartList();
});

void main() {
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: "/login",
      routes: {
        '/login': (context) => LoginPage(),
        '/cart': (context) => CartPage(),
        '/details': (context) => DetailsPage(),
        // '/home': (context) => HomePage(),
      },
      title: 'Flutter Demo',
      theme: ThemeData(
        textTheme: GoogleFonts.montserratTextTheme(Theme.of(context).textTheme),
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(),
    );
  }
}

//TODO add cart com provider
