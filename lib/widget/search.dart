import 'package:flutter/material.dart';
import 'package:productos_dart/lista_search.dart';
import 'package:productos_dart/productos.dart';

class SearchUsers extends SearchDelegate<String> {
  final List<Productos> productos;
  SearchUsers(this.productos);

  @override
  List<Widget>? buildActions(BuildContext context) {
   return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: const Icon(Icons.close),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
   return IconButton(
      onPressed: () {
        Navigator.pop(context);
        // close(context, '');
      },
      icon: const Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
   return showUsers(context);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return showUsers(context);
  } 
  Widget showUsers(BuildContext context) {
    // List<User> usuarios;
    List<Productos> nuevoProducto = [];
    for (Productos producto in productos) {
      if (producto.title.toLowerCase().contains(query)) {
        nuevoProducto.add(producto);
      }
    }

    return ListView(
      children:crearListadoDeProductos(nuevoProducto, context),
    );
  }
}

