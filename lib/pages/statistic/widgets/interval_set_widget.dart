import 'package:blood_pressure/pages/statistic/widgets/badge_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RadioSetWidget extends StatefulWidget {
  const RadioSetWidget({
    Key? key,
    required this.labels,
    required this.onPressed,
  }) : super(key: key);

  final List<String> labels;
  final Function(int index) onPressed;

  @override
  _RadioSetWidgetState createState() => _RadioSetWidgetState();
}

class _RadioSetWidgetState extends State<RadioSetWidget> {
  List<bool> _active = [];

  @override
  @mustCallSuper
  void initState() {
    if (widget.labels.isNotEmpty) {
      _active.add(true);
      for (int i = 1; i < widget.labels.length; i++) {
        _active.add(false);
      }
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
