import 'package:flutter/material.dart';

class Campaigns extends StatelessWidget {
  const Campaigns({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Campaigns'), backgroundColor: Colors.amber),
      body: Center(child: Text('Campaigns')),
    );
  }
}
