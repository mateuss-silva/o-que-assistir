import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:o_que_assistir/app/core/common/extensions/string_extension.dart';
import 'package:o_que_assistir/app/features/home/presentation/stores/tv_serie_details_store.dart';
import 'package:o_que_assistir/app/features/home/presentation/widgets/cast_widget.dart';

class TVSerieDetailsPage extends StatefulWidget {
  final int tvSerieId;
  const TVSerieDetailsPage({super.key, required this.tvSerieId});

  @override
  State<TVSerieDetailsPage> createState() => _TVSerieDetailsPageState();
}

class _TVSerieDetailsPageState extends State<TVSerieDetailsPage> {
  late final TVSerieDetailsStore store;

  @override
  void initState() {
    super.initState();
    store = Modular.get<TVSerieDetailsStore>();

    store.getTVSerie(widget.tvSerieId);

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
              child: CircularProgressIndicator.adaptive(),
            );
          }

          return ListView(
            physics: const BouncingScrollPhysics(),
            children: [
              Stack(
                children: [
                  Image.network(
                    store.tvSerie.posterPath.imageUrl,
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
                padding: const EdgeInsets.only(top: 8.0, left: 8, right: 8),
                child: Text(
                  store.tvSerie.name,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Align(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Wrap(
                    crossAxisAlignment: WrapCrossAlignment.center,
                    spacing: 8,
                    children: [
                      SizedBox(
                        height: 28,
                        width: 28,
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            CircularProgressIndicator(
                              value: store.tvSerie.voteAverage / 10,
                              strokeWidth: 2,
                              backgroundColor: Colors.grey,
                              valueColor:
                                  const AlwaysStoppedAnimation(Colors.green),
                            ),
                            Text(
                              '${(store.tvSerie.voteAverage * 10).floor()}%',
                              style: const TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Text(
                        "Popularidade",
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        store.tvSerie.firstAirDate.year.toString(),
                        style: const TextStyle(
                            fontSize: 12, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        store.tvSerie.genres.first.name ?? '',
                        style: const TextStyle(
                            fontSize: 12, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        store.tvSerie.seasons,
                        style: const TextStyle(
                            fontSize: 12, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
              CastWidget(cast: store.cast),
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
                      store.tvSerie.overview,
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
