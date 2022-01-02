
import 'package:productos_dart/productos.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UsuarioProvider extends ChangeNotifier {
  final List<Productos> _productos = [];
  List<Productos> get productos => _productos;

  Future<void> getUsuarios() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? datosJson;
    try {
      Client http = Client();
      Uri uri = Uri.parse('https://fakestoreapi.com/products');
      Response respuesta = await http.get(uri);
      prefs.setString('user', respuesta.body);
      datosJson = respuesta.body;
    } catch (e) {
      datosJson = prefs.getString('user');
    }
    final List<Productos> productos = productosFromJson(datosJson!);
    
    _productos.clear();
    _productos.addAll(productos);
     notifyListeners();
  }
}