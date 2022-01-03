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

  agregarRemoverUsuarioFavorito(String idUsuario) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (_listadoFavoritos.contains(idUsuario) == true) {
      _listadoFavoritos.remove(idUsuario);
    } else {
      _listadoFavoritos.add(idUsuario);
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
    getUsuarios();
  }

  final List<String> _listadoCompras = [];
  List<String> get listadoCompras => _listadoCompras;

  agregarRemoverArticulo(String idUsuario) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (_listadoCompras.contains(idUsuario) == true) {
      _listadoCompras.remove(idUsuario);
    } else {
      _listadoCompras.add(idUsuario);
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
    getUsuarios();
  }

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
