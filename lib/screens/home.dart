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
      child: SafeArea(
        child: Scaffold(
          drawer: Drawer(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: const [
                    SizedBox(
                      width: 90,
                    ),
                    SizedBox(
                      child: Text(
                        'MIS DATOS',
                        style: TextStyle(
                          // backgroundColor: Colors.black38,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                          fontStyle: FontStyle.italic,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                      height: 40,
                      width: 150,
                    ),
                  ],
                ),
                TextButton(
                  onPressed: () {
                    // Navigator.pushNamed(context, '/page_2_list');
                  },
                  child: Row(
                    children: const [
                      Icon(
                        Icons.favorite,
                        color: Colors.red,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'MIS FAVORITOS',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                TextButton(
                  onPressed: () {
                    // Navigator.pushNamed(context, '/page_3');
                  },
                  child: Row(children: const [
                    Icon(
                      Icons.shopping_cart,
                      color: Colors.black,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      'CARRITO DE COMPRAS',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ]),
                ),
              ],
            ),
          ),
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
      ),
    );
  }
}
