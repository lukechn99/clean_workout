import 'package:clean_workout/pages/favorites_page.dart';
import 'package:clean_workout/pages/generator_page.dart';
import 'package:clean_workout/repos/documents_repo.dart';
import 'package:flutter/material.dart';
import 'package:clean_workout/pages/workout_page.dart';
import 'package:clean_workout/states/app_state.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MyAppState(),
      child: MaterialApp(
        title: 'Clean Workout',
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
        ),
        home: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final documentsRepo = DocumentsRepo();

    Widget page;
    switch (selectedIndex) {
      case 0:
        page = WorkoutPage();
        break;
      case 1:
        page = GeneratorPage();
        break;
      case 2:
        page = FavoritesPage(documentsRepo: documentsRepo);
        break;
      default:
        throw UnimplementedError('no widget for $selectedIndex');
    }

    return LayoutBuilder(builder: (context, constraints) {
      return Scaffold(
        body: Row(
          children: [
            SafeArea(
              child: NavigationRail(
                extended: constraints.maxWidth >= 600,
                destinations: [
                  NavigationRailDestination(
                    icon: Icon(Icons.fitness_center_rounded),
                    label: Text('Workout'),
                  ),
                  NavigationRailDestination(
                    icon: Icon(Icons.area_chart_rounded),
                    label: Text('Analytics'),
                  ),
                  // NavigationRailDestination(
                  //   icon: Icon(Icons.home),
                  //   label: Text('Home'),
                  // ),
                  NavigationRailDestination(
                    icon: Icon(Icons.favorite),
                    label: Text('Favorites'),
                  ),
                ],
                selectedIndex: selectedIndex,
                onDestinationSelected: (value) {
                  setState(() {
                    selectedIndex = value;
                  });
                },
              ),
            ),
            Expanded(
              child: Container(
                color: Theme.of(context).colorScheme.primaryContainer,
                child: page,
              ),
            ),
          ],
        ),
      );
    });
  }
}
