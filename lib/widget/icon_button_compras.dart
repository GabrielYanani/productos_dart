import 'package:flutter/material.dart';
import 'package:productos_dart/controlador.dart';
import 'package:productos_dart/productos.dart';
import 'package:provider/provider.dart';

class IconButtonCompras extends StatelessWidget {
  const IconButtonCompras({
    Key? key,
    required this.producto,
  }) : super(key: key);

  final Productos producto;

  @override
  Widget build(BuildContext context) {
    return IconButton(tooltip: 'comprar',
      onPressed: () =>
          context.read<UsuarioProvider>().agregarRemoverArticulo(producto.id),
      icon: Consumer<UsuarioProvider>(
        builder: (context, data, _) {
          bool esFavorito = data.listadoCompras.contains(producto.id);

          return Icon(
            esFavorito ? Icons.shopping_cart : Icons.shopping_cart_outlined,
            color: esFavorito ? Colors.black : Colors.black,
          );
        },
      ),
    );
  }
}
