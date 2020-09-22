import 'package:deep_and_meaningful/models/question.dart';
import 'package:deep_and_meaningful/providers/app_state.dart';
import 'package:deep_and_meaningful/providers/theme_state.dart';
import 'package:deep_and_meaningful/routes.dart';
import 'package:deep_and_meaningful/screens/category_screen.dart';
import 'package:deep_and_meaningful/widgets/button.dart';
import 'package:deep_and_meaningful/widgets/orientation_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:deep_and_meaningful/utils.dart';
import 'package:share/share.dart';

class QuestionScreen extends StatefulWidget {
  @override
  _QuestionScreenState createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  int _index = 0;
  List<Question> _activeQuestions = [];

  initState() {
    super.initState();
    _activeQuestions = context.read<AppState>().getQuestions();
  }

  void next(List<Question> cb) {
    if (_index == _activeQuestions.length - 1) {
      setState(() {
        _activeQuestions.addAll(cb);
      });
    }

    setState(() {
      _index++;
    });
  }

  void prev() {
    if (_index > 0) {
      setState(() {
        _index--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Question question = _activeQuestions[_index];

    return OrientationList(
      padding: const EdgeInsets.only(left: 8.0, bottom: 8.0, right: 8.0),
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        ButtonBar(alignment: MainAxisAlignment.spaceBetween, children: <Widget>[
          IconButton(
              icon: SvgPicture.asset('assets/moon-solid.svg',
                  color: Theme.of(context).primaryColor),
              iconSize: 36,
              onPressed: () {
                Provider.of<ThemeState>(context, listen: false)
                    .toggleThemeMode(Theme.of(context).brightness);
              }),
          IconButton(
            icon: SvgPicture.asset('assets/chat-bold.svg',
                color: Theme.of(context).primaryColor),
            iconSize: 45,
            onPressed: () {
              Navigator.of(context).push(customRoute(CategoryScreen()));
            },
          ),
          IconButton(
            icon: SvgPicture.asset('assets/undo-alt-solid.svg',
                color: Theme.of(context).primaryColor),
            iconSize: 40,
            onPressed: () {
              prev();
            },
          )
        ]),
        SizedBox(height: 10),
        Container(
          margin: const EdgeInsets.all(10.0),
          child: Text(
            '${capitalize(question.type)}',
            style:
                Theme.of(context).textTheme.headline1.copyWith(fontSize: 48.0),
          ),
        ),
        Consumer<AppState>(
            builder: (context, app, child) => Material(
                child: InkWell(
                    borderRadius: BorderRadius.all(Radius.circular(12.0)),
                    onLongPress: () => Share.share('${question.question}'),
                    child: Container(
                      margin: const EdgeInsets.all(10.0),
                      child: Text('${question.question}',
                          style: TextStyle(fontSize: 26.4)),
                    )))),
      ],
      button: CustomButton(
        text: "Next",
        onPressed: () {
          next(Provider.of<AppState>(context, listen: false).getQuestions());
        },
      ),
    );
  }
}
