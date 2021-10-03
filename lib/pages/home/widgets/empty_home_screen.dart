import 'package:blood_pressure/pages/home/widgets/empty_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EmptyHomeScreen extends StatelessWidget {
  const EmptyHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: Stack(
        children: [
          Column(
            children: [
              const Flexible(
                flex: 2,
                fit: FlexFit.tight,
                child: Center(
                  child: Text("Home"),
                ),
              ),
              const Flexible(
                flex: 3,
                fit: FlexFit.tight,
                child: SizedBox(
                  width: double.infinity,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                    child: EmptyCard(),
                  ),
                ),
              ),
              Flexible(
                flex: 5,
                child: Container(),
              ),
            ],
          ),
          DraggableScrollableSheet(
            initialChildSize: 0.5,
            minChildSize: 0.5,
            maxChildSize: 1,
            builder: (context, controller) => ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Container(
                color: Colors.red,
                child: Column(
                  children: const [
                    Text("History"),
                    Text("Waiting for you results"),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
