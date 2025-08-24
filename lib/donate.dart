import 'package:flutter/material.dart';

class Donate extends StatelessWidget {
  const Donate({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Donate'), backgroundColor: Colors.amber),
      body: Center(child: Text('Donate')),
    );
  }
}
