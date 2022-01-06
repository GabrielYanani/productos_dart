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
    return IconButton(
      tooltip: 'comprar',
      iconSize: 40,
      onPressed: () async {
        bool isFavorite = await context
            .read<UsuarioProvider>()
            .agregarRemoverArticulo(producto.id);
        var mensaje = [
          'Agregaste al carrito de compras',
          'Quitaste del carrito de compras'
        ];
        ScaffoldMessenger.of(context).hideCurrentSnackBar();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            duration: const Duration(milliseconds: 900),
            content: Text(mensaje[isFavorite ? 0 : 1]),
          ),
        );
      },
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
