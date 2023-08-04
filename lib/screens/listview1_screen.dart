import 'package:flutter/material.dart';

class ListView1Screen extends StatelessWidget {
  final option = const [
    'Megaman',
    'Metal Gear',
    'Super Smash',
    'Fanal Fantasy'
  ];

  const ListView1Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('ListView Tipo 1'),
        ),
        body: ListView(
          children: [
            ...option
                .map((game) => ListTile(
                      title: Text(game),
                      trailing: const Icon(Icons.arrow_forward_ios_outlined),
                      leading: const Icon(Icons.games),
                    ))
                .toList()
          ],
        ));
  }
}
