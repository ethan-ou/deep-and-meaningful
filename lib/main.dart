import 'package:deep_and_meaningful/providers/app_state.dart';
import 'package:deep_and_meaningful/providers/theme_state.dart';
import 'package:deep_and_meaningful/screens/splash_screen.dart';
import 'package:deep_and_meaningful/services/question_loader.dart';
import 'package:deep_and_meaningful/styles.dart';
import 'package:flutter/material.dart';
import 'package:deep_and_meaningful/screens/home_screen.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

void main() => runApp(DeepAndMeaningful());

class DeepAndMeaningful extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => AppState()),
          ChangeNotifierProvider(create: (context) => ThemeState())
        ],
        builder: (context, child) => MaterialApp(
            title: 'Deep and Meaningful',
            debugShowCheckedModeBanner: false,
            themeMode: Provider.of<ThemeState>(context).themeMode,
            theme: ThemeData(
                brightness: Brightness.light,
                primaryColor: AppColor.darkBlue,
                textTheme: TextTheme(
                    headline1: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 56,
                        color: Theme.of(context).textTheme.bodyText2.color),
                    headline2: TextStyle(
                        fontSize: 42,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).textTheme.bodyText2.color))),
            darkTheme: ThemeData(
              brightness: Brightness.dark,
              primaryColor: AppColor.lightBlue,
              textTheme: TextTheme(
                  headline1: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 56,
                      color: AppColor.lightBlue),
                  headline2: TextStyle(
                      fontSize: 42,
                      fontWeight: FontWeight.bold,
                      color: AppColor.white)),
            ),
            home: FutureBuilder(
              future: QuestionLoader.load(),
              builder: (context, snapshot) {
                Future.microtask(() =>
                    Provider.of<AppState>(context, listen: false)
                        .populateQuestions(snapshot.data));

                if (snapshot.connectionState == ConnectionState.done) {
                  return HomeScreen();
                } else {
                  return SplashScreen();
                }
              },
            )));
  }
}
