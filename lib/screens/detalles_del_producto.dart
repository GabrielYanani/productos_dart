import 'package:flutter/material.dart';
import 'package:productos_dart/productos.dart';

class DetalleDeProducto extends StatelessWidget {
  final Productos producto;
  const DetalleDeProducto(this.producto);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(producto.title),
      ),
      body: SafeArea(
        child: Center(
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
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                    color: Colors.greenAccent,
                    width: double.infinity,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          'Descripcion: ${producto.description}',
                          textScaleFactor: 1.5,
                        ),
                        Text(
                          'Precio: \$${producto.price}',
                          textScaleFactor: 1.5,
                        ),
                        Text(
                          'Categotia: ${producto.category}',
                          textScaleFactor: 1.5,
                        ),
                      ],
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
