import 'package:deep_and_meaningful/providers/app_state.dart';
import 'package:deep_and_meaningful/routes.dart';
import 'package:deep_and_meaningful/screens/question_screen.dart';
import 'package:deep_and_meaningful/styles.dart';
import 'package:deep_and_meaningful/widgets/button.dart';
import 'package:deep_and_meaningful/widgets/category_selector.dart';
import 'package:deep_and_meaningful/widgets/orientation_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class CategoryScreen extends StatefulWidget {
  @override
  _CategoryScreenState createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  int _category = 0;

  final categoryTypes = [
    {
      'img': 'assets/dance.svg',
      'title': 'Fun',
      'description':
          "Silly things you'd want to talk about when relaxing at a party."
    },
    {
      'img': 'assets/park.svg',
      'title': 'Personal',
      'description':
          "For the times when you're curious about a friend or someone new."
    },
    {
      'img': 'assets/neptune.svg',
      'title': 'Deep',
      'description':
          "The earth-shattering questions you'd ask on a midnight drive."
    },
    {
      'img': 'assets/snuggle.svg',
      'title': 'Intimate',
      'description':
          "See how your close friend or partner sees you. All deep questions included."
    }
  ];

  void initState() {
    super.initState();
    _category = context.read<AppState>().category;
  }

  @override
  Widget build(BuildContext context) {
    return OrientationList(
        padding: const EdgeInsets.all(20.0),
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            margin: const EdgeInsets.fromLTRB(8.0, 10.0, 8.0, 6.0),
            child: Text('What style of questions?',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headline2),
          ),
          Container(
            margin: const EdgeInsets.all(20.0),
            child: SvgPicture.asset(
              "${categoryTypes[_category]['img']}",
              color: Theme.of(context).textTheme.headline1.color,
              height: 100,
            ),
          ),
          Container(
            margin: const EdgeInsets.all(6.0),
            child: Text(
              "${categoryTypes[_category]['title']}",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            margin:
                const EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
            child: CategorySelector(
                selectedStep: _category,
                nbSteps: 4,
                lineColor: Theme.of(context).textTheme.bodyText2.color,
                stepSelectedColor: AppColor.lightBlue,
                stepColor: Theme.of(context).scaffoldBackgroundColor,
                stepSize:
                    MediaQuery.of(context).orientation == Orientation.portrait
                        ? 40
                        : 50,
                stepSelectedSize:
                    MediaQuery.of(context).orientation == Orientation.portrait
                        ? 40
                        : 50,
                onTap: (i) => () => setState(() {
                      _category = i;
                    })),
          ),
          Container(
            margin: const EdgeInsets.all(12.0),
            child: Text("${categoryTypes[_category]['description']}",
                textAlign: TextAlign.center, style: TextStyle(fontSize: 24)),
          ),
        ],
        button: CustomButton(
          text: "Begin!",
          onPressed: () {
            Provider.of<AppState>(context, listen: false).category = _category;
            Navigator.of(context).push(customRoute(QuestionScreen()));
          },
        ));
  }
}
