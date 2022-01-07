import 'package:flutter/material.dart';
import 'package:productos_dart/controlador.dart';
import 'package:productos_dart/screens/home.dart';
 
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) { 
    return ChangeNotifierProvider(
      create: (BuildContext context) => UsuarioProvider.init(),
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.green,
        ),
        home: const Home(title: 'ventas on-line'),
      ),
    );
  }
  
}
