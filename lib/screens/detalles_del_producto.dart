import 'package:flutter/material.dart';
import 'package:productos_dart/controlador.dart';
import 'package:productos_dart/productos.dart';
import 'package:provider/provider.dart';

class DetalleDeProducto extends StatelessWidget {
  final Productos producto;
  const DetalleDeProducto(this.producto);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () => context
                .read<UsuarioProvider>()
                .agregarRemoverUsuarioFavorito('${producto.id}'),
            icon: Consumer<UsuarioProvider>(
              builder: (context, data, _) {
                bool esFavorito =
                    data.listadoFavoritos.contains('${producto.id}');

                return Icon(
                  esFavorito ? Icons.favorite : Icons.favorite_outline,
                  color: esFavorito ? Colors.red : Colors.white,
                );
              },
            ),
          ),
          IconButton(
            onPressed: () => context
                .read<UsuarioProvider>()
                .agregarRemoverArticulo('${producto.id}'),
            icon: Consumer<UsuarioProvider>(
              builder: (context, data, _) {
                bool esFavorito =
                    data.listadoCompras.contains('${producto.id}');

                return Icon(
                  esFavorito
                      ? Icons.shopping_cart
                      : Icons.shopping_cart_outlined,
                  color: esFavorito ? Colors.black : Colors.white,
                );
              },
            ),
          )
        ],
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
