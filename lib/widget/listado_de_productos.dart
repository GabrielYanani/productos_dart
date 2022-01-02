import 'package:flutter/material.dart';
import 'package:productos_dart/productos.dart';
import 'package:productos_dart/screens/detalles_del_producto.dart';

class ListadoDeProductos extends StatelessWidget {
  final List<Productos> productos;
  const ListadoDeProductos(
    this.productos,
  );

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: productos.length,
      itemBuilder: (BuildContext context, int i) {
        final producto = productos[i];
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListTile(
            tileColor: Colors.white,
            title: Text(producto.title),
            leading: Container(
              child: Image.network(
                producto.image,
                height: 50,
                width: 50,
              ),
            ),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => DetalleDeProducto(productos[i]),
                  ));
            },
          ),
        );
      },
    );
  }
}
