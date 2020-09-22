import 'package:deep_and_meaningful/routes.dart';
import 'package:deep_and_meaningful/screens/category_screen.dart';
import 'package:deep_and_meaningful/widgets/button.dart';
import 'package:deep_and_meaningful/widgets/orientation_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return OrientationList(
      padding: const EdgeInsets.all(20.0),
      children: <Widget>[
        Container(
          margin: const EdgeInsets.fromLTRB(10, 16, 10, 6),
          child: SvgPicture.asset(
            'assets/conversation-bold.svg',
            color: Theme.of(context).primaryColor,
            height: 100,
          ),
        ),
        Container(
          margin: const EdgeInsets.all(10.0),
          child: Text('Deep and Meaningful',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headline1),
        ),
        Container(
          margin: const EdgeInsets.all(10.0),
          child: Text('Ask someone you care about a question.',
              textAlign: TextAlign.center, style: TextStyle(fontSize: 26.4)),
        ),
      ],
      button: CustomButton(
        text: "Next",
        onPressed: () {
          Navigator.of(context).push(customRoute(CategoryScreen()));
        },
      ),
    );
  }
}
