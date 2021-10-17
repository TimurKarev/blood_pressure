import 'package:blood_pressure/pages/statistic/widgets/badge_widget.dart';
import 'package:blood_pressure/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RadioSetWidget extends StatefulWidget {
  const RadioSetWidget({
    Key? key,
    required this.labels,
    required this.onPressed,
    required this.startIndex,
    required this.colorIndex,
  }) : super(key: key);

  final List<String> labels;
  final Function(int index) onPressed;
  final int startIndex;
  final int colorIndex;

  @override
  _RadioSetWidgetState createState() => _RadioSetWidgetState();
}

class _RadioSetWidgetState extends State<RadioSetWidget> {
  List<bool> _active = [];

  @override
  @mustCallSuper
  void initState() {
    int setIndex = widget.startIndex;

    if (widget.labels.isNotEmpty) {
      for (int i = 0; i < widget.labels.length; i++) {
        _active.add(false);
      }
      if (setIndex < 0) {
        setIndex = 0;
      }
      if (setIndex > widget.labels.length - 1) {
        setIndex = widget.labels.length - 1;
      }

      _active[setIndex] = true;
    }

    super.initState();
  }

  void onTap(int index) {
    setState(() {
      _active = [false, false, false, false];
      _active[index] = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    final length = widget.labels.length;
    if (length == 0) {
      return Container();
    }

    return SizedBox(
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          for (int i = 0; i < length; i++)
            Expanded(
              child: BadgeWidget(
                activeColor: widget.colorIndex==0?Colors.purple.shade500 : Colors.red.shade500,
                text: widget.labels[i],
                active: _active[i],
                onTap: () {
                  onTap(i);
                  widget.onPressed(i);
                },
              ),
            ),
        ],
      ),
    );
  }
}
