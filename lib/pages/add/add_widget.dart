import 'package:blood_pressure/pages/add/view_model/add_page_view_model.dart';
import 'package:blood_pressure/pages/add/widgets/input_field.dart';
import 'package:blood_pressure/pages/utils/fake.dart';
import 'package:blood_pressure/pages/utils/top_angles_clipper.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:blood_pressure/styles.dart';
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
  final double _textFieldRadius = 6.0;

  const InputWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      //crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Flexible(
          flex: 2,
          child: Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 5.0, horizontal: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  flex: 1,
                  child: Container(),
                ),
                const Flexible(
                  flex: 8,
                  child: Text(
                    "New Measurement",
                    style: Styles.headerNormal,
                  ),
                ),
                const Flexible(
                  flex: 1,
                  child: Icon(CupertinoIcons.xmark_circle_fill),
                ),
              ],
            ),
          ),
        ),
        Flexible(
          flex: 5,
          child: Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 5.0, horizontal: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Flexible(
                  flex: 2,
                  child: Text(
                    "SYS/DIA",
                    style: Styles.headerSmall,
                  ),
                ),
                Flexible(
                  flex: 6,
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(),
                      borderRadius:
                          BorderRadius.all(Radius.circular(_textFieldRadius)),
                    ),
                    child: SysDiaWidget(),
                  ),
                ),
              ],
            ),
          ),
        ),
        Flexible(
          flex: 5,
          child: Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 5.0, horizontal: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Flexible(
                  flex: 2,
                  child: Text(
                    "Pulse",
                    style: Styles.headerSmall,
                  ),
                ),
                Flexible(
                  flex: 6,
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(),
                      borderRadius:
                          BorderRadius.all(Radius.circular(_textFieldRadius)),
                    ),
                    child: const PulseWidget(),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class SysDiaWidget extends StatelessWidget {
  SysDiaWidget({Key? key}) : super(key: key);

  final sysController = TextEditingController();
  final diaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        InputField(
          width: 40.0,
          placeholder: "120",
          maxLength: 3,
          controller: sysController,
          onEditingComplete: () {
            if(sysController.text.length > 1) {
              try {
                final sys = int.parse(sysController.text);
                context.read(addPageViewModelProvider).sys = sys;
              } catch (e) {
                sysController.text = '';
              }
            }
          },
        ),
        const Text(
          "/",
          style: Styles.headerNormalGray,
        ),
        SizedBox(
          width: 28.0,
          child: CupertinoTextField(
            padding: EdgeInsets.all(1.0),
            placeholder: "80",
            maxLength: 2,
            maxLines: 1,
            minLines: 1,
            style: Styles.headerNormal,
            cursorColor: Styles.cursorColor,
          ),
        ),
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
        SizedBox(
          width: 28.0,
          child: CupertinoTextField(
            padding: EdgeInsets.all(1.0),
            placeholder: "80",
            maxLength: 2,
            maxLines: 1,
            minLines: 1,
            style: Styles.headerNormal,
            cursorColor: Styles.cursorColor,
          ),
        ),
      ],
    );
  }
}
