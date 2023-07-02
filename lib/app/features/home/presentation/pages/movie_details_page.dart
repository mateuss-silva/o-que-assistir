import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:o_que_assistir/app/core/common/extensions/string_extension.dart';
import 'package:o_que_assistir/app/features/home/presentation/stores/movie_details_store.dart';

class MovieDetailsPage extends StatefulWidget {
  final int movieId;
  const MovieDetailsPage({super.key, required this.movieId});

  @override
  State<MovieDetailsPage> createState() => _MovieDetailsPageState();
}

class _MovieDetailsPageState extends State<MovieDetailsPage> {
  late final MovieDetailsStore store;

  @override
  void initState() {
    super.initState();
    store = Modular.get<MovieDetailsStore>();

    store.getMovie(widget.movieId);

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
    List<({String name, String image})> atores = [
      (
        name: "Edward Norton",
        image: "https://image.tmdb.org/t/p/w500/5XBzD5WuTyVQZeS4VI25z2moMeY.jpg"
      ),
      (
        name: "Brad Pitt",
        image: "https://image.tmdb.org/t/p/w500/sra9JWUaXGs4NlAueA7CpuYzLCk.jpg"
      ),
      (
        name: "Helena Bonham Carter",
        image: "https://image.tmdb.org/t/p/w500/DDeITcCpnBd0CkAIRPhggy9bt5.jpg"
      ),
      (
        name: "Meat Loaf",
        image: "https://image.tmdb.org/t/p/w500/7gKLR1u46OB8WJ6m06LemNBCMx6.jpg"
      ),
      (
        name: "Jared Leto",
        image: "https://image.tmdb.org/t/p/w500/ca3x0OfIKbJppZh8S1Alx3GfUZO.jpg"
      ),
      (
        name: "Zach Grenier",
        image: "https://image.tmdb.org/t/p/w500/fSyQKZO39sUsqY283GXiScOg3Hi.jpg"
      ),
      (
        name: "Holt McCallany",
        image: "https://image.tmdb.org/t/p/w500/a5ax2ICLrV6l0T74OSFvzssCQyQ.jpg"
      ),
    ];
    return Scaffold(
      body: Observer(
        builder: (_) {
          if (store.loading) {
            return const Center(
              child: CircularProgressIndicator.adaptive(),
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
                  CupertinoButton(
                    child: Container(
                      padding: const EdgeInsets.only(
                          right: 2, left: 12, bottom: 6, top: 6),
                      decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(32),
                      ),
                      child: const Icon(
                        Icons.arrow_back_ios,
                        color: Colors.white,
                      ),
                    ),
                    onPressed: () {
                      Modular.to.pop();
                    },
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
              Align(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(
                        height: 28,
                        width: 28,
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            CircularProgressIndicator(
                              value: store.movie.voteAverage / 10,
                              strokeWidth: 2,
                              backgroundColor: Colors.grey,
                              valueColor:
                                  const AlwaysStoppedAnimation(Colors.green),
                            ),
                            Text(
                              '${(store.movie.voteAverage * 10).floor()}%',
                              style: const TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 8),
                      const Text(
                        "Popularidade",
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.bold),
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
                        store.movie.genres.first.name ?? '',
                        style: const TextStyle(
                            fontSize: 12, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 8.0, bottom: 8.0),
                child: Text(
                  "Atores",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                height: 80,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: atores.length,
                  separatorBuilder: (context, index) =>
                      const SizedBox(width: 8),
                  itemBuilder: (context, index) {
                    final ator = atores[index];
                    var child = SizedBox(
                      width: 60,
                      height: 60,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          CircleAvatar(
                            maxRadius: 24,
                            foregroundImage: NetworkImage(ator.image),
                          ),
                          Text(
                            ator.name,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    );
                    if (index == 0) {
                      return Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: child,
                      );
                    } else if (index == 9) {
                      return Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: child,
                      );
                    }
                    return child;
                  },
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
