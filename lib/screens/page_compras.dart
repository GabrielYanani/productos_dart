import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:productos_dart/controlador.dart';
import 'package:productos_dart/productos.dart';
import 'package:productos_dart/screens/detalles_del_producto.dart';

class PageCompras extends StatelessWidget {
  //  final List<Productos> productos;
  const PageCompras({
    Key? key,
    //  required this.productos,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Center(child: Text('MI CARRITO DE COMPRAS')),
        ),
        body:
            Consumer<UsuarioProvider>(builder: (BuildContext context, data, _) {
          if (data.listadoCompras.isEmpty) {
            return const Center(
              child: Text('Lista vacia'),
            );
          }

          List<Productos> productosElegidos = data.listadoCompras
              .map((id) =>
                  data.productos.firstWhere((product) => product.id == id))
              .toList();

          return ListView.builder(
            itemCount: productosElegidos.length,
            itemBuilder: (BuildContext context, int i) {
              final producto = productosElegidos[i];
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
                        borderRadius:
                            const BorderRadius.all(Radius.circular(5))),
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
                          builder: (_) =>
                              DetalleDeProducto(productosElegidos[i]),
                        ));
                  },
                ),
              );
            },
          );
        }),
      ),
    );
  }
}
