import 'package:flutter/material.dart';

class CategorySelector extends StatelessWidget {
  final int selectedStep;
  final int nbSteps;
  final void Function() Function(int) onTap;
  final Color stepColor;
  final Color stepSelectedColor;
  final Color lineColor;
  final double lineThickness;
  final double stepSize;
  final double stepSelectedSize;
  final double borderThickness;

  const CategorySelector({
    this.selectedStep = 0,
    this.nbSteps = 4,
    this.onTap,
    this.stepColor = Colors.white,
    this.stepSelectedColor = Colors.yellow,
    this.lineColor = Colors.blue,
    this.lineThickness = 3.5,
    this.stepSize = 40,
    this.stepSelectedSize = 40,
    this.borderThickness = 3.5,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(alignment: Alignment.center, children: <Widget>[
      LayoutBuilder(
          builder: (context, constraints) => Container(
              height: lineThickness,
              width: constraints.maxWidth - lineThickness * 2,
              color: lineColor)),
      Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(nbSteps, (index) {
            bool selected = index == selectedStep;

            return Material(
                shape: CircleBorder(),
                clipBehavior: Clip.antiAlias,
                child: InkResponse(
                    onTap: onTap != null ? onTap(index) : null,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(stepSize),
                      child: Container(
                        decoration: BoxDecoration(
                            color: selected ? stepSelectedColor : stepColor,
                            borderRadius: BorderRadius.circular(stepSize),
                            border: Border.all(
                                width: borderThickness, color: lineColor)),
                        height: selected ? stepSelectedSize : stepSize,
                        width: selected ? stepSelectedSize : stepSize,
                        child: Container(),
                      ),
                    )));
          }))
    ]);
  }
}
