import 'package:flutter/material.dart';
import 'package:productos_dart/productos.dart';
import 'package:productos_dart/widget/icon_button_compras.dart';
import 'package:productos_dart/widget/icon_button_favoritos.dart';


class DetalleDeProducto extends StatelessWidget {
  final Productos producto;
  const DetalleDeProducto(this.producto);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          actions: [
            IconButtonFavoritos(producto: producto),
            IconButtonCompras(producto: producto)
          ],
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Image.network(
                    producto.image,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              Text(
                producto.title,
                textScaleFactor: 1.3,
                textAlign: TextAlign.center,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const Icon(
                      Icons.paid,
                      size: 35,
                      color: Colors.amberAccent,
                    ),
                    const SizedBox(
                      height: 10,
                      width: 10,
                    ),
                    Text(
                      'Precio: \$${producto.price}',
                      textScaleFactor: 1.5,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  color: Colors.green.shade200,
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      producto.description,
                      textAlign: TextAlign.center,
                      textScaleFactor: 1.1,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(2.0),
                child: Text(
                  producto.category,
                  textScaleFactor: 1.5,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

