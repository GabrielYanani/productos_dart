// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// import 'package:productos_dart/controlador.dart';
// import 'package:productos_dart/productos.dart';
// import 'package:productos_dart/screens/detalles_del_producto.dart';

// class PageFavoritos extends StatelessWidget {
//   final List<Productos> productos;
//   const PageFavoritos({
//     Key? key,
//     required this.productos,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         appBar: AppBar(
//           title: const Center(child: Text('FAVORITOS')),
//         ),
//         body: Consumer<UsuarioProvider>(
//           builder: (BuildContext context, data, _) {
//             if (data.listadoFavoritos.isEmpty) {
//               return const Center(
//                 child: Text('Lista vacia'),
//               );
//             }
//             if (data.listadoFavoritos == null) {
//               return Text('lista vacia');
//             }
//             if (data.listadoFavoritos.contains("id") == productos) {
//               return ListView.builder(
//                 itemCount: productos.length,
//                 itemBuilder: (BuildContext context, int i) {
//                   final producto = productos[i];
//                   return Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: ListTile(
//                       tileColor: Colors.white,
//                       title: Text(producto.title),
//                       leading: Container(
//                         decoration: BoxDecoration(
//                             border: Border.all(
//                               color: Colors.black38,
//                             ),
//                             borderRadius:
//                                 const BorderRadius.all(Radius.circular(5))),
//                         child: Image.network(
//                           producto.image,
//                           height: 50,
//                           width: 50,
//                         ),
//                       ),
//                       onTap: () {
//                         Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                               builder: (_) => DetalleDeProducto(productos[i]),
//                             ));
//                       },
//                     ),
//                   );
//                 },
//               );
//             }
//           },
//         ),
//       ),
//     );
//   }
// }

// // class ListadoDeFavoritos extends StatelessWidget {
// //   final List<Productos> favoritos;
// //   const ListadoDeFavoritos(
// //     this.favoritos,
// //   );

// //   @override
// //   Widget build(BuildContext context) {
// //     return ListView.builder(
// //       itemCount: favoritos.length,
// //       itemBuilder: (BuildContext context, int i) {
// //         final favorito = favoritos[i];
// //         return Center(
// //           child: Column(
// //             mainAxisAlignment: MainAxisAlignment.center,
// //             crossAxisAlignment: CrossAxisAlignment.center,
// //             children: [
// //               Expanded(
// //                 child: Padding(
// //                   padding: const EdgeInsets.all(10.0),
// //                   child: Image.network(
// //                     favorito.,
// //                     fit: BoxFit.contain,
// //                   ),
// //                 ),
// //               ),
// //               Text(
// //                 favorito.title,
// //                 textScaleFactor: 1.3,
// //                 textAlign: TextAlign.center,
// //               ),
// //               Padding(
// //                 padding: const EdgeInsets.all(8.0),
// //                 child: Row(
// //                   mainAxisAlignment: MainAxisAlignment.end,
// //                   children: [
// //                     const Icon(
// //                       Icons.paid,
// //                       size: 35,
// //                       color: Colors.amberAccent,
// //                     ),
// //                     const SizedBox(
// //                       height: 10,
// //                       width: 10,
// //                     ),
// //                     Text(
// //                       'Precio: \$${favorito.price}',
// //                       textScaleFactor: 1.5,
// //                     ),
// //                   ],
// //                 ),
// //               ),
// //               Padding(
// //                 padding: const EdgeInsets.all(10.0),
// //                 child: Container(
// //                   color: Colors.green.shade200,
// //                   width: double.infinity,
// //                   child: Padding(
// //                     padding: const EdgeInsets.all(8.0),
// //                     child: Text(
// //                       producto.description,
// //                       textAlign: TextAlign.center,
// //                       textScaleFactor: 1.1,
// //                     ),
// //                   ),
// //                 ),
// //               ),
// //               Padding(
// //                 padding: const EdgeInsets.all(2.0),
// //                 child: Text(
// //                   producto.category,
// //                   textScaleFactor: 1.5,
// //                 ),
// //               ),
// //             ],
// //           ),
// //         ),
// //       ),
// //     );
// //   }
// // }

