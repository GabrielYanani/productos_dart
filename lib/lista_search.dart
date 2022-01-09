import 'package:flutter/material.dart';
import 'package:productos_dart/controlador.dart';
import 'package:productos_dart/productos.dart';
import 'package:productos_dart/screens/detalles_del_producto.dart';
import 'package:provider/provider.dart';

List<Widget> crearListadoDeProductos(List<Productos> productos, BuildContext context) {
    return productos.map((Productos producto) {
      return  Padding(
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
              child:Image.network(
                producto.image,
                height: 50,
                width: 50,
          //     ), FadeInImage.assetNetwork(         se hace lenta...
          //   placeholder: 'assets/loading.gif',
          //   image: producto.image,
          //   imageCacheWidth: 50,
          //   width: 50,
          ),
            ),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => DetalleDeProducto(producto),
                  ));
            },
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
    }).toList();
  }
  // no funciona...
  //     List<Widget> crearListadoDeProductos(
//     List<Productos> productos, BuildContext context) {
//   return productos.map((Productos producto) {
//     return ListadoDeProductos(productos);
//   }).toList();
// }
