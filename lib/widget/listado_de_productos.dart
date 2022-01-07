import 'package:flutter/material.dart';
import 'package:productos_dart/controlador.dart';
import 'package:productos_dart/productos.dart';
import 'package:productos_dart/screens/detalles_del_producto.dart';
import 'package:provider/provider.dart';

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
              decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black38,
                  ),
                  borderRadius: const BorderRadius.all(Radius.circular(5))),
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
            // opcion para que salga icon favorito en listile
          //   trailing: Consumer<UsuarioProvider>(builder: (context, data, _) {         
          //   Widget widget;
          //   if (data.listadoFavoritos.contains(producto.id)) {
          //     widget = const Icon(
          //       Icons.favorite,
          //       color: Colors.red,
          //     );
          //   } else {
          //     widget = const SizedBox();
          //   }
          //   return widget;
          // }),
          ),
        );
      },
    );
  }
}
