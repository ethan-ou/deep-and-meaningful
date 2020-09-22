import 'package:flutter/material.dart';

class OrientationList extends StatelessWidget {
  final Widget button;
  final CrossAxisAlignment crossAxisAlignment;
  final FloatingActionButtonLocation floatingActionButtonLocation;
  final List<Widget> children;
  final EdgeInsets padding;
  OrientationList(
      {this.button,
      this.crossAxisAlignment = CrossAxisAlignment.center,
      this.children,
      this.padding,
      this.floatingActionButtonLocation =
          FloatingActionButtonLocation.centerFloat});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: MediaQuery.of(context).orientation == Orientation.portrait
              ? Padding(
                  padding: padding,
                  child: Column(
                      crossAxisAlignment: crossAxisAlignment,
                      children: children))
              : ListView(
                  padding: padding,
                  children: [
                    ...children,
                    SizedBox(height: 15),
                    Align(child: button)
                  ],
                )),
      floatingActionButton:
          MediaQuery.of(context).orientation == Orientation.portrait
              ? button
              : null,
      floatingActionButtonLocation: floatingActionButtonLocation,
    );
  }
}
