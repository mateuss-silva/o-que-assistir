import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:o_que_assistir/app/features/home/presentation/stores/home_store.dart';
import 'package:o_que_assistir/app/features/home/presentation/widgets/tv_series_widget.dart';

class TVSeriesCategoriesWidget extends StatelessWidget {
  const TVSeriesCategoriesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeStore store = Modular.get<HomeStore>();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TVSeriesWidget(
          tvSeries: store.popularTVSeries,
          title: "Populares agora",
        ),
        TVSeriesWidget(
          tvSeries: store.topRatedTVSeries,
          title: "Mais bem avaliados",
        ),
        TVSeriesWidget(
          tvSeries: store.airingTodayTVSeries,
          title: "No ar hoje",
        ),
        TVSeriesWidget(
          tvSeries: store.onTheAirTVSeries,
          title: "No Ar",
        ),
      ],
    );
  }
}
