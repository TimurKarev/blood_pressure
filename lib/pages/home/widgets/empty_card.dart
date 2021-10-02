import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EmptyCard extends StatelessWidget {
  const EmptyCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("hello");
    return Card(
      color: Colors.black12,
      child: Column(
        children: [
          Flexible(
            flex: 7,
            child: Container(),
          ),
          Flexible(
            flex: 3,
            child: ElevatedButton(
              onPressed: () {},
              child: const Text("Enter ther first measurement"),
            ),
          ),
        ],
      ),
    );
  }
}
