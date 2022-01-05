// import 'package:flutter/material.dart';
// import 'package:productos_dart/controlador.dart';
// import 'package:productos_dart/productos.dart';
// import 'package:provider/provider.dart';

// class PageFavoritos extends StatelessWidget {
//   const PageFavoritos({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//    return SafeArea(
//      child: Scaffold(
//        appBar: AppBar(
//          title: const Center(child: Text('FAVORITOS')),
//        ),
//        body: Consumer<UsuarioProvider>(
//          builder: (BuildContext context, data, _) {
//            if (data.listadoFavoritos.isEmpty) {
//              return const Center(
//                child: Text('Lista vacia'),
//              );
//            }
//            return ListadoDeFavoritos(data.listadoFavoritos);
//          },
//        ),
//      ),
//    );
//   }
// }

// class ListadoDeFavoritos extends StatelessWidget {
//   final List<String> favoritos;
//   const ListadoDeFavoritos(
//     this.favoritos,
//   );

//   @override
//   Widget build(BuildContext context) {
//     return ListView.builder(
//       itemCount: favoritos.length,
//       itemBuilder: (BuildContext context, int i) {
//         final favorito = favoritos[i];
//         return Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               Expanded(
//                 child: Padding(
//                   padding: const EdgeInsets.all(10.0),
//                   child: Image.network(
//                     favorito.,
//                     fit: BoxFit.contain,
//                   ),
//                 ),
//               ),
//               Text(
//                 favorito.title,
//                 textScaleFactor: 1.3,
//                 textAlign: TextAlign.center,
//               ),
//               Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.end,
//                   children: [
//                     const Icon(
//                       Icons.paid,
//                       size: 35,
//                       color: Colors.amberAccent,
//                     ),
//                     const SizedBox(
//                       height: 10,
//                       width: 10,
//                     ),
//                     Text(
//                       'Precio: \$${producto.price}',
//                       textScaleFactor: 1.5,
//                     ),
//                   ],
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.all(10.0),
//                 child: Container(
//                   color: Colors.green.shade200,
//                   width: double.infinity,
//                   child: Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Text(
//                       producto.description,
//                       textAlign: TextAlign.center,
//                       textScaleFactor: 1.1,
//                     ),
//                   ),
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.all(2.0),
//                 child: Text(
//                   producto.category,
//                   textScaleFactor: 1.5,
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

