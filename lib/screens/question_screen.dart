import 'package:deep_and_meaningful/providers/app_state.dart';
import 'package:deep_and_meaningful/providers/theme_state.dart';
import 'package:deep_and_meaningful/routes.dart';
import 'package:deep_and_meaningful/screens/category_screen.dart';
import 'package:deep_and_meaningful/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:deep_and_meaningful/utils.dart';

class QuestionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 8.0, bottom: 8.0, right: 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              ButtonBar(
                  alignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
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
                        Navigator.of(context)
                            .push(customRoute(CategoryScreen()));
                      },
                    ),
                    IconButton(
                      icon: SvgPicture.asset('assets/undo-alt-solid.svg',
                          color: Theme.of(context).primaryColor),
                      iconSize: 40,
                      onPressed: () {
                        Provider.of<AppState>(context, listen: false).prev();
                      },
                    )
                  ]),
              SizedBox(height: 10),
              Consumer<AppState>(
                  builder: (context, app, child) => Container(
                        margin: const EdgeInsets.all(10.0),
                        child: Text(
                          '${capitalize(app.question.type)}',
                          style: Theme.of(context)
                              .textTheme
                              .headline1
                              .copyWith(fontSize: 48.0),
                        ),
                      )),
              Consumer<AppState>(
                  builder: (context, app, child) => Container(
                        margin: const EdgeInsets.all(10.0),
                        child: Text('${app.question.question}',
                            style: TextStyle(fontSize: 26.4)),
                      )),
            ],
          ),
        ),
      ),
      floatingActionButton: CustomButton(
        text: "Next",
        onPressed: () {
          Provider.of<AppState>(context, listen: false).next();
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
