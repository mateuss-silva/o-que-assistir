import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:o_que_assistir/app/core/common/extensions/string_extension.dart';
import '../stores/home_store.dart';

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

    store.getMovie(550);

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
      body: Observer(
        builder: (_) {
          if (store.loading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          return ListView(
            physics: const BouncingScrollPhysics(),
            children: [
              Stack(
                children: [
                  Image.network(
                    store.movie.posterPath.imageUrl,
                    height: 512,
                    width: double.maxFinite,
                    fit: BoxFit.fitWidth,
                  ),
                  Positioned(
                    bottom: 10,
                    right: 0,
                    left: 0,
                    child: Center(
                      child: OutlinedButton(
                          onPressed: () {},
                          style: OutlinedButton.styleFrom(
                            foregroundColor: Colors.white,
                            backgroundColor: Colors.black,
                            side:
                                const BorderSide(color: Colors.white, width: 1),
                          ),
                          child: const Text('ir para site')),
                    ),
                  ),
                ],
              ),
              Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.only(top: 8.0),
                child: Text(
                  store.movie.title,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    SizedBox(
                      height: 34,
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          SizedBox(
                            height: 34,
                            width: 34,
                            child: CircularProgressIndicator(
                              value: store.movie.popularity / 100,
                              strokeWidth: 4,
                              backgroundColor: Colors.grey,
                              valueColor:
                                  const AlwaysStoppedAnimation(Colors.green),
                            ),
                          ),
                          Text(
                            '${store.movie.popularity.toStringAsFixed(0)}%',
                            style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 8),
                    const Text(
                      "Popularidade",
                      style:
                          TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(width: 16),
                    Text(
                      store.movie.releaseDate.year.toString(),
                      style: const TextStyle(
                          fontSize: 12, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(width: 16),
                    Text(
                      store.movie.movieDuration(),
                      style: const TextStyle(
                          fontSize: 12, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(width: 16),
                    Text(
                      store.movie.genres.first.name,
                      style: const TextStyle(
                          fontSize: 12, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(width: 16),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Sinopse",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      store.movie.overview,
                      style: const TextStyle(fontSize: 14),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 32),
            ],
          );
        },
      ),
    );
  }
}
