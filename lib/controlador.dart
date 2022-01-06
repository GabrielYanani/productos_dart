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

  Future<bool> agregarRemoverUsuarioFavorito(String idProducto) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool fueAgregado;
    if (_listadoFavoritos.contains(idProducto) == true) {
      _listadoFavoritos.remove(idProducto);
      fueAgregado = false;
    } else {
      _listadoFavoritos.add(idProducto);
      fueAgregado = true;
    }
    await prefs.setStringList('listadoFavoritos', _listadoFavoritos);

    notifyListeners();
    return fueAgregado;
  }

  cargarListadoFavoritoDesdePreferencias() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? listado = await prefs.getStringList('listadoFavoritos');
    if (listado != null) {
      _listadoFavoritos.addAll(listado);
    }
    getProductos();
  }

  final List<String> _listadoCompras = [];
  List<String> get listadoCompras => _listadoCompras;

  Future<bool> agregarRemoverArticulo(String idProducto) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool fueAgregado;
    if (_listadoCompras.contains(idProducto) == true) {
      _listadoCompras.remove(idProducto);
      fueAgregado = false;
    } else {
      _listadoCompras.add(idProducto);
      fueAgregado = true;
    }

    await prefs.setStringList('listadoCompras', _listadoCompras);
    notifyListeners();
    return fueAgregado;
  }

  cargarListadoComprasDesdePreferencias() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? miListadoCompras = prefs.getStringList('listadoCompras');
    if(miListadoCompras!=null) 
    {_listadoCompras.addAll(miListadoCompras);} 
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
