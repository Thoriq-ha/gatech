import 'package:flutter/material.dart';
import 'package:gatech/viewmodels/detail_viewmodel.dart';
import 'package:gatech/viewmodels/game_viewmodel.dart';
import 'package:gatech/views/onboarding_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: GameViewModel(),
        ),
        ChangeNotifierProvider.value(
          value: DetailViewModel(),
        ),
      ],
      child: MaterialApp(
        title: 'Gatech',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          textTheme: GoogleFonts.robotoTextTheme(
            Theme.of(context).textTheme,
          ),
        ),
        debugShowCheckedModeBanner: false,
        home: OnboardingScreen(),
      ),
    );
  }
}
