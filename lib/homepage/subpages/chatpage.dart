import 'package:flutter/material.dart';

class MyChatPage extends StatelessWidget {
  const MyChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Nested ListView Example'),
        ),
        body: ListView.builder(
          itemCount: 9, // Number of vertical items
          itemBuilder: (context, index) {
            return Container(
              height: 200,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 10, // Number of horizontal items
                itemBuilder: (context, index) {
                  return Container(
                    width: 100,
                    color: Colors.blue,
                    margin: EdgeInsets.all(5),
                    child: Center(
                      child: Text(
                        'Item $index',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}