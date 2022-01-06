import 'package:flutter/material.dart';
import 'package:productos_dart/controlador.dart';
import 'package:productos_dart/productos.dart';
import 'package:provider/provider.dart';

class IconButtonFavoritos extends StatelessWidget {
  const IconButtonFavoritos({
    Key? key,
    required this.producto,
  }) : super(key: key);

  final Productos producto;

  @override
  Widget build(BuildContext context) {
    return IconButton(tooltip: 'Agregar a Favoritos',
      onPressed: () => context
          .read<UsuarioProvider>()
          .agregarRemoverUsuarioFavorito(producto.id),
      icon: Consumer<UsuarioProvider>(
        builder: (context, data, _) {
          bool esFavorito =
              data.listadoFavoritos.contains(producto.id);

          return Icon(
            esFavorito ? Icons.favorite : Icons.favorite_outline,
            color: esFavorito ? Colors.red : Colors.white,
          );
        },
      ),
    );
  }
}
