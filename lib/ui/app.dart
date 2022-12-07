import 'package:crud_local/ui/pages/add.dart';
import 'package:crud_local/ui/pages/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(    
      title:  'Crud Local',
      theme: ThemeData(primarySwatch: Colors.purple),
      debugShowCheckedModeBanner: false,
      home: const Home(),
      routes: {
        '/adicionar': (context)=> const AddApunte()
      },
      );
  }
}