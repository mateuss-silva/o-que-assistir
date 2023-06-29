import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../stores/home_store.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key? key, this.title = 'Home'}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final HomeStore store;

  @override
  void initState() {
    super.initState();
    store = Modular.get<HomeStore>();
  }

  @override
  Widget build(BuildContext context) {
    var client = http.Client();
    // the movie db
    var url =
        "https://api.themoviedb.org/3/movie/550?api_key=31cbec5b1b10f9fb042773c324c96b14";

    client.get(Uri.parse(url)).then((value) {
      log(value.body);
    });
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CupertinoButton.filled(
              child: const Text("Navigate"),
              onPressed: () {
                Modular.to.navigate("/auth");
              },
            ),
            Observer(
              builder: (context) => Text('${store.counter}'),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          store.increment();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
