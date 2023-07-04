import 'package:flutter/material.dart';
import 'package:o_que_assistir/app/features/home/domain/entities/tv_serie_entity.dart';
import 'package:o_que_assistir/app/features/home/presentation/widgets/tv_serie_card_widget.dart';

class TVSeriesWidget extends StatelessWidget {
  final List<TVSerieEntity> tvSeries;
  final String title;
  const TVSeriesWidget({
    super.key,
    required this.tvSeries,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w300,
            ),
          ),
        ),
        SizedBox(
          height: 200,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: tvSeries.length,
            separatorBuilder: (context, index) => const Divider(),
            itemBuilder: (context, index) {
              final tvSerie = tvSeries[index];
              final child = TVSerieCardWidget(tvSerie: tvSerie);
              if (index == 0) {
                return Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: child,
                );
              } else if (index == tvSeries.length) {
                return Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: child,
                );
              }
              return child;
            },
          ),
        ),
      ],
    );
  }
}
