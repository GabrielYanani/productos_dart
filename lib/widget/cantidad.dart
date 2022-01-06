
import 'package:flutter/material.dart';

class Cantidad extends StatefulWidget {
  const Cantidad({Key? key}) : super(key: key);

  @override
  _CantidadState createState() => _CantidadState();
}

class _CantidadState extends State<Cantidad> {
  int _counter = 0;


  void _incrementCounter() {
    setState(() {
      (_counter++);
    });
  }

  void _restar() {
    setState(() {
      (_counter--);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      decoration: BoxDecoration(
          border: Border.all(
            color: Colors.black38,
          ),
          borderRadius: const BorderRadius.all(Radius.circular(15))),
      child: Row(
        children: [
          IconButton(
              onPressed: _incrementCounter,
              tooltip: 'sumar',
              icon: const Icon(Icons.arrow_drop_up)),
          Text(
            '$_counter',
            textScaleFactor: 1.2,
          ),
          IconButton(
              onPressed: _restar,
              tooltip: 'restar',
              icon: const Icon(Icons.arrow_drop_down))
        ],
      ),
    );
  }
}