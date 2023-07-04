import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:o_que_assistir/app/features/home/presentation/widgets/loading_categories.dart';
import 'package:o_que_assistir/app/features/home/presentation/widgets/movies_categories_widget.dart';
import '../stores/home_store.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final HomeStore store;

  @override
  void initState() {
    super.initState();
    store = Modular.get<HomeStore>();

    store.getMovies();

    store.errorMessageStream.listen(_showErrorMessage);
  }

  _showErrorMessage(String? message) {
    if (message != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(message),
          backgroundColor: Colors.red[500],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          const SizedBox(height: 16),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: "Pesquisar filmes e séries...",
                contentPadding: EdgeInsets.zero,
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(32),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),
          Observer(builder: (_) {
            return Align(
              child: ToggleButtons(
                borderRadius: BorderRadius.circular(32),
                onPressed: (_) {
                  store.setShowMovies(!store.showMovies);

                  if (store.showMovies) {
                    store.getMovies();
                  } else {
                    store.getTVSeries();
                  }
                },
                isSelected: store.showMovieOrSeries,
                children: const [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Text("Filmes"),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Text("Séries"),
                  ),
                ],
              ),
            );
          }),
          Observer(
            builder: (_) {
              if (store.loading) {
                return const LoadingCategoriesWidget();
              }

              return store.showMovies
                  ? const MoviesCategoriesWidget()
                  : Container();
            },
          ),
          const SizedBox(height: 32),
        ],
      ),
    );
  }
}
