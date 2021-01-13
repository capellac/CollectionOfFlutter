import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trial_4/screens/each_phrasal_verb_screen.dart';
import 'package:trial_4/screens/home_units_screen.dart';

import './screens/each_phrasal_verb_screen.dart';
import './providers/phrasal_verbs_provider.dart';
import './screens/each_unit_screen.dart';
import './screens/home_units_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<PhrasalVerbsProvider>(
          create: (_) => PhrasalVerbsProvider(),
        ),
      ],
      child: MaterialApp(
        title: "Phrasal Verbs",
        darkTheme: ThemeData.dark(),
        home: HomeUnitsScreen(),
        routes: {
          EachUnitScreen.screenName: (ctx) => EachUnitScreen(),
          EachPhrasalVerbScreen.screenName: (ctx) => EachPhrasalVerbScreen(),
        },
      ),
    );
  }
}
