import 'package:blood_pressure/pages/add/view_model/add_page_view_model.dart';
import 'package:blood_pressure/styles.dart';
import 'package:blood_pressure/utils/color_to_diag_mapping.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/src/provider.dart';

//TODO: Refactor ME

class TopInputCard extends StatelessWidget {

  static const _bageHeight = 45.0;
  const TopInputCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final viewModel = context.read(addPageViewModelProvider);
    return SizedBox(
      height: 150,
      width: double.infinity,
      child: Card(
        elevation: 5.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Container(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              Row(
                children: [
                  Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            viewModel.sys.toString(),
                            style: Styles.topInputCardText,
                          ),
                          const Text(
                            " / ",
                            style: Styles.topInputCardTextGrey,
                          ),
                          Text(
                            viewModel.dia.toString(),
                            style: Styles.topInputCardText,
                          ),
                        ],
                      ),
                      const Text("SYS/DIA", style: Styles.smallTopCardTextGrey),
                    ],
                  ),
                  Flexible(
                    flex: 1,
                    child: Container(),
                  ),
                  Flexible(
                    flex: 2,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          children: [
                            const SizedBox(
                              height: 12.0,
                            ),
                            Image.asset(
                              "assets/png/heart.png",
                            ),
                          ],
                        ),
                        const SizedBox(width: 7.0),
                        Column(
                          children: [
                            Text(
                              viewModel.pulse.toString(),
                              style: Styles.topInputCardText,
                            ),
                            const Text("BMP", style: Styles.smallTopCardTextGrey),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: Row(
                    children: [
                      Flexible(
                        flex: 5,
                        child: Container(
                          width: double.infinity,
                          height: _bageHeight,
                          decoration: BoxDecoration(
                              color: getColorFromDiag(viewModel.bageText),
                              borderRadius:
                              const BorderRadius.all(Radius.circular(10))),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset("assets/png/heart_pulse.png"),
                              Text("  ${viewModel.bageText}", style: Styles.inputBageText),
                            ],
                          ),
                        ),
                      ),
                      Flexible(
                        flex: 1,
                        child: Container(height: _bageHeight,),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}