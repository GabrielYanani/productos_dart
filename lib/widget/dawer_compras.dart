import 'package:flutter/material.dart';
import 'package:productos_dart/screens/page_compras.dart';
import 'package:productos_dart/screens/page_favoritos.dart';

class DrawerCompras extends StatelessWidget {
  const DrawerCompras({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
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
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const PageFavoritos(),
                ),
              );
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
            onPressed: () {Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const PageCompras(),
                ),
              );},
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
    );
  }
}
