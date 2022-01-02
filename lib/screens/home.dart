import 'package:flutter/material.dart';
import 'package:productos_dart/controlador.dart';
import 'package:productos_dart/widget/listado_de_productos.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  const Home({Key? key, required String title}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () => context.read<UsuarioProvider>().getUsuarios(),
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () => context.read<UsuarioProvider>().getUsuarios(),
          child: const Icon(Icons.refresh),
        ),
        appBar: AppBar(
          title: const Center(child: Text('Nuestros Productos')),
        ),
        body: SafeArea(
          child: Consumer<UsuarioProvider>(
            builder: (BuildContext context, data, _) {
              if (data.productos.isEmpty) {
                return const Center(
                  child: Text('Lista vacia'),
                );
              }
              return ListadoDeProductos(data.productos);
            },
          ),
        ),
      ),
    );
  }
}
