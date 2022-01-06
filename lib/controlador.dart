import 'package:productos_dart/productos.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UsuarioProvider extends ChangeNotifier {
  final List<Productos> _productos = [];
  List<Productos> get productos => _productos;

  UsuarioProvider.init() {
    cargarListadoFavoritoDesdePreferencias();
    cargarListadoComprasDesdePreferencias();
  }

  final List<String> _listadoFavoritos = [];
  List<String> get listadoFavoritos => _listadoFavoritos;

  agregarRemoverUsuarioFavorito(String idProducto) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (_listadoFavoritos.contains(idProducto) == true) {
      _listadoFavoritos.remove(idProducto);
    } else {
      _listadoFavoritos.add(idProducto);
    }
    await prefs.setStringList('listadoFavoritos', _listadoFavoritos);

    notifyListeners();
  }

  cargarListadoFavoritoDesdePreferencias() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.getStringList('listadoFavoritos') == null) {
      return const Text('vacio');
    }
    {
      List<String>? listado = prefs.getStringList('listadoFavoritos');
      _listadoFavoritos.addAll(listado!);
    }
    getProductos();
  }

  
  final List<String> _listadoCompras = [];
  List<String> get listadoCompras => _listadoCompras;

  agregarRemoverArticulo(String idProducto) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (_listadoCompras.contains(idProducto) == true) {
      _listadoCompras.remove(idProducto);
    } else {
      _listadoCompras.add(idProducto);
    }

    await prefs.setStringList('listadoCompras', _listadoCompras);
    notifyListeners();
  }

  cargarListadoComprasDesdePreferencias() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.getStringList('listadoCompras') == null) {
      return const Text('vacio');
    }
    {
      List<String>? miListadoCompras = prefs.getStringList('listadoCompras');
      _listadoCompras.addAll(miListadoCompras!);
    }
    getProductos();
  }

  Future<void> getProductos() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? datosJson;
    try {
      Client http = Client();
      Uri uri = Uri.parse('https://fakestoreapi.com/products');
      Response respuesta = await http.get(uri);
      prefs.setString('producto', respuesta.body);
      datosJson = respuesta.body;
    } catch (e) {
      datosJson = prefs.getString('producto');
    }
    final List<Productos> productos = productosFromJson(datosJson!);

    _productos.clear();
    _productos.addAll(productos);
    notifyListeners();
  }
}
