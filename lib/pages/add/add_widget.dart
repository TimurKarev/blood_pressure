import 'package:blood_pressure/pages/utils/fake.dart';
import 'package:blood_pressure/pages/utils/top_angles_clipper.dart';
import 'package:flutter/cupertino.dart';

class AddWidget extends StatelessWidget {
  const AddWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 45.0, 0.0, 0.0),
      child: ClipPath(
        clipper: TopAnglesClipper(radius: 30.0),
        child: Container(
          color: CupertinoColors.lightBackgroundGray,
          child: Column(
            children: [
              Flexible(
                flex: 1,
                child: Fake(""),
              ),
              Flexible(
                flex: 12,
                child: InputWidget(),
              ),
              Flexible(
                flex: 18,
                child: Fake(""),
              ),
              Flexible(
                flex: 4,
                child: Fake(
                  "",
                  child: Center(
                    child: SizedBox(
                      width: 200,
                      height: 35,
                      child: Fake(
                        "",
                        radius: 10,
                        border: true,
                      ),
                    ),
                  ),
                ),
              ),
              Flexible(
                flex: 1,
                child: Fake(""),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class InputWidget extends StatelessWidget {
  const InputWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                flex: 1,
                child: Container(),
              ),
              const Flexible(
                flex: 8,
                child: Text("New Measurement"),
              ),
              const Flexible(
                flex: 1,
                child: Icon(CupertinoIcons.xmark_circle_fill),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Flexible(
                flex: 2,
                child: Text("SYS/DIA"),
              ),
              Flexible(
                flex: 6,
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(),
                    borderRadius: const BorderRadius.all(Radius.circular(25)),
                  ),
                  child: const SysDiaWidget(),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Flexible(
                flex: 2,
                child: Text("Pulse"),
              ),
              Flexible(
                flex: 6,
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(),
                    borderRadius: const BorderRadius.all(Radius.circular(25)),
                  ),
                  child: const PulseWidget(),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class SysDiaWidget extends StatelessWidget {
  const SysDiaWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("120"),
        Text("/"),
        Text("80"),
      ],
    );
  }
}

class PulseWidget extends StatelessWidget {
  const PulseWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(CupertinoIcons.heart_fill),
        Text("60"),
      ],
    );
  }
}
