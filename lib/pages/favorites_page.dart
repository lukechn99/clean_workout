import 'package:clean_workout/repos/documents_repo.dart';
import 'package:flutter/material.dart';
import 'package:clean_workout/states/app_state.dart';
import 'package:provider/provider.dart';
import 'dart:io';

class FavoritesPage extends StatefulWidget {
  const FavoritesPage({super.key, required this.documentsRepo});

  final DocumentsRepo documentsRepo;

  @override
  State<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  String _json = "";

  @override
  void initState() {
    super.initState();
    widget.documentsRepo.readJson().then((value) {
      setState(() {
        _json = value;
      });
    });
  }

  Future<File> _writeJson(String json) {
    setState(() {
      _json = json;
    });

    // Write the variable as a string to the file.
    return widget.documentsRepo.writeJson(_json);
  }

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();

    if (appState.favorites.isEmpty) {
      return Center(
        child: Text('No favorites yet.'),
      );
    }

    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.all(20),
          child: Text('You have '
              '${appState.favorites.length} favorites:'),
        ),
        for (var pair in appState.favorites)
          ListTile(
            leading: Icon(Icons.favorite),
            title: Text(pair.asLowerCase),
          ),
        Padding(
          padding: const EdgeInsets.all(20),
          child: Text('Here are your favorites from local document storage'),
        ),
        Padding(
          padding: const EdgeInsets.all(20),
          child: Text(_json),
        ),
      ],
    );
  }
}
