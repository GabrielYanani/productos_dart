import 'package:flutter/material.dart';
import 'package:productos_dart/controlador.dart';
import 'package:productos_dart/widget/dawer_compras.dart';
import 'package:productos_dart/widget/listado_de_productos.dart';
import 'package:productos_dart/widget/search.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  const Home({Key? key, required String title}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
        onRefresh: () => context.read<UsuarioProvider>().getProductos(),
        child:
            Consumer<UsuarioProvider>(builder: (BuildContext context, data, _) {
          return SafeArea(
            child: Scaffold(
              drawer: const DrawerCompras(),
              floatingActionButton: FloatingActionButton(
                onPressed: () => context.read<UsuarioProvider>().getProductos(),
                child: const Icon(Icons.refresh),
              ),
              appBar: AppBar(
                title: const Center(child: Text('Nuestros Productos')),
                actions: [
                  IconButton(
                    icon: const Icon(
                      Icons.search,
                      size: 30,
                      color: Colors.white ,
                    ),
                    tooltip: 'Buscar',
                    onPressed: data.productos.isEmpty
                        ? null
                        : () {
                            showSearch<String>(
                              context: context,
                              delegate: SearchUsers(data.productos),
                            );
                          },
                  ),
                ],
              ),
              body: Consumer<UsuarioProvider>(
                builder: (BuildContext context, data, _) {
                  if (data.productos.isEmpty) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  return ListadoDeProductos(data.productos);
                },
              ),
            ),
          );
        }));
  }
}
